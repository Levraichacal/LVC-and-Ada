with AVR;
with AVR.MCU;
with Interfaces;
with Ada.Unchecked_Conversion;

use AVR;
use AVR.MCU;
use Interfaces;

package body LVC.USART is

-- Fonctions utiles
   function To_Uint8 is new Ada.Unchecked_Conversion (Target => Unsigned_8, Source => Character);


   -- Initialisation du port UART
   procedure Init_UART is
   begin
      -- Fixons le nombre de Baud par seconde, il faut utiliser la formule :
      -- UBRR = Fosc/16/baud-1
      -- Fosc : fréquence de l'oscilateur = 16MHz
      -- Nombre de baud désiré : 57600
      -- =>  UBRR0 := 16
      MCU.UBRR0 := Unsigned_16(103);
      -- Pas de double vitesse
      MCU.UCSR0A := 0;
      -- Choix du format d'envoie 8N1
      MCU.UCSR0C := +(MCU.UCSZ00_Bit => True,
                      MCU.UCSZ01_Bit => True,
                      others => False);
      -- Activation de la transmission
      MCU.UCSR0B := +(MCU.TXEN0_Bit => True,
                      others => False);
   end Init_UART;

   -- Déclaration de la procédure write qui écrit un Unsigned_8 sur le buffer
   procedure Write (d : Unsigned_8) is
   begin
      MCU.UDR0 := d;
   end Write;

   -- Déclaration de la procédure WriteChar qui envoie un caractère
   procedure Write (char : Character) is
   begin
      Write(To_Uint8(char));
   end Write;

   -- Déclaration de la procédure WriteString qui envoie un string
   procedure Write (str : String) is
   begin
      for i in str'Range loop
         -- Attendre que le buufer d'envoie soit vide
         while((MCU.UCSR0A and MCU.UDRE0_Mask) = 0) loop
            null;
         end loop;
         Write(str(i));
      end loop;
   end Write;

end LVC.USART;
