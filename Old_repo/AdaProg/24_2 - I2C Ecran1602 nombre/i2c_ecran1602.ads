with Interfaces;
use Interfaces;


package I2c_ecran1602 is

-------------------------------------
-- Constantes
   -- commands
   LCD_CLEARDISPLAY     : constant := 16#01#;
   LCD_RETURNHOME       : constant := 16#02#;
   LCD_ENTRYMODESET     : constant := 16#04#;
   LCD_DISPLAYCONTROL   : constant := 16#08#;
   LCD_CURSORSHIFT      : constant := 16#10#;
   LCD_FUNCTIONSET      : constant := 16#20#;
   LCD_SETCGRAMADDR     : constant := 16#40#;
   LCD_SETDDRAMADDR     : constant := 16#80#;

   -- flags for display entry mode
   LCD_ENTRYRIGHT           : constant := 16#00#;
   LCD_ENTRYLEFT            : constant := 16#02#;
   LCD_ENTRYSHIFTINCREMENT  : constant := 16#01#;
   LCD_ENTRYSHIFTDECREMENT  : constant := 16#00#;

   -- flags for display on/off control
   LCD_DISPLAYON     : constant := 16#04#;
   LCD_DISPLAYOFF    : constant := 16#00#;
   LCD_CURSORON      : constant := 16#02#;
   LCD_CURSOROFF     : constant := 16#00#;
   LCD_BLINKON       : constant := 16#01#;
   LCD_BLINKOFF      : constant := 16#00#;

   -- flags for display/cursor shift
   LCD_DISPLAYMOVE   : constant := 16#08#;
   LCD_CURSORMOVE    : constant := 16#00#;
   LCD_MOVERIGHT     : constant := 16#04#;
   LCD_MOVELEFT      : constant := 16#00#;

   -- flags for function set
   LCD_8BITMODE      : constant := 16#10#;
   LCD_4BITMODE      : constant := 16#00#;
   LCD_2LINE         : constant := 16#08#;
   LCD_1LINE         : constant := 16#00#;
   LCD_5x10DOTS      : constant := 16#04#;
   LCD_5x8DOTS       : constant := 16#00#;

   -- flags for backlight control
   LCD_BACKLIGHTON     : constant := 16#08#;
   LCD_BACKLIGHTOFF    : constant := 16#00#;

   -- Bit selection mode
   LCD_EN : constant := 2#00000100#; -- Enable bit
   LCD_RW : constant := 2#00000010#; -- Read/Write bit
   LCD_RS : constant := 2#00000001#; -- Register select bit

-------------------------------------
-- Types

   type T_LCD is record
      Addr : Unsigned_8;
      Cols : Unsigned_8;
      Rows : Unsigned_8;
   end record;

   type T_Ptr_LCD is access T_LCD;

-------------------------------------
-- Variables

   --LCD : T_LCD;


-------------------------------------
-- Procedures

   procedure LCD_Init(LCD_Addr : Unsigned_8 ; LCD_Rows : Unsigned_8; LCD_Cols: Unsigned_8) ;

   procedure LCD_Backlight(State : Boolean := True);

   procedure LCD_SetCursor(Rows : Unsigned_8; Cols: Unsigned_8) ;

   procedure LCD_Print(Message : String);

   procedure LCD_Print(Message : Character);

   procedure LCD_Print(Message : Unsigned_8; base : Unsigned_8 := 10);

   procedure LCD_Print(Message : Unsigned_16; base : Unsigned_8 := 10);

   procedure LCD_Print(Message : Unsigned_32; base : Unsigned_8 := 10);

   -- Ne fonctionne pas, nombre trop grand??
   -- procedure LCD_Print(Message : Unsigned_64; base : Unsigned_8 := 10);

   procedure LCD_Display(State : Boolean := True);

   procedure LCD_Cursor(State : Boolean := True);

   procedure LCD_Blink(State : Boolean := True);

   procedure LCD_LeftToRight;

   procedure LCD_RightToLeft;

   procedure LCD_ScrollDisplayLeft;

   procedure LCD_ScrollDisplayRight;

   procedure LCD_Autoscroll(State : Boolean := True);

private

   P_LCD : T_Ptr_LCD;
   DisplayFunction : Unsigned_8;
   DisplayControl : Unsigned_8;
   DisplayMode : Unsigned_8;
   NumLines : Unsigned_8;
   BackLightValue : Unsigned_8;


end I2c_ecran1602;
