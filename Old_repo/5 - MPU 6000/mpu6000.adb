---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
------------------------------------------------------------------------------
--                                                                          --
--                             L V C COMPONENTS                             --
--                                                                          --
--                                  L V C                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--    Copyright (C) 2014 Bardot Sébastien                                   --
--    More information on http://lvcetada.e-monsite.com/ or by mail on      --
--    lvcetada@gmail.com                                                    --
--                                                                          --
--    This program is free software: you can redistribute it and/or modify  --
--    it under the terms of the GNU General Public License as published by  --
--    the Free Software Foundation, either version 3 of the License, or     --
--    (at your option) any later version.                                   --
--                                                                          --
--    This program is distributed in the hope that it will be useful,       --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of        --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         --
--    GNU General Public License for more details.                          --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--    along with this program.  If not, see <http://www.gnu.org/licenses/>. --
--                                                                          --
--                                                                          --
--    This package is on the top of LVC architecture, you need it on your   --
--    folder to call an LVC package.                                        --
--    This package and its children are based on AVR-Ada Library.           --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------


with AVR;
with AVR.MCU;
with AVR.Timer1;
--with AVR.SPI;
--with AVR.SPI.Master;
with AVR.UART;
with AVR.Strings;
with AVR.Real_Time.Delays;
with AVR.Config;
with Soft_SPI;

use AVR;
--use AVR.SPI;
--use AVR.SPI.Master;

procedure Mpu6000 is

-- MPU-6000 register
-- Registre de la centrale inertielle MPU-6000
MPUREG_XG_OFFS_TC : constant := 16#00#;
MPUREG_YG_OFFS_TC : constant := 16#01#;
MPUREG_ZG_OFFS_TC : constant := 16#02#;

MPUREG_X_FINE_GAIN : constant := 16#03#;
MPUREG_Y_FINE_GAIN : constant := 16#04#;
MPUREG_Z_FINE_GAIN : constant := 16#05#;

MPUREG_XA_OFFS_H : constant := 16#06#;  -- Offset accelerometre axe X bit de poids fort (High byte)
MPUREG_XA_OFFS_L : constant := 16#07#;  -- Offset accelerometre axe X bit de poids faible (Low byte)
MPUREG_YA_OFFS_H : constant := 16#08#;  -- Offset accelerometre axe Y bit de poids fort (High byte)
MPUREG_YA_OFFS_L : constant := 16#09#;  -- Offset accelerometre axe Y bit de poids faible (Low byte)
MPUREG_ZA_OFFS_H : constant := 16#0A#;  -- Offset accelerometre axe Z bit de poids fort (High byte)
MPUREG_ZA_OFFS_L : constant := 16#0B#;  -- Offset accelerometre axe Z bit de poids faible (Low byte)

MPUREG_PRODUCT_ID : constant := 16#0C#; -- Product ID Register

MPUREG_XG_OFFS_USRH : constant := 16#13#;  -- Offset gyrometre axe X bit de poids fort (High byte)
MPUREG_XG_OFFS_USRL : constant := 16#14#;  -- Offset gyrometre axe X bit de poids faible (Low byte)
MPUREG_YG_OFFS_USRH : constant := 16#15#;  -- Offset gyrometre axe Y bit de poids fort (High byte)
MPUREG_YG_OFFS_USRL : constant := 16#16#;  -- Offset gyrometre axe Y bit de poids faible (Low byte)
MPUREG_ZG_OFFS_USRH : constant := 16#17#;  -- Offset gyrometre axe Z bit de poids fort (High byte)
MPUREG_ZG_OFFS_USRL : constant := 16#18#;  -- Offset gyrometre axe Z bit de poids faible (Low byte)

MPUREG_SMPLRT_DIV : constant := 16#19#;  -- Taux d'échantillonage = 1kHz/cette valeur (p11-12)
MPUREG_SMPLRT_1000HZ : constant := 16#00#;  -- Taux d'échantillonage de 1 kHz
MPUREG_SMPLRT_500HZ : constant := 16#01#;  -- Taux d'échantillonage de 500 Hz
MPUREG_SMPLRT_250HZ : constant := 16#03#;  -- Taux d'échantillonage de 250 Hz
MPUREG_SMPLRT_200HZ : constant := 16#04#;  -- Taux d'échantillonage de 200 Hz
MPUREG_SMPLRT_100HZ : constant := 16#09#;  -- Taux d'échantillonage de 100 Hz
MPUREG_SMPLRT_50HZ : constant := 16#13#;  -- Taux d'échantillonage de 50 Hz

MPUREG_CONFIG : constant := 16#1A#;  -- Configuration de la centrale inertielle
BITS_DLPF_CFG_256HZ_NOLPF2 : constant := 16#00#;
BITS_DLPF_CFG_188HZ : constant := 16#01#;
BITS_DLPF_CFG_98HZ : constant := 16#02#;
BITS_DLPF_CFG_42HZ : constant := 16#03#;
BITS_DLPF_CFG_20HZ : constant := 16#04#;
BITS_DLPF_CFG_10HZ : constant := 16#05#;
BITS_DLPF_CFG_5HZ : constant := 16#06#;
BITS_DLPF_CFG_2100HZ_NOLPF : constant := 16#07#;
BITS_DLPF_CFG_MASK : constant := 16#07#;


MPUREG_GYRO_CONFIG : constant := 16#1B#;  -- Configuration des gyromètres
-- Définitions des paramétres et des autotests des gyromètres
BITS_GYRO_FS_250DPS : constant := 16#00#;
BITS_GYRO_FS_500DPS : constant := 16#08#;
BITS_GYRO_FS_1000DPS : constant := 16#10#;
BITS_GYRO_FS_2000DPS : constant := 16#18#;
BITS_GYRO_FS_MASK : constant := 16#18#; -- Seuls les bits 3 et 4 sont utilisés pour paramétrer le gyromètre, utilisez ce 
-- masque pour les autres bits
BITS_GYRO_ZGYRO_SELFTEST : constant := 16#20#;
BITS_GYRO_YGYRO_SELFTEST : constant := 16#40#;
BITS_GYRO_XGYRO_SELFTEST : constant := 16#80#;

MPUREG_ACCEL_CONFIG : constant := 16#1C#;  -- Configuration des accéléromètres
-- Définitions des paramétres et des autotests des accéléromètres
BITS_ACCEL_FS_2G : constant := 16#00#;
BITS_ACCEL_FS_4G : constant := 16#08#;
BITS_ACCEL_FS_8G : constant := 16#10#;
BITS_ACCEL_FS_16G : constant := 16#18#;
BITS_ACCEL_FS_MASK : constant := 16#18#;

MPUREG_MOT_THR : constant := 16#1F#;  -- Seuil de détection de mouvement pour la génération d'interruption. Un mouvement
-- est détecté lorsque la valeur absolue de l'une des mesures de l'accéléromètre dépasse ce seuil
MPUREG_MOT_DUR : constant := 16#20#;  -- Durée du seuil de détection de mouvement pour la génération d'interruption. Le 
-- compteur est paramétré à 1 kHz, donc MOT_DUR dispose d'une unité de 1 LSB = 1 ms
MPUREG_ZRMOT_THR : constant := 16#21#;  -- Seuil de détection de mouvement pour la génération d'interruption d'ordre Zéro.
MPUREG_ZRMOT_DUR : constant := 16#22#;  -- Durée du seuil de détection de mouvement pour la génération d'interruption 
-- d'ordre Zéro. Le compteur est paramétré à 16 Hz, donc ZRMOT_DUR dispose d'une unité de 1 LSB = 64 ms.

MPUREG_FIFO_EN : constant := 16#23#;  -- Mode FIFO actif

MPUREG_INT_PIN_CFG : constant := 16#37#;
BIT_INT_RD_CLEAR : constant := 16#10#;
BIT_LATCH_INT_EN : constant := 16#20#;

MPUREG_INT_ENABLE : constant := 16#38#;
BIT_RAW_RDY_EN : constant := 16#01#;
BIT_DMP_INT_EN : constant := 16#02#;
BIT_UNKNOWN_INT_EN : constant := 16#04#;
BIT_I2C_MST_INT_EN : constant := 16#08#;
BIT_FIFO_OFLOW_EN : constant := 16#10#;
BIT_ZMOT_EN : constant := 16#20#;
BIT_MOT_EN : constant := 16#40#;
BIT_FF_EN : constant := 16#80#;

MPUREG_INT_STATUS : constant := 16#3A#;
BIT_RAW_RDY_INT : constant := 16#01#;
BIT_DMP_INT : constant := 16#02#;
BIT_UNKNOWN_INT : constant := 16#04#;
BIT_I2C_MST_INT : constant := 16#08#;
BIT_FIFO_OFLOW_INT : constant := 16#10#;
BIT_ZMOT_INT : constant := 16#20#;
BIT_MOT_INT : constant := 16#40#;
BIT_FF_INT : constant := 16#80#;

MPUREG_ACCEL_XOUT_H : constant := 16#3B#;
MPUREG_ACCEL_XOUT_L : constant := 16#3C#;
MPUREG_ACCEL_YOUT_H : constant := 16#3D#;
MPUREG_ACCEL_YOUT_L : constant := 16#3E#;
MPUREG_ACCEL_ZOUT_H : constant := 16#3F#;
MPUREG_ACCEL_ZOUT_L : constant := 16#40#;
MPUREG_TEMP_OUT_H : constant := 16#41#;
MPUREG_TEMP_OUT_L : constant := 16#42#;
MPUREG_GYRO_XOUT_H : constant := 16#43#;
MPUREG_GYRO_XOUT_L : constant := 16#44#;
MPUREG_GYRO_YOUT_H : constant := 16#45#;
MPUREG_GYRO_YOUT_L : constant := 16#46#;
MPUREG_GYRO_ZOUT_H : constant := 16#47#;
MPUREG_GYRO_ZOUT_L : constant := 16#48#;

MPUREG_USER_CTRL : constant := 16#6A#;
BIT_USER_CTRL_SIG_COND_RESET : constant := 16#01#;
BIT_USER_CTRL_I2C_MST_RESET : constant := 16#02#;
BIT_USER_CTRL_FIFO_RESET : constant := 16#04#;
BIT_USER_CTRL_DMP_RESET : constant := 16#08#;
BIT_USER_CTRL_I2C_IF_DIS : constant := 16#10#;
BIT_USER_CTRL_I2C_MST_EN : constant := 16#20#;
BIT_USER_CTRL_FIFO_EN : constant := 16#40#;
BIT_USER_CTRL_DMP_EN : constant := 16#80#;

MPUREG_PWR_MGMT_1 : Nat8 := 16#6B#;
BIT_PWR_MGMT_1_CLK_INTERNAL : constant := 16#00#;
BIT_PWR_MGMT_1_CLK_XGYRO : constant := 16#01#;
BIT_PWR_MGMT_1_CLK_YGYRO : constant := 16#02#;
BIT_PWR_MGMT_1_CLK_ZGYRO : constant := 16#03#;
BIT_PWR_MGMT_1_CLK_EXT32KHZ : constant := 16#04#;
BIT_PWR_MGMT_1_CLK_EXT19MHZ : constant := 16#05#;
BIT_PWR_MGMT_1_CLK_STOP : constant := 16#07#;
BIT_PWR_MGMT_1_TEMP_DIS : constant := 16#08#;
BIT_PWR_MGMT_1_CYCLE : constant := 16#20#;
BIT_PWR_MGMT_1_SLEEP : constant := 16#40#;
BIT_PWR_MGMT_1_DEVICE_RESET : constant := 16#80#;

MPUREG_PWR_MGMT_2 : constant := 16#6C#;
MPUREG_BANK_SEL : constant := 16#6D#;
MPUREG_MEM_START_ADDR : constant := 16#6E#;
MPUREG_MEM_R_W : constant := 16#6F#;
MPUREG_DMP_CFG_1 : constant := 16#70#;
MPUREG_DMP_CFG_2 : constant := 16#71#;
MPUREG_FIFO_COUNTH : constant := 16#72#;
MPUREG_FIFO_COUNTL : constant := 16#73#;
MPUREG_FIFO_R_W : constant := 16#74#;
MPUREG_WHOAMI : constant := 16#75#;

MPU6000ES_REV_C4 : constant := 16#14#;
MPU6000ES_REV_C5 : constant := 16#15#;
MPU6000ES_REV_D6 : constant := 16#16#;
MPU6000ES_REV_D7 : constant := 16#17#;
MPU6000ES_REV_D8 : constant := 16#18#;
MPU6000_REV_C4 : constant := 16#54#;
MPU6000_REV_C5 : constant := 16#55#;
MPU6000_REV_D6 : constant := 16#56#;
MPU6000_REV_D7 : constant := 16#57#;
MPU6000_REV_D8 : constant := 16#58#;
MPU6000_REV_D9 : constant := 16#59#;

gyro_scale : constant := (0.0174532 / 16.4);

-- Pin 53 de l'arduino ie PB0 est le pin de selection de la carte (SS-CS port)
MPU6000_CHIP_SELECT_PIN : Boolean renames MCU.DDRB_Bits(0);



begin
--------------------------------------------------------------------------------
--                                                                            --
--                 Initialisation de la centrale inertielle                   --
--                                                                            --
--------------------------------------------------------------------------------


-- Demarage de la centrale inertiele
-- Clock divisé par 16
-- SPI Mode : CPOL = 1, CPHA = 1 : Mode 3
-- MSB First
-- Select slave utilisé
-- Startup(By_16,Setup_Falling_Sample_Rising);

AVR.UART.Init (103); -- 9600 @16MHz
AVR.UART.Put ("Démarrage");
AVR.UART.CRLF;
delay 1.0;
-- PBO en sortie à l'état haut
   Soft_SPI.Init;
   MPU6000_CHIP_SELECT_PIN := DD_Output;
   MCU.PORTB_Bits (0) := True;
   AVR.UART.Put ("Sortie allumée");
   AVR.UART.CRLF;
-- Appel pour faire un reset du controleur
--   SPI.Master.Write(MPUREG_PWR_MGMT_1);
   Soft_SPI.Send_Byte(MPUREG_PWR_MGMT_1);
   AVR.UART.Put ("Premier ordre");
   AVR.UART.CRLF;
--   SPI.Master.Write(BIT_PWR_MGMT_1_DEVICE_RESET);
   Soft_SPI.Send_Byte(BIT_PWR_MGMT_1_DEVICE_RESET);
delay 1.0;
   AVR.UART.Put ("Reset effectué");
   AVR.UART.CRLF;
-- Appel pour selectionner l'horloge du gyro Z, apparemment donne de meilleurs performances
--   SPI.Master.Write(MPUREG_PWR_MGMT_1);
--   SPI.Master.Write(BIT_PWR_MGMT_1_CLK_ZGYRO);
   Soft_SPI.Send_Byte(MPUREG_PWR_MGMT_1);
   Soft_SPI.Send_Byte(BIT_PWR_MGMT_1_CLK_ZGYRO);
   AVR.UART.Put ("Réglage horloge effectué");
   AVR.UART.CRLF;
-- Désactivation du mode I2C, recommandé par la datasheet de la centrale inertielle
--   SPI.Master.Write(MPUREG_USER_CTRL);
--   SPI.Master.Write(BIT_USER_CTRL_I2C_IF_DIS);
   Soft_SPI.Send_Byte(MPUREG_USER_CTRL);
   Soft_SPI.Send_Byte(BIT_USER_CTRL_I2C_IF_DIS);
   AVR.UART.Put ("Désactivation du mode I2C effectuée");
   AVR.UART.CRLF;
-- Selection du taux d'échantillonage
--   SPI.Master.Write(MPUREG_SMPLRT_DIV);
--   SPI.Master.Write(MPUREG_SMPLRT_200HZ);
   Soft_SPI.Send_Byte(MPUREG_SMPLRT_DIV);
   Soft_SPI.Send_Byte(MPUREG_SMPLRT_200HZ);
   AVR.UART.Put ("Paramétrage aux d'échantillonage effectué");
   AVR.UART.CRLF;
-- Configuration de de la synchronisation externe
--   SPI.Master.Write(MPUREG_CONFIG);
--   SPI.Master.Write(BITS_DLPF_CFG_42HZ);
   Soft_SPI.Send_Byte(MPUREG_CONFIG);
   Soft_SPI.Send_Byte(BITS_DLPF_CFG_42HZ);
   AVR.UART.Put ("Configuration de la synchronisation externe effectuée");
   AVR.UART.CRLF;
-- Configuration des gyromètres
--   SPI.Master.Write(MPUREG_GYRO_CONFIG);
--   SPI.Master.Write(BITS_GYRO_FS_500DPS);
   Soft_SPI.Send_Byte(MPUREG_GYRO_CONFIG);
   Soft_SPI.Send_Byte(BITS_GYRO_FS_500DPS);
   AVR.UART.Put ("Configuration des gyromètres efffectuée");
   AVR.UART.CRLF;
-- Configuration des accéléromètres
--   SPI.Master.Write(MPUREG_ACCEL_CONFIG);
--   SPI.Master.Write(BITS_ACCEL_FS_4G);
   Soft_SPI.Send_Byte(MPUREG_ACCEL_CONFIG);
   Soft_SPI.Send_Byte(BITS_ACCEL_FS_4G);
   AVR.UART.Put ("Configuration des accéléromètres efffectuée");
   AVR.UART.CRLF;
-- Activation des intérruptions
--   SPI.Master.Write(MPUREG_INT_ENABLE);
--   SPI.Master.Write(BIT_RAW_RDY_EN);
   Soft_SPI.Send_Byte(MPUREG_INT_ENABLE);
   Soft_SPI.Send_Byte(BIT_RAW_RDY_EN);
   AVR.UART.Put ("Activation des intérruptions efffectuée");
   AVR.UART.CRLF;
-- Configuration des intérruptions
--   SPI.Master.Write(MPUREG_INT_PIN_CFG);
--   SPI.Master.Write(BIT_INT_RD_CLEAR);
   Soft_SPI.Send_Byte(MPUREG_INT_PIN_CFG);
   Soft_SPI.Send_Byte(BIT_INT_RD_CLEAR);
   AVR.UART.Put ("Configuration des intérruptions efffectuée");
   AVR.UART.CRLF;
--------------------------------------------------------------------------------
--                                                                            --
--                 Initialisation de la centrale inertielle                   --
--                                                                            --
--------------------------------------------------------------------------------

end Mpu6000;
