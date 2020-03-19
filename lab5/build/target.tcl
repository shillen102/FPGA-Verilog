set ABS_TOP                         /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5
set TOP                            z1top
set FPGA_PART                      xc7z020clg400-3
set_param general.maxThreads       4
set_param general.maxBackupLogs    0
set RTL { /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/edge_detector.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/button_parser.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/tone_generator.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/z1top.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/uart_transmitter.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/debouncer.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/music_streamer.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/rom.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/uart.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/synchronizer.v /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/uart_receiver.v }
set CONSTRAINTS { /home/shillen/Desktop/eecs151/fpga_labs_fa19/lab5/src/PYNQ-Z1_C.xdc }
