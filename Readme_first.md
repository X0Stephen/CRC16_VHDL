# CRC16_VHDL
CRC16_VHDL GENISBUS : Polynome: x"1021, ini x"FFFF" finale x"FFFF". 
# If you want to use as a package 
1st use the correct library : use work.pkg_crc16.all
2nd create a signal to store the calculated CRC
3rd call the function : Here is an example : crc_value <= not compute_crc(your_data(7 downto 0),crc_value);
! MAKE SURE YOU ADD THE NOT Before the compute_crc function "you can modify the initial and final value inside the package or design". ! 
In my case i have calculated the CRC of a data iniside the address 007

![image](https://github.com/EagleStephen/CRC16_VHDL/assets/102225620/521eeb90-f8f6-425f-8dee-d1842ffcf7a2)

You can use these calculators to verify if your crc value is correct : 
crccalc.com : choose CRC-16/GENIBUS
sunshine2k.de/coding/javascript/crc/crc_js.html : choose CRC-16 - Custom - Polynomial : 0x1021 - Initial Value : 0xFFFF - Final Xor Value - 0xFFFF , Bytes

# If you want to use the manual code 
Just download the design and the testbench then create your work library via Modelsim then vcom *.vhd then vsim tb_crc.vhd and run 150000ps. 


