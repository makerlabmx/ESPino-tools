# ESPino

Puedes programar el ESPino con el IDE de Arduino para ESP8266 o en LUA con el firmware node-mcu.

## Instalando el Driver USB

- Mac OSX: 

	1. Ve a la carpeta ``Drivers`` y haz doble click sobre ``SiLabsUSBDriverDisk.dmg``
	2. Ejecuta ``Silicon Labs VCP Driver.pkg`` y sigue las instrucciones

- Windows:

	1. Ve a la carpeta ``Drivers`` y descomprime ``CP210x_VCP_Windows.zip``
	2. Ejecuta el instalador correspondiente a tu sistema (x86 o x64).

- Linux:
	
	Debe captarlo automáticamente y montarlo en ``/dev/ttyUSB0`` o similar.

## Programando con Arduino IDE para ESP8266

Puedes encontrar instrucciones de instalación y documentación aquí: https://github.com/esp8266/Arduino

Videotutorial paso a paso de instalación y uso con ESPino: https://youtu.be/HYZPlrH3jCE

## Utilizando el IDE ESPlorer

- Carga el firmware node-mcu en el ESPino, las instrucciones se encuentran más adelante en este documento
- Asegúrate de tener instalado el entorno Java en tu PC (https://www.java.com/es/download/)
- Ejecútalo con doble click a ESPlorer.jar, o en Windows, ESPlorer.bat
- Selecciona el puerto serial correspondiente, 9600 bauds y da click en open
- Puede que te de un error de que no se recibió la respuesta esperada, esto es normal
- Puedes abrir uno de los ejemplos en la carpeta ``examples``, lo ejecutas con "Send to ESP" (no se guarda permanentemente en el ESP, por lo que si lo reinicias se pierde)
- Puedes guardarlo en el ESP con "Save to ESP", para que se ejecute automáticamente cuando inicia el ESP, hay que guardarlo con el nombre ``init.lua``
- Puedes ver la documentación de node-mcu aquí: https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en

## Documentacíon

Puedes encontrar el Datasheet, esquemático y demás documentación del ESPino en la carpeta "Docs" incluida con este archivo.

## Cargando el firmware node-mcu

Para poder programar el ESPino en LUA, es necesario cargarle el firmware node-mcu, para ello haz lo siguiente:

### Windows

1. Conecta el ESPino a la PC por medio de un cable micro-USB, asegúrate de antes haber instalado el driver correspondiente
2. Ejecuta el programa "ESP8266Flasher.exe"
3. Selecciona el puerto COM correspondiente al ESPino
  
  ![Screenshot 1](https://raw.githubusercontent.com/makerlabmx/ESPino-tools/master/Docs/espflasher1.png)

4. En la pestaña "Config", presiona el ícono de engrane del primer elemento y selecciona el archivo de firmware que se desee. En la carpeta "nodemcu-firmware" se encuentran dos versiones de éste, con y sin soporte de punto flotante.
  
  ![Screenshot 2](https://raw.githubusercontent.com/makerlabmx/ESPino-tools/master/Docs/espflasher2.png)

5. Pon el ESPino en modo Bootloader:
  
  I. Presiona los botones RESET y USER/PROG al mismo tiempo sin soltarlos
  
  II. Suelta el botón RESET, manteniendo USER/PROG presionado
  
  III. Espera un segundo y suelta USER/PROG

6. Haz click en "Flash" para subir el firmware
7. Al terminar, presiona el botón RESET
  
### OSX y Linux

Abre una terminal y ve a la carpeta donde está este archivo:

```
cd [dirección de esta carpeta]
```

Conecta el ESPino por USB y ponlo en modo Bootloader:

1. Presiona los botones RESET y USER/PROG al mismo tiempo sin soltarlos
2. Suelta el botón RESET, manteniendo USER/PROG presionado
3. Espera un segundo y suelta USER/PROG

Instala la dependencia serialport para esptool, ejecuta lo siguiente en la terminal:

```
sudo easy_install -U pyserial
```

Ejecuta lo siguiente en la terminal para subir el firmware:

```
esptool/esptool.py -p /dev/tty.SLAB_USBtoUART write_flash 0x000000 nodemcu-firmware/pre_build/latest/nodemcu_latest.bin
```

**Nota:** Puede que tengas que cambiar la dirección del puerto serial ``/dev/tty.SLAB_USBtoUART`` en la línea de comandos anterior por otra dependiendo de tu sistema.