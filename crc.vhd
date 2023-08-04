library ieee; 
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity crc is 
port ( clk: in std_logic;
       data_in: in std_logic_vector(7 downto 0);             
       crc_genibus:out std_logic_vector(15 downto 0)
      );
end crc;

architecture crc_arch of crc is     
signal crc_x25 : std_logic_vector(15 downto 0);
function reverse_vector(v: in std_logic_vector)
return std_logic_vector is
    variable result: std_logic_vector(v'RANGE);
    alias vr: std_logic_vector(v'REVERSE_RANGE) is v;
begin
    for i in vr'RANGE loop
        result(i) := vr(i);
    end loop;

    return result;
end;    


function crc16( data_i: in std_logic_vector(7 downto 0);             
                     crc_i: in std_logic_vector(15 downto 0))
return std_logic_vector is  
    variable crc_o: std_logic_vector(15 downto 0);
begin
    crc_o(0) := crc_i(8) xor crc_i(12) xor data_i(0) xor data_i(4);
    crc_o(1) := crc_i(9) xor crc_i(13) xor data_i(1) xor data_i(5);
    crc_o(2) := crc_i(10) xor crc_i(14) xor data_i(2) xor data_i(6);
    crc_o(3) := crc_i(11) xor crc_i(15) xor data_i(3) xor data_i(7);
    crc_o(4) := crc_i(12) xor data_i(4);
    crc_o(5) := crc_i(8) xor crc_i(12) xor crc_i(13) xor data_i(0) xor data_i(4) xor data_i(5);
    crc_o(6) := crc_i(9) xor crc_i(13) xor crc_i(14) xor data_i(1) xor data_i(5) xor data_i(6);
    crc_o(7) := crc_i(10) xor crc_i(14) xor crc_i(15) xor data_i(2) xor data_i(6) xor data_i(7);
    crc_o(8) := crc_i(0) xor crc_i(11) xor crc_i(15) xor data_i(3) xor data_i(7);
    crc_o(9) := crc_i(1) xor crc_i(12) xor data_i(4);
    crc_o(10) := crc_i(2) xor crc_i(13) xor data_i(5);
    crc_o(11) := crc_i(3) xor crc_i(14) xor data_i(6);
    crc_o(12) := crc_i(4) xor crc_i(8) xor crc_i(12) xor crc_i(15) xor data_i(0) xor data_i(4) xor data_i(7);
    crc_o(13) := crc_i(5) xor crc_i(9) xor crc_i(13) xor data_i(1) xor data_i(5);
    crc_o(14) := crc_i(6) xor crc_i(10) xor crc_i(14) xor data_i(2) xor data_i(6);
    crc_o(15) := crc_i(7) xor crc_i(11) xor crc_i(15) xor data_i(3) xor data_i(7);
    return crc_o;
end;
begin 

    crc_genibus <= not crc16((data_in), x"FFFF");                                  -- CRC16 GENIS
    crc_x25 <=  reverse_vector(not crc16(reverse_vector(data_in), x"FFFF")); -- CRC16 X25

end architecture crc_arch; 
