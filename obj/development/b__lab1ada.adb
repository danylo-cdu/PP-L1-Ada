pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lab1ada.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lab1ada.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E076 : Short_Integer; pragma Import (Ada, E076, "system__os_lib_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__exceptions_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__containers_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__io_exceptions_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "ada__numerics_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__strings__maps__constants_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "interfaces__c_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__exceptions_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "system__object_reader_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__dwarf_lines_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__soft_links__initialize_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__traceback__symbolic_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__img_int_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "system__img_uns_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ada__strings__utf_encoding_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__tags_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__strings__text_buffers_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "interfaces__c__strings_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "ada__streams_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__file_control_block_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__finalization_root_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "ada__finalization_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__file_io_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__task_info_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ada__real_time_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__text_io_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "system__tasking__initialization_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__tasking__protected_objects_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__tasking__protected_objects__entries_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__tasking__queuing_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "system__tasking__stages_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E190 := E190 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E154 := E154 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E164 := E164 - 1;
         F3;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Exception_Tracebacks_Symbolic : Integer;
      pragma Import (C, Exception_Tracebacks_Symbolic, "__gl_exception_tracebacks_symbolic");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, True, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, False, True, True, True, False, 
           False, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, False, False, False, False, False, True, False, 
           True, True, False, False, False, True, True, False, 
           False, False, True, False, False, True, True, False, 
           False, False, True, False, False, True, False, False, 
           False, True, False, True, True, True, False, False, 
           True, False, True, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, False, False, False, False, False, True, 
           True, False, True, False),
         Count => (0, 0, 0, 0, 0, 2, 1, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Exception_Tracebacks_Symbolic := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Containers'Elab_Spec;
      E046 := E046 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E072 := E072 + 1;
      Ada.Numerics'Elab_Spec;
      E030 := E030 + 1;
      Ada.Strings'Elab_Spec;
      E058 := E058 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E060 := E060 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E063 := E063 + 1;
      Interfaces.C'Elab_Spec;
      E083 := E083 + 1;
      System.Exceptions'Elab_Spec;
      E024 := E024 + 1;
      System.Object_Reader'Elab_Spec;
      E087 := E087 + 1;
      System.Dwarf_Lines'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E076 := E076 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E019 := E019 + 1;
      E011 := E011 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E045 := E045 + 1;
      System.Img_Int'Elab_Spec;
      E029 := E029 + 1;
      E006 := E006 + 1;
      System.Img_Uns'Elab_Spec;
      E067 := E067 + 1;
      E053 := E053 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E140 := E140 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E148 := E148 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E138 := E138 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E108 := E108 + 1;
      Ada.Streams'Elab_Spec;
      E156 := E156 + 1;
      System.File_Control_Block'Elab_Spec;
      E168 := E168 + 1;
      System.Finalization_Root'Elab_Spec;
      E167 := E167 + 1;
      Ada.Finalization'Elab_Spec;
      E165 := E165 + 1;
      System.File_Io'Elab_Body;
      E164 := E164 + 1;
      System.Task_Info'Elab_Spec;
      E128 := E128 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E102 := E102 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E154 := E154 + 1;
      System.Tasking.Initialization'Elab_Body;
      E186 := E186 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E174 := E174 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E190 := E190 + 1;
      System.Tasking.Queuing'Elab_Body;
      E194 := E194 + 1;
      System.Tasking.Stages'Elab_Body;
      E198 := E198 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lab1ada");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   D:\My\Edu\Multitasking\lab1ada\obj\development\lab1ada.o
   --   -LD:\My\Edu\Multitasking\lab1ada\obj\development\
   --   -LD:\My\Edu\Multitasking\lab1ada\obj\development\
   --   -LC:/users/rizorko/.config/alire/cache/dependencies/gnat_native_13.2.1_fa3c7439/lib/gcc/x86_64-w64-mingw32/13.2.0/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
