# House G - Systeembeschrijving


## Computer en domotica UTP netwerk bedrading

Huis G is voorzien van een UTP-netwerk met 3 centrale patch panelen.

| Code | Naam      | Locatie |
| ---  | ---       | ---     |
| G    | Garage    | In schuur/garage bij verwarmings-verdeler |
| M    | Meterkast | Begane grond in meterkast bij entree/hal  |
| W    | Waskamer  | Eerste verdieping, onder trap naar zolder |

Elke ruimte is via UTP aangesloten op 1 van de patch-panelen en patchpanelen G en W zijn beiden verbonden met paneel M.


## Domotica netwerk.

Het besturings-netwerk van het domotica-systeem gebruikt [1-wire](https://en.wikipedia.org/wiki/1-Wire) over UTP.

### Aansluitschema

TODO: toevoegen

### Gebruikte componenten

Gebruikte componenten in het systeem:

| Aantal | Functie                    | Component/Apparaat |
| ---    |  ---                       |  ---               | 
|      1 | Centrale Computer          | [Raspberry PI 3](https://www.raspberrypi.org/) |
|      1 | 1-wire host interface      | [USB-to-1wire Convertor](http://denkovi.com/usb-to-one-wire-interface-adaptor-converter-thermometer) |
|      2 | Pomp/Actuator aansturing   | [8 Kanaals Relay Module 1-wire](http://denkovi.com/1-wire-eight-channel-relay-module-for-home-automation-with-din-box) |
|    ~10 | Kamer temperatuur meten    | DS18B20 1-wire temperature sensor |
|    ~10 | Leiding temperatuur meten  | DS18B20 1-wire temperature sensor |
