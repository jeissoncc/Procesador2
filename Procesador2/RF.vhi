
-- VHDL Instantiation Created from source file RF.vhd -- 03:29:26 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_RF: RF PORT MAP(
		rst => ,
		rs1 => ,
		rs2 => ,
		rd => ,
		pwr => ,
		crs1 => ,
		crs2 => 
	);


