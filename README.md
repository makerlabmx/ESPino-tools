# ESPino

ESPino comes with the node-mcu firmware preloaded (Lua).

## Installing the USB driver

- Mac OSX: 

	1. Go to the ``Drivers`` folder and open ``SiLabsUSBDriverDisk.dmg``
	2. Execute ``Silicon Labs VCP Driver.pkg`` and follow the instructions

- Windows:

	1. Go to the ``Drivers`` folder and unzip ``CP210x_VCP_Windows.zip``
	2. Execute the firmware corresponding to your system (x86 or x64).

- Linux:
	
	It should be automatically detected and mounted on ``/dev/ttyUSB0`` or similar.

## Using the ESPlorer IDE

- Launch it making double click on ESPlorer.jar, or on Windows, ESPlorer.bat
- Select the correct serial port, 9600 bauds and click open
- An error saying that the expected response was not received could appear, this is normal
- You can open one of the examles in the ``examples`` folder, and execute it with "Send to ESP" (it is not permanently saved to the ESP, it will be lost if it's restarted)
- You can save it in the ESP with "Save to ESP". If you want it to be executed as the ESP starts, you should save it with the name ``init.lua``
- You can see node-mcu's documentation here: https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en

## Documentation

You can find the Datasheet, schematic and other info of ESPino in the "Docs" folder included with this file.

## (Re)Uploading node-mcu firmware

If the firmware has ben overwritten and you want to go back to the node-mcu firmware, do the following:

Open a terminal and go to the folder where this file lies:

```
cd [path to this folder]
```

Connect the ESPino via USB and put it in Bootloader mode:

1. Press the RESET and USER/PROG buttons at the same time without releasing them
2. Release the RESET button, keeping USER/PROG pressed
3. Wait a second and release USER/PROG

Install the serialport deoendency for esptool, execute:

```
sudo easy_install -U pyserial
```

Execute the following for uploading the firmware:

```
esptool/esptool.py -p /dev/tty.SLAB_USBtoUART write_flash 0x000000 nodemcu-firmware/pre_build/latest/nodemcu_latest.bin
```

**Note:** You may need to change the serial port path ``/dev/tty.SLAB_USBtoUART`` in the previous command line depending on your system.