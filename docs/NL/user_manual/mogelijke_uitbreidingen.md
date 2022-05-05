# Algemene uitbreidingen
Deze pagina geeft een overzicht van uitbreidings-ideeen voor het domoticasysteem in House-G.

## Extra bedienings-apparaten
Het is mogelijk om extra tablets, computers, smart-TVs, telefoons, smart-watches, e-readers, etc aan te sluiten om het systeem mee te bedienen.

## Moderner domotica platform
De huidige software is OpenHab. Het is mogelijk om de software te vervangen door een ander platform zoals Domoticz of Home Assistant.

## Industriele server
De huidige server van het systeem is een Raspberry PI. Dit is een systeem zonder bewegende onderdelen (dus relatief onderhoudsvrij). Het is mogelijk deze server te vervangen door een zwaardere (en duurdere, en in theorie veel betrouwbaardere) industriele server.

## Datum/tijd klok op batterij
De huidige Raspberry PI server heeft geen interne klok op batterij die de datum en tijd bijhoudt als de stroom uitvalt.
Het systeem haalt de datum en tijd wel op vanaf internet indien een internet verbinding beschikbaar is.

## Extra Notificatie Communicatiekanalen
Uitbreidingen voor notificaties (alarmen) via communicatie-kanalen als:
- Email
- XMPP
- SIP
- SMS
- VOIP

## Opslag historische gegevens
Grafieken die aangeven hoe de temperatuur en verwarming over tijd verloopt.



# Bediening/beheer op afstand
## Bediening op afstand
Bediening van de domotica buitenshuis via VPN of via een web-app.

## Beheer op lange afstand
Beheer van de software op afstand via het SSH protocol of via een VPN.

## Beheer op korte afstand
Beheer van software buitenshuis, maar wel op korte afstand via WiFi.

## Beheer over post
Beheer van software, d.m.v. het opsturen van geheugenkaartjes.
Vereist een kopie van de opstelling op afstand.




## Bak met extra reserve onderdelen
Reserve-onderdelen voor elk onderdeel in het netwerk.

## Uitlezen zonnepanelen
Veel domotica-systemen worden gekoppeld met de lokale API of de web-API van zonnepanelen om zonlicht generatie statistieken beschikbaar te maken.

## Uitlezen stroomgebruik
Stroom-meters op de buiten-leiding van de losse stroom-groepen om stroom-gebruik per groep te kunnen meten.

## Stroomgebruik koppeling via P1 kabel
Elektriciteits-meters in Nederland kunnen via een P1 kabel met domotica systemen gekoppeld worden om de informatie over gebruik via domotica beschikbaar te maken.

## Koppeling met brand-melders
Sommige brandmelders kunnen gekoppeld worden met het domotica-systeem.



# Verwarmingssysteem uitbreidingen
## In en uit-schakelen per ruimte
Het is ook mogelijk om de software uit te breiden met een optie om per ruimte de verwarming en koeling uit te schakelen.

## Blokkeren van radiatoren bij corrosie-risico
Het is mogelijk om een aanpassing aan de software te doen die het inschakelen van radiatoren bij een te lage brontemperatuur blokkeerd (i.v.m. corrosie risico).

## Open raam en open deur detectie.
Een uitbreiding met [Reed Relay](https://en.wikipedia.org/wiki/Reed_relay) sensoren bij ramen en deuren die automatisch de verwarming of koeling kunnen uitschakelen bij open ramen of deuren.

## Extra meet-systemen
Het is mogelijk om een [eBus uitbreidings-module](https://www.esera.de/shop/en/products/ebus/135/ebus-coupler-usb) aan het systeem te koppelen die de warmte-pomp sensoren (vat-temperatuur, buiten-temperatuur) beschikbaar maakt voor het afgifte-systeem. 
Via deze koppeling zou in theorie ook de warmte-pomp te bedienen zijn (schakelen tussen verwarmen en koelen).

## Vaste opslag van setpoints
Opslag van setpoints zodat deze na stroomuitval weer beschikbaar zijn.

## Wijzigen opstart-gegevens
Wijziging van standaard setpoints na opstarten en wijziging van "standaard (vorstbeveiliging)" mode naar bijvoorbeeld "Automatisch (verwarmen/koelen)".


## Ge-agendeerde instellingen.

### Weekschema
Instelling van temperaturen voor elke dag van de week.

### Dagschema
Instelling van temperaturen voor verschillende tijden van de dag.
Het duurt 4 tot 8 uur voor een vloerverwarming om de temperatuur aan te passen, dus het aantal nuttige setpoints is typisch beperkt tot 3 (ochtend-temperatuur, avond-temperatuur, nacht-temperatuur).

### Afwezigheids-instelling
Instelling van alleen vorstbeveiliging voor een bepaalde tijd.

## Redundant sensor netwerk
Tweede 1-wire netwerk naast het eerste netwerk dat of actief meedraait of ingeschakeld kan worden indien nodig.



# Comfort systemen
## Raam zonwering en verduistering
Het systeem kan uitgebreid worden met automatische bediening van elektrische zonwering, elektrische luiken, elektrische luifels, elektrische gordijnen, elektrische lamellen en elektrische rolgordijnen indien deze te bedienen zijn via schakelcontacten of via een standaard draadloos protocol zoals ZigBee of Z-Wave.

## Automatische (van kleur veranderende) verlichting
Het systeem kan gekoppeld worden met automatische lampen (over ZigBee) zoals te koop bij IKEA of Philips en kan gebruikt worden in hotel-schakeling mode met bestaande licht-schakelaars.



# Softwarematige schakelsystemen
## Softwarematig buiten-stopcontacten in en uitschakelen.
Softwarematig aan en uit-schakelen van buiten-stopcontacten.

## Automatische kranen vlak na watermeter
Softwarematig aan en afsluiten van buitenkranen.

## Bediening elektrische garagedeur.
Aanbrengen bedienings-aansluitingen elektrische garagedeur.

## Detectie vaatwasser, wasmachine en/of droger activiteit.
Alarm via het domotica-systeem als de vaatwasser, was-machine of was-droger klaar is.



# Vijver uitbreidingen
## Automatisch waternivo bewaking
Automatisch bijvullen van vijverwater indien het vijver-waternivo te laag wordt.
Alarm indien het waternivo niet snel genoeg hoog genoeg wordt (lekkage detectie).
De electrische kraan voor dit systeem dient binnen geplaatst te worden (als onderdeel van vorst-beveiliging).

## Automatische pomp en UV-lamp bediening
Automatisch in- en uit-schakelen van UV-lamp en vijver-pomp op basis van:
- zonnepanelen opbrengst (alleen UV-lamp bij veel zonlicht, of alleen pomp op zonnige dagen)
- tijdstip (geen pomp 's nachts bijvoorbeeld) of op basis van handmatige bediening.

## Trommelfilter uitbreidingen
Diverse uitbreidingen rondom een nieuw trommelfilter.

## Automatische filterbak afvoer
Nieuwe vijver-filterbak met automatische kranen die vuil water aftappen (e.v.t. met laser-sensor die vuil meet per kraan).

## Automatisch Electronisch Winterklaar
Een aantal van bovenstaande uitbreidingen kunnen niet tegen bevriezen. Deze uitbreiding haalt automatisch onderdelen uit het water (of naar dieper water) indien de watertemperatuur te laag wordt.

## Automatische luchtpomp
Automatisch inschakelen van een luchtpomp indien de watertemperatuur te laag wordt.
