with Interfaces;
use Interfaces;

package LVC.USART is
-- Déclaration des nouveaux types
   -- Type Buffer
   type BufferType is array (0..15) of Unsigned_8;

-- Déclaration des variables
   -- Buffer
   buffer : BufferType;

   -- Positions sur le buffer, debut et fin
   debutBuf, finBuf : Integer := 0;

   -- Interruption sur l'emission active
   interAct : Boolean := False;
   procedure Init_USART;
   procedure Write(str : String);
end LVC.USART;
