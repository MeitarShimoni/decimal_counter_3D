# decimal_counter_3D

This project we have been asked to implement a Decimal counter with 3 digits on the Basys3 FPGA board.

![Decimal Counter 3D Schematic](Images/Decimal_Counter_3D_Schematic.png)

## Implementation:
[Divider:](new/Anode_encoder.vhd)

Components:
1. [Divider:](new/Anode_encoder.vhd) input 100M [Hz] clock to 5Hz and 500Hz clock. 
2. Counter: Counts from 0 to 9 (For each digit).
3. Segment Decoder: To Display the data.
4. Mux 4x1: toggle between the 3 digits.
5. Shift Register: moves the location of the digits.
6. Anode Encoder: Abode decoding for the Mux's Select.
