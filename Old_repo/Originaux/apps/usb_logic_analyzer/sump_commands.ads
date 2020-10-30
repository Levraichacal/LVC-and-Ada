with Interfaces;                   use Interfaces;
package Sump_Commands is
   pragma Pure (Sump_Commands);

   subtype Command is Unsigned_8;
   Reset                : constant Command := 16#00#;
   Run                  : constant Command := 16#01#;
   Get_Id               : constant Command := 16#02#;
   Selftest             : constant Command := 16#03#;
   Get_Metadata         : constant Command := 16#04#;
   Get_RLE_Data_Now     : constant Command := 16#05#;

   Set_Divider          : constant Command := 16#80#;
   Set_Read_Delay_Count : constant Command := 16#81#;

   Trigger_Mask         : constant Command := 16#C0#;
   Trigger_Values       : constant Command := 16#C1#;
   Trigger_Config       : constant Command := 16#C2#;

   Debug                : constant Command := 16#31#; -- '1'
   Debug_Data           : constant Command := 16#32#; -- '2'

end Sump_Commands;
