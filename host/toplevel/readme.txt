Quartus host project
====================
There are 2 different physical "host" revisions targeted to two Altera FPGA boards (those I just happen to have):

1.  "EP2C8Q208 RedCore"
    eBay, based on EP2C8Q208C8N
    http://www.ebay.com/itm/EP2C8Q208C8N-Development-Board-kit-FPGA-CPLD-Altera-Cyclone-NIOS-II-with-2-4-LCD-/300954778152?ssPageName=ADME:X:AAQ:US:1123

2.  "EP2C5T144 RioRand"
    A small barebone FPGA board based on EP2C5T144C8

    Amazon:
    http://www.amazon.com/dp/B007YDTTEY/ref=pe_385040_30332190_TE_3p_M3T1_ST1_dp_1

You could add your own board revision that describes a board you have.

In addition, a ModelSim project to test the host uses "host_board_ModelSim.sv" and "test_host.sv". That is the third board, but it does not have a Quartus revision since it is only compiled through the ModelSim project.
