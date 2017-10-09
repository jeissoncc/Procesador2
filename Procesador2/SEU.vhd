----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:10:09 10/09/2017 
-- Design Name: 
-- Module Name:    SEU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU is
    Port ( inm : in  STD_LOGIC_VECTOR (12 downto 0);
           sal_seu : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

begin
	process(inm)
		begin
			if(inm(12) = '1')then --verifica si el numero es negativo
				sal_seu(12 downto 0) <= inm;
				sal_seu(31 downto 13) <= (others=>'1');--completa con unos por ser negativo
			else
				sal_seu(12 downto 0) <= inm;
				sal_seu(31 downto 13) <= (others=>'0');--si es positivo completa con ceros
			end if;
	end process;
end Behavioral;

