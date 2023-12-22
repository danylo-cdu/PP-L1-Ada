with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Lab1Ada is
   Concurrency   : constant Integer := 8;
   PayloadLength : constant Integer := 100_000;

   type WorkArrayType is array (1 .. PayloadLength) of Integer;

   protected ProtectedWork is
      function GetArray return WorkArrayType;
      function GetLenght return Integer;
      procedure SetLength (Value : Integer);
      procedure SetAtIndex (Index : Integer; Value : Integer);
      function GetAtIndex (Index : Integer) return Integer;
   private
      WorkArray : WorkArrayType := (others => 1);
      WorkLengh : Integer       := PayloadLength;
   end ProtectedWork;

   protected body ProtectedWork is
      function GetArray return WorkArrayType is
      begin
         return WorkArray;
      end GetArray;

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

   -- protected type Semaphore is
   --    entry Acquire;
   --    entry Release;
   --    function GetCount return Integer;
   -- private
   --    Count : Integer := Concurrency;
   -- end Semaphore;
   --
   -- protected body Semaphore is
   --    entry Acquire when Count > 0 is
   --    begin
   --       Count := Count - 1;
   --    end Acquire;
   --
   --    entry Release when True is
   --    begin
   --       Count := Count + 1;
   --    end Release;
   --
   --    function GetCount return Integer is
   --    begin
   --       return Count + 1;
   --    end GetCount;
   -- end Semaphore;
   --
   -- ConcurrencyLock : Semaphore;

   task type Simple_Task is
      entry Calculate (Index : Integer);
      entry Finish;
   end Simple_Task;

   task body Simple_Task is
      Index : Integer;
   begin
      accept Calculate (Index : Integer) do
         Simple_Task.Index := Index;
      end Calculate;

      -- TODO: latch stuff doesn't work :/
      -- ConcurrencyLock.Acquire;
      -- Put_Line ("Acquired: "&Integer'Image(ConcurrencyLock.GetCount));

      -- Put_Line ("Index: " & Integer'Image(Simple_Task.Index) & 
      --    "; Value by Index: "& Integer'Image (ProtectedWork.GetAtIndex(Simple_Task.Index)) & 
      --    "; Value by Index mirror: " & 
      --    Integer'Image (ProtectedWork.GetAtIndex(ProtectedWork.GetLenght - Simple_Task.Index + 1)));
      
      ProtectedWork.SetAtIndex
        (Simple_Task.Index,
         ProtectedWork.GetAtIndex (Simple_Task.Index) +
         ProtectedWork.GetAtIndex
           (ProtectedWork.GetLenght - Simple_Task.Index + 1));

      -- ConcurrencyLock.Release;
      -- Put_Line ("Released: "&Integer'Image(ConcurrencyLock.GetCount));
      accept Finish;
   end Simple_Task;

   type WorkerPtr is access all Simple_Task;
   type WorkerPtrArr is array (Positive range <>) of WorkerPtr;
   -- Workers : array (1 .. 100) of WorkerPtr;
   Workers : WorkerPtrArr (1 .. Concurrency);

   WaveNumber         : Integer := 1;
   AbsoluteIndex      : Integer := 1;
   HalfTheArrayLength : Integer := 1;

   -- Tracing stuff
   Start_Time, End_Time : Time;
   Elapsed              : Time_Span;
begin
   -- Capture start time
   Start_Time := Clock;

   -- Main wave loop
   while ProtectedWork.GetLenght > 1 loop
      Workers            := (others => null);
      HalfTheArrayLength := ProtectedWork.GetLenght / 2;

      Put_Line
        ("Wave #" & Integer'Image (WaveNumber) & ": length is " &
         Integer'Image (ProtectedWork.GetLenght));

      for BatchIndex in
        1 .. (HalfTheArrayLength + (Concurrency - 1)) / Concurrency
      loop
         -- Put_Line ("WorkLenght: "&Integer'Image (ProtectedWork.GetLenght)&", I: "&Integer'Image (I));

         -- This loop creates a batch of N=CONCURRENCY threads and waits for them to finish before creating a new batch
         for I in 1 .. Concurrency loop
            AbsoluteIndex := ((BatchIndex - 1) * Concurrency) + I;
            if AbsoluteIndex <= HalfTheArrayLength then
               -- Put_Line ("Submitting task in batch #"&Integer'Image(BatchIndex)&" with r_idx = "&Integer'Image(I)&" and a_idx = "&Integer'Image(AbsoluteIndex));
               Workers (I) := new Simple_Task;
               Workers (I).Calculate (Index => AbsoluteIndex);
            end if;
         end loop;

         -- Wait for all threads in a batch to finish
         for I in 1 .. Concurrency loop
            if Workers (I) /= null then
               Workers (I).Finish;
               Workers (I) := null;
            end if;
         end loop;

      end loop;

      Put_Line ("Wave #" & Integer'Image (WaveNumber) & ": tasks submitted");

      -- Wait for leftover tasks to finish
      for I in 1 .. Concurrency loop
         if Workers (I) /= null then
            Workers (I).Finish;
            Workers (I) := null;
         end if;
      end loop;

      Put_Line ("Wave #" & Integer'Image (WaveNumber) & ": tasks done");

      ProtectedWork.SetLength
        (HalfTheArrayLength + ProtectedWork.GetLenght mod 2);

      Put_Line ("Wave #" & Integer'Image (WaveNumber) & ": length done");

      WaveNumber := WaveNumber + 1;
   end loop;

   -- Capture end time and calculate elapsed time
   End_Time := Clock;
   Elapsed  := End_Time - Start_Time;

   -- Prints out the array
   -- for I of ProtectedWork.GetArray loop
   --    Put (Integer'Image (I)&", ");
   -- end loop;

   Put_Line
     ("DONE! Result is: " & Integer'Image (ProtectedWork.GetAtIndex (1)));

   Put_Line
     ("  Execution time: " & Duration'Image (To_Duration (Elapsed) * 1.0e3) &
      " ms");
   -- Put_Line("  Execution time: " &Duration'Image(To_Duration(Elapsed) * 1.0e9) &" ns");

end Lab1Ada;
