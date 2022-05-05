# Probleemoplossing

# De website met het verwarming afgifte-systeem werkt niet.
Stappenplan:
- Controleer (in de meterkast) of de centrale controller stroom heeft.
  - Op de centrale controller brand een rood lampje als hij stroom heeft.
    - Als het rode lampje niet brand, controleer dan of de stroom-adapter werkt (en vervang deze als die niet werkt).
    - Het systeem heeft een USB (5 Volt) voeding van 2.5 Ampere of hoger nodig.
  - De centrale controller heeft ook een groen lampje dat soms knippert.
    - Dit is vooral goed te zien direct nadat de controle stroom krijgt.
    - Als dit groene lampje nooit knippert, dan kan de SD kaart in de controller beschadigd zijn.
- Controleer of de bediening-tablet/computer/laptop/telefoon werkt.
- Controleer of de bediening-tablet/computer/laptop/telefoon verbinding heeft met het Wifi-netwerk van het domotica systeem.
  - Indien het systeem ingeschakeld is, maar geen Wifi netwerk aanbied, dan zou de centrale controller of de SD kaart in de controller stuk kunnen zijn.
  - Probeer de centrale controller te herstarten (door de stroom van het systeem af te halen en er weer op te zetten).
  - Indien dit niet werkt, vervang dan de controller of de SD kaart.
- Als Wifi werkt, controleer dan de tablet/computer/laptop/telefoon een IP-adres heeft in de 192.168.160.0/24 range
  - Indien Wifi werkt, maar het IP adres niet in de juiste range zit, probeer de centrale controller te herstarten (door de stroom van het systeem af te halen en er weer op te zetten).
  - Als dit niet helpt, dan zou de [SD-kaart](vervangen_sd_kaart.md) in de centrale controller stuk kunnen zijn.
- Open de website [http://openhab.home:8080](http://openhab.home:8080) op de bediening-tablet/computer/laptop/telefoon
  - De DNS service was niet operationeel op het moment van oplevering; open de website via [http://192.168.160.10:8080](http://192.168.160.10:8080) indien DNS nog niet werkt.


# Het 1-wire netwerk is beschadigd (bij een sensor of op centrale plek)
Stappenplan:
- Schakel het systeem [volledig uit](./uitschakelen.md).
- Koppel het beschadigde segment los bij patch-paneel M, G of W of bij routing-box M1W of W1W indien mogelijk. (Zie de systeembeschrijving voor de verbindingen.)
- Schakel het systeem in met [handmatige vorstbeveiliging](./inschakelen.md) indien noodzakelijk. (Alleen de pomp inschakelen, alle andere onderdelen stroomloos laten.)
- Bel een elektricien of andere expert die de netwerken kan doormeten en repareren.
- Schakel het systeem weer [in](./inschakelen.md) na reparatie.


# Het douchewater, badwater of wasbak water is te koud.
Het verwarmen van het douchewater is geen functie van het verwarming-afgifte-systeem. Zie de handleiding en ondersteuning voor de warmtepomp voor de warmwater voorziening.


# Een van de ruimtes in het huis te warm of te koud.
Stappenplan:
- Controleer of er in huis ramen open staan.
  - Openstaande ramen op de bovenverdieping kunnen koude geven voor de benedenverdieping.
- Controleer (met de tablet) of het systeem op koelen of verwarmen staat.
- Controleer (met de tablet) het setpoint van de ruimte waar het te koud of te warm is.
- Controleer de warmtepomp (is deze ingeschakeld, werkt deze).
  - Indien de warmtepomp niet werkt, check dan de handleiding en ondersteuning voor de warmtepomp.
- Controleer of het buffervat de juiste temperatuur heeft.
  - Voor verwarmen moet de temperatuur hoger zijn dan de gewenste temperatuur in de ruimte. (Het buffervat is bij verwarmen meestal tussen de 25 en 40 graden.)
  - Voor koelen moet de temperatuur lager zijn dan de gewenste temperatuur in de ruimte. (Het buffervat is bij koelen meestal tussen de 18 en de 20 graden.)
    - I.v.m. mogelijke condensvorming wordt er meestal geen lagere temperatuur gebruikt dan 18 graden.
- Controleer of de circulatiepomp draait om de ruimte te koelen of te verwarmen.

