
-- VHDL Instantiation Created from source file SEU.vhd -- 03:28:29 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT SEU
	PORT(
		inm : IN std_logic_vector(12 downto 0);          
		sal_seu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_SEU: SEU PORT MAP(
		inm => ,
		sal_seu => 
	);


