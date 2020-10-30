with Two_Wire;
use Two_Wire;
with AVR.Real_Time.Delays;
with Ada.Unchecked_Conversion;
-- with AVR;                          use AVR;
-- with AVR.MCU;

package body I2c_ecran1602 is

   procedure LCD_ExpanderWrite(Data : Unsigned_8) is
      temp : Data_Buffer(1..1);
   begin
      temp(1) := Data or BackLightValue;
      Write_Data(P_LCD.Addr,temp);
      -- Write_Data(16#27#,temp);
   end LCD_ExpanderWrite;

   procedure LCD_PulseEnable(Data : Unsigned_8) is
   begin
      -- Enable High
      LCD_ExpanderWrite(Data or LCD_EN);
      -- Enable pulse must be > 450ns
      delay 0.000001;
      -- Enable Low
      LCD_ExpanderWrite(Data and (not LCD_EN));
      -- Command need > 37us to settle
      delay 0.00005;
   end LCD_PulseEnable;

   procedure LCD_Write4Bits(Data : Unsigned_8) is
   begin
      LCD_ExpanderWrite(Data);
      LCD_PulseEnable(Data);
   end LCD_Write4Bits;

   procedure LCD_Send(Data : Unsigned_8; Mode : Unsigned_8) is
      HighNib, LowNib : Unsigned_8;
   begin
      HighNib := Data and 16#F0#;
      LowNib := (Data*16) and 16#F0#;
      LCD_Write4Bits((HighNib or Mode));
      LCD_Write4Bits((LowNib or Mode));
   end LCD_Send;

   procedure LCD_Command(Data : Unsigned_8) is
   begin
      LCD_Send(Data,0);
   end LCD_Command;

   procedure LCD_Display(State : Boolean := True) is
   begin
      if(State) then
         DisplayControl := DisplayControl or LCD_DISPLAYON;
      else
         DisplayControl := DisplayControl and (not LCD_DISPLAYON);
      end if;
      LCD_Command(LCD_DISPLAYCONTROL or DisplayControl);
   end LCD_Display;

   procedure LCD_Clear is
   begin
      -- clear display, set cursor position to zero
      LCD_Command(LCD_CLEARDISPLAY);
      -- this command takes a long time!
      delay 0.002;
   end LCD_Clear;

   procedure LCD_Home is
   begin
      -- set cursor position to zero
      LCD_Command(LCD_RETURNHOME);
      -- this command takes a long time!
      delay 0.002;
   end LCD_Home;

   procedure LCD_Init(LCD_Addr : Unsigned_8 ; LCD_Rows : Unsigned_8; LCD_Cols: Unsigned_8) is
   begin
      P_LCD := new T_LCD'(LCD_Addr, LCD_Rows, LCD_Cols);
      BackLightValue := LCD_BACKLIGHTOFF;
      Two_Wire.Init;
      DisplayFunction := LCD_4BITMODE or LCD_1LINE or LCD_5x8DOTS;
      if(P_LCD.Rows >1) then
         DisplayFunction := DisplayFunction or LCD_2LINE;
      end if;
      NumLines := P_LCD.Rows;
      -- Il y a une partie que je n'ai pas mise ici
      -- Need to wait at least 40 ms
      delay 0.05;

      -- Now we pull both RS and R/W low to begin commands
      -- Turn Off the Backlight
      LCD_ExpanderWrite(BackLightValue);

      -- Wait 1 s
      delay 1.0;

      -- put the LCD into 4 bit mode
      -- this is according to the hitachi HD44780 datasheet
      -- figure 24, pg 46
      -- we start in 8bit mode, try to set 4 bit mode
      LCD_Write4Bits(16#03#*16);
      delay 0.0045; -- wait min 4.1ms

      -- second try
      LCD_Write4Bits(16#03#*16);
      delay 0.0045; -- wait min 4.1ms

      -- third go!
      LCD_Write4Bits(16#03#*16);
      delay 0.00015;

      -- finally, set to 4-bit interface
      LCD_Write4Bits(16#02#*16);

      -- Set number of line, fontsize ...
      LCD_Command(LCD_FUNCTIONSET or DisplayFunction);

      -- Turn the display on with no cursor or blinking default
      DisplayControl := LCD_DISPLAYON or LCD_CURSOROFF or LCD_BLINKOFF;
      LCD_Display;

      -- Clear it off
      LCD_Clear;

      -- Initialise to default text direction (for roman languages)
      DisplayMode := LCD_ENTRYLEFT or LCD_ENTRYSHIFTDECREMENT;

      -- Set the entry mode
      LCD_Command(LCD_ENTRYMODESET or DisplayMode);

      -- Set the cursor at home
      LCD_Home;
   end LCD_Init;

   procedure LCD_Backlight(State : Boolean := True) is
   begin
      if(State) then
         BackLightValue := LCD_BACKLIGHTON;
      else
         BackLightValue := LCD_BACKLIGHTOFF;
      end if;
      LCD_ExpanderWrite(0);
   end LCD_Backlight;

   procedure LCD_SetCursor(Rows : Unsigned_8; Cols: Unsigned_8) is
      RowOffsets : Data_Buffer(0..3) := (16#00#, 16#40#, 16#14#, 16#54#);
      tempRow : Unsigned_8 := Rows;
   begin
      if(tempRow > NumLines) then
         tempRow := NumLines - 1;
      end if;
      LCD_Command(LCD_SETDDRAMADDR or (Cols + RowOffsets(tempRow)));
   end LCD_SetCursor;

   procedure LCD_Print(Message : Character) is
   begin
      LCD_Send(Character'Pos(Message),1);
   end LCD_Print;

   procedure LCD_Print(Message : String) is
   begin
      for C in Message'Range loop
         LCD_Print (Message(C));
      end loop;
   end LCD_Print;

   procedure LCD_Print(Message : Unsigned_8; base : Unsigned_8 := 10) is
      buf : String := "";
      n,m,a : Unsigned_8 := Message;
      --a : Unsigned_8;
      i : Integer;
   begin
        i:=0;
      while(n>0) loop
         m := n;
         n := m / base;
         a := m - base * n;
         i := i + 1;
         if (a<10) then
            buf(i) := Character'Val(a + Character'Pos('0'));
            -- buf := buf & Character'Val(a + Character'Pos('0'));
         else
            buf(i) := Character'Val(a + Character'Pos('A') - 10);
         end if;
      end loop;
      -- For print the 0
      if(i<1) then
         i:=1;
         buf(i) := Character'Val(Character'Pos('0'));
      else
         declare
            temp : String(1..i);
         begin
            for j in 1..i loop
               temp(j) := buf(i+1-j);
            end loop;
            buf(1..i) := temp(1..i);
         end;
      end if;
      LCD_Print(buf(1..i));
   end LCD_Print;

   procedure LCD_Print(Message : Unsigned_16; base : Unsigned_8 := 10) is
      buf : String :="";
      n,m,a : Unsigned_16 := Message;
      --a : Unsigned_8;
      i : Integer;
   begin
      i:=0;
      while(n>0) loop
         m := n;
         n := m / Unsigned_16(base);
         a := m - Unsigned_16(base) * n;
         i := i + 1;
         if (a<10) then
            buf(i) := Character'Val(a + Character'Pos('0'));
            -- buf := buf & Character'Val(a + Character'Pos('0'));
         else
            buf(i) := Character'Val(a + Character'Pos('A') - 10);
         end if;
      end loop;
      -- For print the 0
      if(i<1) then
         i:=1;
         buf(i) := Character'Val(Character'Pos('0'));
      else
         declare
            temp : String(1..i);
         begin
            for j in 1..i loop
               temp(j) := buf(i+1-j);
            end loop;
            buf(1..i) := temp(1..i);
         end;
      end if;
      LCD_Print(buf(1..i));
   end LCD_Print;

   procedure LCD_Print(Message : Unsigned_32; base : Unsigned_8 := 10) is
      buf : String :="";
      n,m,a : Unsigned_32 := Message;
      --a : Unsigned_8;
      i : Integer;
   begin
      i:=0;
      while(n>0) loop
         m := n;
         n := m / Unsigned_32(base);
         a := m - Unsigned_32(base) * n;
         i := i + 1;
         if (a<10) then
            buf(i) := Character'Val(a + Character'Pos('0'));
            -- buf := buf & Character'Val(a + Character'Pos('0'));
         else
            buf(i) := Character'Val(a + Character'Pos('A') - 10);
         end if;
      end loop;
      -- For print the 0
      if(i<1) then
         i:=1;
         buf(i) := Character'Val(Character'Pos('0'));
      else
         declare
            temp : String(1..i);
         begin
            for j in 1..i loop
               temp(j) := buf(i+1-j);
            end loop;
            buf(1..i) := temp(1..i);
         end;
      end if;
      LCD_Print(buf(1..i));
   end LCD_Print;


   function Int8_To_U8 is
         new Ada.Unchecked_Conversion (Source => Integer_8,
                                       Target => Unsigned_8);

   procedure LCD_Print(Message : Integer_8) is
      buf : String :="-";
      n,m,a : Unsigned_8;
      --a : Unsigned_8;
      i : Integer;
   begin
   

      if(Message<0) then
         n := Int8_To_U8(-Message);
         i:=1;
      else
         n := Int8_To_U8(Message);
         i:=0;
      end if;
      
      while(n>0) loop
         m := n;
         n := m / 10;
         a := m - 10 * n;
         i := i + 1;
         buf(i) := Character'Val(a + Character'Pos('0'));
      end loop;
      -- For print the 0
      if(i<1) then
         i:=1;
         buf(i) := Character'Val(Character'Pos('0'));
      else
         declare
            temp : String(1..i);
         begin
            for j in 1..i loop
               temp(j) := buf(i+1-j);
            end loop;
            if(Message<0) then
               buf(1) := temp(i);
               buf(2..i) := temp(1..i-1);
            else
               buf(1..i) := temp(1..i);
            end if;
         end;
      end if;
      LCD_Print(buf(1..i));
   end LCD_Print;

   function Int16_To_U16 is
         new Ada.Unchecked_Conversion (Source => Integer_16,
                                       Target => Unsigned_16);

   procedure LCD_Print(Message : Integer_16) is
      buf : String :="-";
      n,m,a : Unsigned_16;
      --a : Unsigned_8;
      i : Integer;
   begin
   

      if(Message<0) then
         n := Int16_To_U16(-Message);
         i:=1;
      else
         n := Int16_To_U16(Message);
         i:=0;
      end if;
      
      while(n>0) loop
         m := n;
         n := m / 10;
         a := m - 10 * n;
         i := i + 1;
         buf(i) := Character'Val(a + Character'Pos('0'));
      end loop;
      -- For print the 0
      if(i<1) then
         i:=1;
         buf(i) := Character'Val(Character'Pos('0'));
      else
         declare
            temp : String(1..i);
         begin
            for j in 1..i loop
               temp(j) := buf(i+1-j);
            end loop;
            if(Message<0) then
               buf(1) := temp(i);
               buf(2..i) := temp(1..i-1);
            else
               buf(1..i) := temp(1..i);
            end if;
         end;
      end if;
      LCD_Print(buf(1..i));
   end LCD_Print;

   -- function Int32_To_U32 is
         -- new Ada.Unchecked_Conversion (Source => Integer_32,
                                       -- Target => Unsigned_32);

   -- procedure LCD_Print(Message : Integer_32) is
      -- buf : String :="-";
      -- n,m,a : Unsigned_32;
      -- i : Integer;
   -- begin
      -- if(Message<0) then
         -- n := Int32_To_U32(-Message);
         -- i:=1;
      -- else
         -- n := Int32_To_U32(Message);
         -- i:=0;
      -- end if;
      
      -- while(n>0) loop
         -- m := n;
         -- n := m / 10;
         -- a := m - 10 * n;
         -- i := i + 1;
         -- buf(i) := Character'Val(a + Character'Pos('0'));
      -- end loop;
      -- -- For print the 0
      -- if(i<1) then
         -- i:=1;
         -- buf(i) := Character'Val(Character'Pos('0'));
      -- else
         -- declare
            -- temp : String(1..i);
         -- begin
            -- for j in 1..i loop
               -- temp(j) := buf(i+1-j);
            -- end loop;
            -- if(Message<0) then
               -- buf(1) := temp(i);
               -- buf(2..i) := temp(1..i-1);
            -- else
               -- buf(1..i) := temp(1..i);
            -- end if;
         -- end;
      -- end if;
      -- LCD_Print(buf(1..i));
   -- end LCD_Print;

   procedure LCD_Cursor(State : Boolean := True) is
   begin
      if(State) then
         DisplayControl := DisplayControl or LCD_CURSORON;
      else
         DisplayControl := DisplayControl and (not LCD_CURSORON);
      end if;
      LCD_Command(LCD_DISPLAYCONTROL or DisplayControl);
   end LCD_Cursor;

   procedure LCD_Blink(State : Boolean := True) is
   begin
      if(State) then
         DisplayControl := DisplayControl or LCD_BLINKON;
      else
         DisplayControl := DisplayControl and (not LCD_BLINKON);
      end if;
      LCD_Command(LCD_DISPLAYCONTROL or DisplayControl);
   end LCD_Blink;

   procedure LCD_Autoscroll(State : Boolean := True) is
   begin
      if(State) then
         DisplayMode := DisplayMode or LCD_ENTRYSHIFTINCREMENT;
      else
         DisplayMode := DisplayMode and (not LCD_ENTRYSHIFTINCREMENT);
      end if;
      LCD_Command(LCD_ENTRYMODESET or DisplayMode);
   end LCD_Autoscroll;

   procedure LCD_LeftToRight is
   begin
      DisplayMode := DisplayMode or LCD_ENTRYLEFT;
      LCD_Command(LCD_ENTRYMODESET or DisplayMode);
   end LCD_LeftToRight;

   procedure LCD_RightToLeft is
   begin
      DisplayMode := DisplayMode and (not LCD_ENTRYLEFT);
      LCD_Command(LCD_ENTRYMODESET or DisplayMode);
   end LCD_RightToLeft;

   procedure LCD_ScrollDisplayLeft is
   begin
      LCD_Command(LCD_CURSORSHIFT or LCD_DISPLAYMOVE or LCD_MOVELEFT);
   end LCD_ScrollDisplayLeft;

   procedure LCD_ScrollDisplayRight is
   begin
      LCD_Command(LCD_CURSORSHIFT or LCD_DISPLAYMOVE or LCD_MOVERIGHT);
   end LCD_ScrollDisplayRight;

end I2c_ecran1602;
