----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:12:04 10/09/2017 
-- Design Name: 
-- Module Name:    Procesador - Behavioral 
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

entity Procesador is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           sal_procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

	COMPONENT sumador
	PORT(
		operador1 : IN std_logic_vector(31 downto 0);
		operador2 : IN std_logic_vector(31 downto 0);          
		sal_sumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT nPC
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		senal : IN std_logic_vector(31 downto 0);          
		sal_npc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		senal: IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	COMPONENT IM
	PORT(
		rst : IN std_logic;
		address : IN std_logic_vector(31 downto 0);          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida_uc : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU
	PORT(
		inm : IN std_logic_vector(12 downto 0);          
		sal_seu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT RF
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		pwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX
	PORT(
		i : IN std_logic;
		crs2 : IN std_logic_vector(31 downto 0);
		dato_seu : IN std_logic_vector(31 downto 0);          
		sal_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		entrada_uc : IN std_logic_vector(5 downto 0);          
		salida_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

					
signal sumadorTonPC, nPCToPC, PCToIM, IMToUFR, ALUSalida, RFToALU1, RFToMux, SEUToMux, MuxToALU: STD_LOGIC_VECTOR (31 downto 0);
signal sal_ALU:STD_LOGIC_VECTOR (5 downto 0);

begin
	Inst_sumador: sumador PORT MAP(
		operador1 => x"00000001",
		operador2 => nPCToPC,
		sal_sumador => sumadorTonPC
	);
	
	Inst_nPC: nPC PORT MAP(
		rst => rst ,
		clk => clk ,
		senal => sumadorTonPC,
		sal_npc => nPCToPC
	);
	
	Inst_PC: PC PORT MAP(
		rst => rst,
		clk => clk,
		senal => nPCToPC,
		salida => PCToIM
	);

	Inst_IM: IM PORT MAP(
		rst => rst,
		address => PCToIM,
		outInstruction => IMToUFR
	);
	
	Inst_UC: UC PORT MAP(
		op => IMToUFR(31 downto 30),
		op3 => IMToUFR(24 downto 19),
		salida_uc => sal_ALU
	);
	
	Inst_SEU: SEU PORT MAP(
		inm => IMToUFR(12 downto 0),
		sal_seu => SEUToMux
	);
			
	Inst_RF: RF PORT MAP(
		rst => rst,
		rs1 => IMToUFR(18 downto 14),
		rs2 => IMToUFR(4 downto 0),
		rd => IMToUFR(29 downto 25),
		pwr => ALUSalida,
		crs1 => RFToALU1,
		crs2 => RFToMux
		);
		
	Inst_MUX: MUX PORT MAP(
		i => IMToUFR(13),
		crs2 => RFToMux,
		dato_seu => SEUToMux,
		sal_mux => MuxToALU
	);
		
	Inst_ALU: ALU PORT MAP(
		crs1 => RFToALU1,
		crs2 => MuxToALU,
		entrada_uc => sal_ALU,
		salida_alu => ALUSalida
	);
	
	sal_procesador <= ALUSalida;

end Behavioral;

