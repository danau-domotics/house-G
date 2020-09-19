# house-G

## English Intro

Inhouse domotics project that is older than Danau Domotics itself.

Most documentation in project is written in Dutch, since the house where this domotics project is done is located in the Netherlands.

## Nederlandse Introductie

Domotica project in eigen huis dat ouder is dan Danau Domotics zelf.

De meeste documentatie in dit project is geschreven in het Nederlands, want het huis waar dit project uitgevoerd is staat in Nederland.



# Systeem functies en interactie met andere systemen



# Gebruikte componenten en onderdelen.

## Aansluit-schema



# Gebruikers Handleiding

TODO: stukje schrijven



# Onderhouds Handleiding

- [Systeem Uitschakelen](./handleiding/uitschakelen.md)
- [Systeem Inschakelen](./handleiding/inschakelen.md), zowel standaard als nood-procedure
- Systeem Handbediening; TODO: toevoegen
- Verwisselen Actuator; TODO: toevoegen
- [Verwisselen Sensor](./handleiding/vervangen_sensor.md)
- [Verwisselen SD Kaart](./handleiding/vervangen_sd_kaart.md)
- Verwisselen 1-wire/USB bridge; TODO; toevoegen
- Verwisselen Centrale Controller; TODO: toevoegen
- [Probleem oplossing](./handleing/probleemoplossing.md)



# Ondersteuning Zoeken

## Algemeen domotica onderhoud
Op het moment dat deze tekst geschreven wordt (8 Mei 2020) is domotica helaas nog niet zo gestandaardiseerd als electrische installaties. Waar vrijwel elke gekwalificeerde electricien vrijwel elke electrische installatie kan aanpassen kunnen de meeste domotica specialisten helaas alleen domotica systemen ondersteunen die werkt volgens een hun bekende standaard.

## Benodigde kennis bij domotica/elektra/onderhouds leverancier

De volgende kennis is nodig om aanpassingen of reparaties te doen aan het afgifte-systeem bij House-G:
- Algemeen:
  - Kennis van Nederlandse taal (om deze handleiding te kunnen lezen).
  - Kennis van Engelse taal (om handleidingen van gebruikte componenten te kunnen lezen).
- Electrotechnisch:
  - Aansluiten van vaste UTP bedrading.
  - Aansluiten van 230 Volt bedrading.
- Software/IT:
  - Opzetten van en verbinden met WiFi netwerken.
  - Opzetten van en verbinden met UTP netwerken.
  - Minimale kennis van IPv4 netwerken.
  - Minimale kennis van IPv6 netwerken.
- Domotica:
  - Opzetten en aansluiten van 1-Wire (OneWire) sensor en actuator netwerken.
  - Begrip van concepten zoals 1-Wire over UTP.
  - Kennis van Linux, Raspberry PI en Raspbian
  - Kennis van vloerverwarmings-afgifte systemen (vloerverwarmingsverdelers en pomp).
  - Kennis/ervaring met laagspanning (5V) circuit borden
  - Kennis/ervaring met uitvoeren van Ansible scripts

Dit systeem maakt geen gebruik van ZigBee, Z-Wave, KNX of 433Mhz. Het is in theorie wel mogelijk om het systeem met deze technieken uit te breiden.
