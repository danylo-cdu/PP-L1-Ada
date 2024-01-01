with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

with Ada.Containers.Synchronized_Queue_Interfaces;
with Ada.Containers.Unbounded_Synchronized_Queues;
with Ada.Containers.Vectors;

procedure Main is
   package Int_Queue_Interface is new Ada.Containers
      .Synchronized_Queue_Interfaces
         (Integer);
   package Int_Queue is new Ada.Containers
      .Unbounded_Synchronized_Queues
         (Queue_Interfaces => Int_Queue_Interface);
   use Int_Queue;
   use Ada.Containers;

   Concurrency : constant Positive := 4;
   PayloadLength : constant Integer := 100_000;
   Terminate_All : Boolean := False;

   Queue : Int_Queue.Queue;

   protected type Queue_Interface is
      procedure Add (Item : Integer);
      procedure Remove (Item : out Integer);
      entry Notify_When_Empty;
   private
      Empty : Boolean := True;
   end Queue_Interface;

   protected body Queue_Interface is
      procedure Add (Item : Integer) is
      begin
         Int_Queue.Enqueue (Queue, Item);
         Empty := False;
      end Add;

      procedure Remove (Item : out Integer) is
      begin
         if Int_Queue.Current_Use (Queue) = 0 then
            Empty := True;
            Item := 0;
         else
            Int_Queue.Dequeue (Queue, Item);
         end if;
      end Remove;

      entry Notify_When_Empty when Empty is
      begin
         null;
      end Notify_When_Empty;
   end Queue_Interface;

   Queue_Access : Queue_Interface;

   type Worker_Status_Array is array (Positive range <>) of Boolean;
   protected type Status_Tracker is
      procedure Set_Status (Id : Integer; Is_Idle : Boolean);
      --  entry Notify_When_All_Idle;
   private
      Statuses : Worker_Status_Array (1 .. Concurrency) :=
         (others => True);
      All_Idle : Boolean := True;
   end Status_Tracker;

   protected body Status_Tracker is
      procedure Set_Status (Id : Integer; Is_Idle : Boolean) is
      begin
         Statuses (Id) := Is_Idle;
      end Set_Status;

      --  entry Notify_When_All_Idle when All_Idle is
      --  begin
      --     null;
      --  end Notify_When_All_Idle;

      --  function Get_Status (Id : Integer) return Boolean is
      --  begin
      --     return Statuses (Id);
      --  end Get_Status;
   end Status_Tracker;

   Tracker : Status_Tracker;

   type WorkArrayType is array (1 .. PayloadLength) of Integer;
   protected ProtectedWork is
      --  function GetArray return WorkArrayType;
      function GetLenght return Integer;
      procedure SetLength (Value : Integer);
      procedure SetAtIndex (Index : Integer; Value : Integer);
      function GetAtIndex (Index : Integer) return Integer;
   private
      WorkArray : WorkArrayType := (others => 1);
      WorkLengh : Integer       := PayloadLength;
   end ProtectedWork;

   protected body ProtectedWork is
      --  function GetArray return WorkArrayType is
      --  begin
      --     return WorkArray;
      --  end GetArray;

      function GetLenght return Integer is
      begin
         return WorkLengh;
      end GetLenght;

      procedure SetLength (Value : Integer) is
      begin
         WorkLengh := Value;
      end SetLength;

      function GetAtIndex (Index : Integer) return Integer is
      begin
         return WorkArray (Index);
      end GetAtIndex;

      procedure SetAtIndex (Index : Integer; Value : Integer) is
      begin
         WorkArray (Index) := Value;
      end SetAtIndex;
   end ProtectedWork;

   task type Worker_Task is
      entry Start (Task_Id : Integer);
      --  entry Report_Status (Is_Idle : out Boolean);
   end Worker_Task;

   task body Worker_Task is
      Id : Integer;
      Is_Idle : Boolean;

      Index : Integer;
   begin
      accept Start (Task_Id : Integer) do
         Id := Task_Id;
      end Start;
      loop
         Queue_Access.Remove (Index);
         if Index /= 0 then
            Tracker.Set_Status (Id, False);  -- Set status to busy

            ProtectedWork.SetAtIndex
            (Worker_Task.Index,
               ProtectedWork.GetAtIndex (Worker_Task.Index) +
               ProtectedWork.GetAtIndex
               (ProtectedWork.GetLenght - Worker_Task.Index + 1));

            Tracker.Set_Status (Id, True);  -- Set status back to idle
         end if;
         --  exit when Terminate_All;
      end loop;
   end Worker_Task;

   type Worker_Task_Access is access all Worker_Task;
   package Worker_Vectors is new Ada.Containers.Vectors
      (Index_Type => Positive, Element_Type => Worker_Task_Access);

   Workers : Worker_Vectors.Vector;

   WaveNumber         : Integer := 1;
   HalfTheArrayLength : Integer := 1;

   --  Tracing stuff
   Start_Time, End_Time : Time;
   Elapsed              : Time_Span;
begin

   Put_Line ("Spinning up " &
      Integer'Image (Concurrency) &
      " worker threads...");

   for I in 1 .. Concurrency loop
      Workers.Append (new Worker_Task);
      Workers (Workers.Last).Start (I);
   end loop;

   Put_Line ("Worker threads ready, 1s delay");
   delay 1.0;

   Start_Time := Clock;

   --  Main wave loop
   while ProtectedWork.GetLenght > 1 loop
      HalfTheArrayLength := ProtectedWork.GetLenght / 2;

      Put_Line
        ("Wave #" & Integer'Image (WaveNumber) & ": length is " &
         Integer'Image (ProtectedWork.GetLenght));

      for I in 1 .. HalfTheArrayLength loop
         Queue_Access.Add (I);
      end loop;

      Put_Line ("Wave #" &
         Integer'Image (WaveNumber) &
         ": tasks submitted, waiting");

      --  Wait for all tasks inb this wave to finish
      Queue_Access.Notify_When_Empty;

      Put_Line ("Wave #" &
         Integer'Image (WaveNumber) &
         ": tasks done");

      ProtectedWork.SetLength
        (HalfTheArrayLength + ProtectedWork.GetLenght mod 2);

      Put_Line ("Wave #" &
         Integer'Image (WaveNumber) &
         ": length done");

      WaveNumber := WaveNumber + 1;
   end loop;

   --  Capture end time and calculate elapsed time
   End_Time := Clock;
   Elapsed  := End_Time - Start_Time;

   --  Prints out the array
   --  for I of ProtectedWork.GetArray loop
   --     Put (Integer'Image (I)&", ");
   --  end loop;

   Put_Line
     ("DONE! Result is: " & Integer'Image (ProtectedWork.GetAtIndex (1)));

   Put_Line
     ("  Execution time: " & Duration'Image (To_Duration (Elapsed) * 1.0e3) &
      " ms");

   Terminate_All := True;
   Put_Line ("Terminate_All = " & Boolean'Image (Terminate_All));
   delay 0.1;

   --  for I in Workers'Range loop
   --     Workers(I).all'Wait_For_Completion;
   --  end loop;

   for I in 1 .. Concurrency loop
      Workers (I) := null;
   end loop;

   --  Clear the vector
   Workers.Clear;
   --  Put_Line("  Execution time: " &
   --    Duration'Image(To_Duration(Elapsed) * 1.0e9) &" ns");
end Main;