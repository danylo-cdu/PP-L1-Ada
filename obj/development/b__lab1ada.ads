pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 13.2.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_lab1ada" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#f504848d#;
   pragma Export (C, u00001, "lab1adaB");
   u00002 : constant Version_32 := 16#7320ff5f#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#e25e387f#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#5bea4c0b#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#ac4814eb#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#6dc27684#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#f0509fe6#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#8dcd0905#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#d4c699bf#;
   pragma Export (C, u00012, "system__secondary_stackB");
   u00013 : constant Version_32 := 16#d8122a51#;
   pragma Export (C, u00013, "system__secondary_stackS");
   u00014 : constant Version_32 := 16#821dff88#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#24c43b40#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#2a95d23d#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#5b04f702#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00018, "system__soft_links__initializeB");
   u00019 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00019, "system__soft_links__initializeS");
   u00020 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#508536fc#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#7d7be9ff#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#c2f520d4#;
   pragma Export (C, u00024, "system__exceptionsS");
   u00025 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00025, "system__exceptions__machineB");
   u00026 : constant Version_32 := 16#8bdfdbe3#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#c05ec7b5#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#80d3408e#;
   pragma Export (C, u00029, "system__img_intS");
   u00030 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00030, "ada__numericsS");
   u00031 : constant Version_32 := 16#174f5472#;
   pragma Export (C, u00031, "ada__numerics__big_numbersS");
   u00032 : constant Version_32 := 16#0a7ae0bf#;
   pragma Export (C, u00032, "system__unsigned_typesS");
   u00033 : constant Version_32 := 16#ecb207e8#;
   pragma Export (C, u00033, "system__val_intS");
   u00034 : constant Version_32 := 16#faac17dc#;
   pragma Export (C, u00034, "system__val_unsS");
   u00035 : constant Version_32 := 16#96e09402#;
   pragma Export (C, u00035, "system__val_utilB");
   u00036 : constant Version_32 := 16#c3954b6b#;
   pragma Export (C, u00036, "system__val_utilS");
   u00037 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00037, "system__case_utilB");
   u00038 : constant Version_32 := 16#3f4348b3#;
   pragma Export (C, u00038, "system__case_utilS");
   u00039 : constant Version_32 := 16#3f3fad5d#;
   pragma Export (C, u00039, "system__wid_unsS");
   u00040 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00040, "system__tracebackB");
   u00041 : constant Version_32 := 16#76ca6b5b#;
   pragma Export (C, u00041, "system__tracebackS");
   u00042 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#384c206a#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#6ba3967c#;
   pragma Export (C, u00044, "system__traceback__symbolicB");
   u00045 : constant Version_32 := 16#d9e66ad1#;
   pragma Export (C, u00045, "system__traceback__symbolicS");
   u00046 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00046, "ada__containersS");
   u00047 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00047, "ada__exceptions__tracebackB");
   u00048 : constant Version_32 := 16#eb07882c#;
   pragma Export (C, u00048, "ada__exceptions__tracebackS");
   u00049 : constant Version_32 := 16#6ef2c461#;
   pragma Export (C, u00049, "system__bounded_stringsB");
   u00050 : constant Version_32 := 16#87adbeff#;
   pragma Export (C, u00050, "system__bounded_stringsS");
   u00051 : constant Version_32 := 16#aec2a9b8#;
   pragma Export (C, u00051, "system__crtlS");
   u00052 : constant Version_32 := 16#9f199b4a#;
   pragma Export (C, u00052, "system__dwarf_linesB");
   u00053 : constant Version_32 := 16#17f6aaf0#;
   pragma Export (C, u00053, "system__dwarf_linesS");
   u00054 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00054, "ada__charactersS");
   u00055 : constant Version_32 := 16#f70a517e#;
   pragma Export (C, u00055, "ada__characters__handlingB");
   u00056 : constant Version_32 := 16#ea6baced#;
   pragma Export (C, u00056, "ada__characters__handlingS");
   u00057 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00057, "ada__characters__latin_1S");
   u00058 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00058, "ada__stringsS");
   u00059 : constant Version_32 := 16#16f45e54#;
   pragma Export (C, u00059, "ada__strings__mapsB");
   u00060 : constant Version_32 := 16#9df1863a#;
   pragma Export (C, u00060, "ada__strings__mapsS");
   u00061 : constant Version_32 := 16#96b40646#;
   pragma Export (C, u00061, "system__bit_opsB");
   u00062 : constant Version_32 := 16#3da333da#;
   pragma Export (C, u00062, "system__bit_opsS");
   u00063 : constant Version_32 := 16#4642cba6#;
   pragma Export (C, u00063, "ada__strings__maps__constantsS");
   u00064 : constant Version_32 := 16#15f799c2#;
   pragma Export (C, u00064, "interfacesS");
   u00065 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00065, "system__address_imageB");
   u00066 : constant Version_32 := 16#51bc02dc#;
   pragma Export (C, u00066, "system__address_imageS");
   u00067 : constant Version_32 := 16#7fca0124#;
   pragma Export (C, u00067, "system__img_unsS");
   u00068 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00068, "system__ioB");
   u00069 : constant Version_32 := 16#6e1268a9#;
   pragma Export (C, u00069, "system__ioS");
   u00070 : constant Version_32 := 16#b25b689d#;
   pragma Export (C, u00070, "system__mmapB");
   u00071 : constant Version_32 := 16#c87b9b1c#;
   pragma Export (C, u00071, "system__mmapS");
   u00072 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00072, "ada__io_exceptionsS");
   u00073 : constant Version_32 := 16#2e05e25c#;
   pragma Export (C, u00073, "system__mmap__os_interfaceB");
   u00074 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00074, "system__mmap__os_interfaceS");
   u00075 : constant Version_32 := 16#1d7382c4#;
   pragma Export (C, u00075, "system__os_libB");
   u00076 : constant Version_32 := 16#0a3c4fb9#;
   pragma Export (C, u00076, "system__os_libS");
   u00077 : constant Version_32 := 16#6e5d049a#;
   pragma Export (C, u00077, "system__atomic_operations__test_and_setB");
   u00078 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00078, "system__atomic_operations__test_and_setS");
   u00079 : constant Version_32 := 16#3733e5c3#;
   pragma Export (C, u00079, "system__atomic_operationsS");
   u00080 : constant Version_32 := 16#29cc6115#;
   pragma Export (C, u00080, "system__atomic_primitivesB");
   u00081 : constant Version_32 := 16#b719d7c7#;
   pragma Export (C, u00081, "system__atomic_primitivesS");
   u00082 : constant Version_32 := 16#545fe66d#;
   pragma Export (C, u00082, "interfaces__cB");
   u00083 : constant Version_32 := 16#9d395173#;
   pragma Export (C, u00083, "interfaces__cS");
   u00084 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00084, "system__stringsB");
   u00085 : constant Version_32 := 16#6bd29ffe#;
   pragma Export (C, u00085, "system__stringsS");
   u00086 : constant Version_32 := 16#2fdbc40e#;
   pragma Export (C, u00086, "system__object_readerB");
   u00087 : constant Version_32 := 16#e7c98bed#;
   pragma Export (C, u00087, "system__object_readerS");
   u00088 : constant Version_32 := 16#65ddb07c#;
   pragma Export (C, u00088, "system__val_lliS");
   u00089 : constant Version_32 := 16#d863c536#;
   pragma Export (C, u00089, "system__val_lluS");
   u00090 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00090, "system__exception_tracesB");
   u00091 : constant Version_32 := 16#1cc8f680#;
   pragma Export (C, u00091, "system__exception_tracesS");
   u00092 : constant Version_32 := 16#b9a6a00a#;
   pragma Export (C, u00092, "system__win32S");
   u00093 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00093, "system__wch_conB");
   u00094 : constant Version_32 := 16#2953bc85#;
   pragma Export (C, u00094, "system__wch_conS");
   u00095 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00095, "system__wch_stwB");
   u00096 : constant Version_32 := 16#04429084#;
   pragma Export (C, u00096, "system__wch_stwS");
   u00097 : constant Version_32 := 16#f8305de6#;
   pragma Export (C, u00097, "system__wch_cnvB");
   u00098 : constant Version_32 := 16#2f9376f5#;
   pragma Export (C, u00098, "system__wch_cnvS");
   u00099 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00099, "system__wch_jisB");
   u00100 : constant Version_32 := 16#9a2414df#;
   pragma Export (C, u00100, "system__wch_jisS");
   u00101 : constant Version_32 := 16#af7aa5ba#;
   pragma Export (C, u00101, "ada__real_timeB");
   u00102 : constant Version_32 := 16#a00d3370#;
   pragma Export (C, u00102, "ada__real_timeS");
   u00103 : constant Version_32 := 16#521b9a38#;
   pragma Export (C, u00103, "system__taskingB");
   u00104 : constant Version_32 := 16#73f397eb#;
   pragma Export (C, u00104, "system__taskingS");
   u00105 : constant Version_32 := 16#d39989e7#;
   pragma Export (C, u00105, "system__task_primitivesS");
   u00106 : constant Version_32 := 16#d4614729#;
   pragma Export (C, u00106, "system__os_interfaceS");
   u00107 : constant Version_32 := 16#f2c4b20c#;
   pragma Export (C, u00107, "interfaces__c__stringsB");
   u00108 : constant Version_32 := 16#a856e1a3#;
   pragma Export (C, u00108, "interfaces__c__stringsS");
   u00109 : constant Version_32 := 16#115f9df8#;
   pragma Export (C, u00109, "system__task_primitives__operationsB");
   u00110 : constant Version_32 := 16#82d9f445#;
   pragma Export (C, u00110, "system__task_primitives__operationsS");
   u00111 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00111, "system__float_controlB");
   u00112 : constant Version_32 := 16#10acdcda#;
   pragma Export (C, u00112, "system__float_controlS");
   u00113 : constant Version_32 := 16#8e230feb#;
   pragma Export (C, u00113, "system__interrupt_managementB");
   u00114 : constant Version_32 := 16#914408bd#;
   pragma Export (C, u00114, "system__interrupt_managementS");
   u00115 : constant Version_32 := 16#fe2ee843#;
   pragma Export (C, u00115, "system__multiprocessorsB");
   u00116 : constant Version_32 := 16#c8fc0095#;
   pragma Export (C, u00116, "system__multiprocessorsS");
   u00117 : constant Version_32 := 16#24ec69e6#;
   pragma Export (C, u00117, "system__os_primitivesB");
   u00118 : constant Version_32 := 16#f7adfa10#;
   pragma Export (C, u00118, "system__os_primitivesS");
   u00119 : constant Version_32 := 16#fa09c8ad#;
   pragma Export (C, u00119, "system__arith_64B");
   u00120 : constant Version_32 := 16#04f18b65#;
   pragma Export (C, u00120, "system__arith_64S");
   u00121 : constant Version_32 := 16#a3a15c7b#;
   pragma Export (C, u00121, "system__sparkS");
   u00122 : constant Version_32 := 16#812db2df#;
   pragma Export (C, u00122, "system__spark__cut_operationsB");
   u00123 : constant Version_32 := 16#46c019b4#;
   pragma Export (C, u00123, "system__spark__cut_operationsS");
   u00124 : constant Version_32 := 16#7d808794#;
   pragma Export (C, u00124, "system__task_lockB");
   u00125 : constant Version_32 := 16#91daa888#;
   pragma Export (C, u00125, "system__task_lockS");
   u00126 : constant Version_32 := 16#b8c476a4#;
   pragma Export (C, u00126, "system__win32__extS");
   u00127 : constant Version_32 := 16#ce7dfb56#;
   pragma Export (C, u00127, "system__task_infoB");
   u00128 : constant Version_32 := 16#85e3a76f#;
   pragma Export (C, u00128, "system__task_infoS");
   u00129 : constant Version_32 := 16#b296dd17#;
   pragma Export (C, u00129, "system__tasking__debugB");
   u00130 : constant Version_32 := 16#3812e344#;
   pragma Export (C, u00130, "system__tasking__debugS");
   u00131 : constant Version_32 := 16#ca878138#;
   pragma Export (C, u00131, "system__concat_2B");
   u00132 : constant Version_32 := 16#45abec11#;
   pragma Export (C, u00132, "system__concat_2S");
   u00133 : constant Version_32 := 16#752a67ed#;
   pragma Export (C, u00133, "system__concat_3B");
   u00134 : constant Version_32 := 16#7a2a8644#;
   pragma Export (C, u00134, "system__concat_3S");
   u00135 : constant Version_32 := 16#e5d09b61#;
   pragma Export (C, u00135, "system__stack_usageB");
   u00136 : constant Version_32 := 16#85272fa9#;
   pragma Export (C, u00136, "system__stack_usageS");
   u00137 : constant Version_32 := 16#a201b8c5#;
   pragma Export (C, u00137, "ada__strings__text_buffersB");
   u00138 : constant Version_32 := 16#a7cfd09b#;
   pragma Export (C, u00138, "ada__strings__text_buffersS");
   u00139 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00139, "ada__strings__utf_encodingB");
   u00140 : constant Version_32 := 16#4d0e0994#;
   pragma Export (C, u00140, "ada__strings__utf_encodingS");
   u00141 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00141, "ada__strings__utf_encoding__stringsB");
   u00142 : constant Version_32 := 16#b85ff4b6#;
   pragma Export (C, u00142, "ada__strings__utf_encoding__stringsS");
   u00143 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00143, "ada__strings__utf_encoding__wide_stringsB");
   u00144 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00144, "ada__strings__utf_encoding__wide_stringsS");
   u00145 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00145, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00146 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00146, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00147 : constant Version_32 := 16#f38d604a#;
   pragma Export (C, u00147, "ada__tagsB");
   u00148 : constant Version_32 := 16#4d1deaec#;
   pragma Export (C, u00148, "ada__tagsS");
   u00149 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00149, "system__htableB");
   u00150 : constant Version_32 := 16#7189c70d#;
   pragma Export (C, u00150, "system__htableS");
   u00151 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00151, "system__string_hashB");
   u00152 : constant Version_32 := 16#d6cc4772#;
   pragma Export (C, u00152, "system__string_hashS");
   u00153 : constant Version_32 := 16#67eb6d5a#;
   pragma Export (C, u00153, "ada__text_ioB");
   u00154 : constant Version_32 := 16#8ecc2275#;
   pragma Export (C, u00154, "ada__text_ioS");
   u00155 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00155, "ada__streamsB");
   u00156 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00156, "ada__streamsS");
   u00157 : constant Version_32 := 16#abd3c34b#;
   pragma Export (C, u00157, "system__put_imagesB");
   u00158 : constant Version_32 := 16#ecfe98f9#;
   pragma Export (C, u00158, "system__put_imagesS");
   u00159 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00159, "ada__strings__text_buffers__utilsB");
   u00160 : constant Version_32 := 16#89062ac3#;
   pragma Export (C, u00160, "ada__strings__text_buffers__utilsS");
   u00161 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00161, "interfaces__c_streamsB");
   u00162 : constant Version_32 := 16#7acc80b4#;
   pragma Export (C, u00162, "interfaces__c_streamsS");
   u00163 : constant Version_32 := 16#1aa716c1#;
   pragma Export (C, u00163, "system__file_ioB");
   u00164 : constant Version_32 := 16#8cf25ab3#;
   pragma Export (C, u00164, "system__file_ioS");
   u00165 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00165, "ada__finalizationS");
   u00166 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00166, "system__finalization_rootB");
   u00167 : constant Version_32 := 16#bfa2ec76#;
   pragma Export (C, u00167, "system__finalization_rootS");
   u00168 : constant Version_32 := 16#52a168f7#;
   pragma Export (C, u00168, "system__file_control_blockS");
   u00169 : constant Version_32 := 16#9d3a7c3a#;
   pragma Export (C, u00169, "system__img_fixed_64S");
   u00170 : constant Version_32 := 16#8e6355b7#;
   pragma Export (C, u00170, "system__exn_lliS");
   u00171 : constant Version_32 := 16#4f0058da#;
   pragma Export (C, u00171, "system__img_utilB");
   u00172 : constant Version_32 := 16#87493b5f#;
   pragma Export (C, u00172, "system__img_utilS");
   u00173 : constant Version_32 := 16#22d1a9c4#;
   pragma Export (C, u00173, "system__tasking__protected_objectsB");
   u00174 : constant Version_32 := 16#a211a246#;
   pragma Export (C, u00174, "system__tasking__protected_objectsS");
   u00175 : constant Version_32 := 16#6503b451#;
   pragma Export (C, u00175, "system__soft_links__taskingB");
   u00176 : constant Version_32 := 16#917fc4d2#;
   pragma Export (C, u00176, "system__soft_links__taskingS");
   u00177 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00177, "ada__exceptions__is_null_occurrenceB");
   u00178 : constant Version_32 := 16#e2b3c9ca#;
   pragma Export (C, u00178, "ada__exceptions__is_null_occurrenceS");
   u00179 : constant Version_32 := 16#4857f38e#;
   pragma Export (C, u00179, "system__tasking__rendezvousB");
   u00180 : constant Version_32 := 16#e26d829c#;
   pragma Export (C, u00180, "system__tasking__rendezvousS");
   u00181 : constant Version_32 := 16#49c205ec#;
   pragma Export (C, u00181, "system__restrictionsB");
   u00182 : constant Version_32 := 16#4943a4b3#;
   pragma Export (C, u00182, "system__restrictionsS");
   u00183 : constant Version_32 := 16#c1f64448#;
   pragma Export (C, u00183, "system__tasking__entry_callsB");
   u00184 : constant Version_32 := 16#d453bba7#;
   pragma Export (C, u00184, "system__tasking__entry_callsS");
   u00185 : constant Version_32 := 16#527d3fec#;
   pragma Export (C, u00185, "system__tasking__initializationB");
   u00186 : constant Version_32 := 16#4b32ba0f#;
   pragma Export (C, u00186, "system__tasking__initializationS");
   u00187 : constant Version_32 := 16#d5634deb#;
   pragma Export (C, u00187, "system__tasking__task_attributesB");
   u00188 : constant Version_32 := 16#fb86dea5#;
   pragma Export (C, u00188, "system__tasking__task_attributesS");
   u00189 : constant Version_32 := 16#472ea76a#;
   pragma Export (C, u00189, "system__tasking__protected_objects__entriesB");
   u00190 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00190, "system__tasking__protected_objects__entriesS");
   u00191 : constant Version_32 := 16#95ec39a0#;
   pragma Export (C, u00191, "system__tasking__protected_objects__operationsB");
   u00192 : constant Version_32 := 16#b9523220#;
   pragma Export (C, u00192, "system__tasking__protected_objects__operationsS");
   u00193 : constant Version_32 := 16#91c1d62b#;
   pragma Export (C, u00193, "system__tasking__queuingB");
   u00194 : constant Version_32 := 16#f5dd32a7#;
   pragma Export (C, u00194, "system__tasking__queuingS");
   u00195 : constant Version_32 := 16#0044c253#;
   pragma Export (C, u00195, "system__tasking__utilitiesB");
   u00196 : constant Version_32 := 16#ed497941#;
   pragma Export (C, u00196, "system__tasking__utilitiesS");
   u00197 : constant Version_32 := 16#2242766f#;
   pragma Export (C, u00197, "system__tasking__stagesB");
   u00198 : constant Version_32 := 16#ce732888#;
   pragma Export (C, u00198, "system__tasking__stagesS");
   u00199 : constant Version_32 := 16#2d236812#;
   pragma Export (C, u00199, "ada__task_initializationB");
   u00200 : constant Version_32 := 16#d7b0c315#;
   pragma Export (C, u00200, "ada__task_initializationS");
   u00201 : constant Version_32 := 16#1982dcd0#;
   pragma Export (C, u00201, "system__memoryB");
   u00202 : constant Version_32 := 16#abd4ad36#;
   pragma Export (C, u00202, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  ada.task_initialization%s
   --  ada.task_initialization%b
   --  interfaces%s
   --  system%s
   --  system.atomic_operations%s
   --  system.float_control%s
   --  system.float_control%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.spark%s
   --  system.spark.cut_operations%s
   --  system.spark.cut_operations%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.big_numbers%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.wid_uns%s
   --  system.img_int%s
   --  ada.exceptions%b
   --  system.img_uns%s
   --  system.dwarf_lines%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.arith_64%s
   --  system.arith_64%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.exn_lli%s
   --  system.img_util%s
   --  system.img_util%b
   --  system.img_fixed_64%s
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  lab1ada%b
   --  END ELABORATION ORDER

end ada_main;
