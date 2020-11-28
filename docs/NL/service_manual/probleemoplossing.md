# Probleemoplossing

# De website met het verwarmings afgifte-systeem werkt niet.
Stappenplan:
- Controleer of de bedienings-tablet/computer/laptop/telefoon werkt.
- Controleer of de bedienings-tablet/computer/laptop/telefoon verbinding heeft met het Wifi-netwerk van het domotica systeem.
  - Indien deze verbinding niet werkt -> TODO: Verwijzen naar inschakelen centrale controller.
- Indien mogelijk: Controlleer of de tablet/computer/laptop/telefoon een IP-adres heeft in de 192.168.160.0/24 range
  - Indien deze verbinding niet werkt -> TODO: Verwijzen naar inschakelen centrale controller.
- Open de website [http://openhab.home:8080](http://openhab.home:8080) op de bedienings-tablet/computer/laptop/telefoon
  - Indien deze niet werkt: controleer of het systeem stroom heeft (zie inschakelen)


# Het 1-wire netwerk is beschadigd (bij een sensor of op centrale plek)
Stappenplan:
- Schakel het systeem [volledig uit](./uitschakelen.md).
- Koppel het beschadigde segment los bij patch-paneel M, G of W of bij routing-box M1W of W1W indien mogelijk. (Zie de systeembeschrijving voor de verbindingen.)
- Schakel het systeem in met [handmatige vorstbeveiliging](./inschakelen.md) indien noodzakelijk. (Alleen de pomp inschakelen, alle andere onderdelen stroomloos laten.)
- Bel een elektricien of andere expert die de netwerken kan doormeten en repareren.
- Schakel het systeem weer [in](./inschakelen.md) na reparatie.


# Het douchewater, badwater of wasbak water is te koud.
Het verwarmen van het douchewater is geen functie van het verwarmings-afgifte-systeem. Zie de handleiding en ondersteuning voor de warmtepomp voor de warmwater voorziening.


# Een van de ruimtes in het huis te warm of te koud.
Stappenplan:
- Controleer of er in huis ramen open staan.
  - Openstaande ramen op de bovenverdieping kunnen koeling geven voor de benedenverdieping.
- Controleer (met de tablet) of het systeem op koelen of verwarmen staat.
- Controleer (met de tablet) het setpoint voor de ruimte waar het te koud of te warm is.
- Controleer de warmtepomp (is deze ingeschakeld, werkt deze).
  - Indien de warmtepomp niet werkt, check dan de handleiding en ondersteuning voor de warmtepomp.
- Controleer of het buffervat de juiste temperatuur heeft.
  - Voor verwarmen moet de temperatuur hoger zijn dan de gewenste temperatuur in de ruimte. (Het buffervat is bij verwarmen meestal tussen de 25 en 40 graden.)
  - Voor koelen moet de temperatuur lager zijn dan de gewenste temperatuur in de ruimte. (Het buffervat is bij koelen meestal tussen de 18 en de 20 graden.)
    - I.v.m. mogelijke condensvorming wordt er meestal geen lagere temperatuur gebruikt dan 18 graden.
- Controleer of de circulatiepomp draait om de ruimte te koelen of te verwarmen.


TODO: tekst toevoegen over uitschakelen verwarming indien ramen open staan.
