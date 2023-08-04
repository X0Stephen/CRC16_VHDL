LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_crc IS
END tb_crc;

ARCHITECTURE behavior OF tb_crc IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT crc
PORT(
        clk: std_logic;
     data_in : IN  std_logic_vector(7 downto 0);
     crc_out : OUT  std_logic_vector(15 downto 0)
    );
END COMPONENT;


--Inputs
signal tb_clk : std_logic := '0';
signal tb_data_in : std_logic_vector(7 downto 0) := (others => '0');

--Outputs
signal tb_crc_out : std_logic_vector(15 downto 0);

-- Clock period definitions
constant clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: crc PORT MAP (
         clk => tb_clk,
      data_in => tb_data_in,
      crc_out => tb_crc_out
    );

-- Clock process definitions
clk_process :process
begin
    tb_clk <= '1';
    wait for clk_period/2;
    tb_clk <= '0';
    wait for clk_period/2;
end process;

-- Stimulus process
stim_proc: process
begin       
  -- hold reset state for 100 ns.
  wait for 100 ns;  


  -- insert stimulus here

    tb_data_in <= x"56";        
    wait for clk_period;

    tb_data_in <= x"19";
    wait for clk_period;

    tb_data_in <= x"59";
    wait for clk_period;

    tb_data_in <= x"17";
    wait for clk_period;

    wait;
    
end process;
wait for 0; 
END;