
-- VHDL Instantiation Created from source file Procesador.vhd -- 03:35:39 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Procesador
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		sal_procesador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Procesador: Procesador PORT MAP(
		rst => ,
		clk => ,
		sal_procesador => 
	);


