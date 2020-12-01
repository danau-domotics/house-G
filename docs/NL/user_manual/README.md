# Gebruikers handleiding verwarmings-afgifte-systeem

## Temperatuur instellen per ruimte
Per ruimte is een gewenste verwarmings-temperatuur (verwarming setpoint) en een gewenste koelings-temperatuur (koeling setpoint) in te stellen.
Indien de gewenste temperatuur van verschillende ruimtes erg verschilt, dan is het belangrijk deuren naar de ruimtes te sluiten om de gewenste temperatuur te bereiken.



## Systeem-Mode
Het systeem kan software-matig in de volgende standen ingesteld worden:
- Handbediening: Als het systeem op handbediening staat dan schakelen alle automatische functies (inclusief vorstbeveiliging) uit.
- Vorstbeveilging: Vorstbeveiliging is altijd actief (behalve in handbedienings-mode). Indien de systeem-functie op vorstbeveiliging staat dan zijn geen andere verwarming en koeling functies actief.
- Automatisch (Verwarmen/Koelen): In de automatische mode zal het systeem ruimtes automatisch de verschillende ruimtes verwarmen en koelen op basis van de setpoints, circulatie-tijden, aanvoer-temperatuur en de ruimte-temperaturen.
- Verwarmen: In deze mode zal het systeem alleen ruimtes verwarmen op basis van de ruimte-temperaturen en setpoints.
- Koelen: In deze mode zal het systeem alleen ruimtes koelen op basis van de ruimte-temperaturen en setpoints.

Bij het volledig stroomloos maken van de besturings-computers schakelt het systeem hardwarematig over op de volgende standaard-instelling:
- Woonkamer circuits open.
- Werkkamer circuit open.
- Badkamer (vloer) circuit open.
- Slaapkamer circuits open.
- Radiator circuits gesloten.
- Pomp uit (handbediend indien stekker wordt overgestoken)
Zie voor het inschakelen van deze mode de [Onderhouds Handleiding](../service_manual)



## Verwarming en open ramen
Zet de afgiftesysteem-functie op "VorstBeveiliging" bij langdurig ramen open zetten, bijvoorbeeld bij een dag doorluchten.
De verwarming inschakelen terwijl er ramen open staan zorgt voor verspilling van energie en kan de bodem-bron van de warmtepomp onnodig uitputten.

Zet ook geen ramen open midden in de winter als de vorstbeveiliging zou inschakelen.
De warmtepomp en warmtebron zijn berekend op normaal warmtegebruik.

Het is mogelijk het systeem uit te breiden met automatisch uitschakelen via [open raam en open deur detectie](./mogelijke_uitbreidingen.md) en/of met [in en uitschakelen per ruimte](./mogelijke_uitbreidingen.md).



## Koeling vs zonne-warmte
De volle zon zal het huis sterker verwarmen dan dat het koelings-systeem kan koelen. Indien het huis te sterk opwarmt in de zomer is het aan te raden om zonwering voor de ramen (of natuurlijke zonwering in de vorm van planten/bomen) aan te brengen.
Het is mogelijk om sommige zonwering [te koppelen](./mogelijke_uitbreidingen.md) met het domotica-systeem.



## Koeling en radiatoren
Nieuwe verwarmings-onderdelen (zoals vloer-verwarmings verdelers) zijn uitgevoerd met materialen die ook goed tegen koelen kunnen, de radiatoren in het huis zijn echter ouder dan de koelfunctie van het verwarmings-systeem.
Het is mogelijk om radiatoren in te schakelen terwijl de warmtepomp aan het koelen is, maar in verband met het risico van corrosie (vanwege condens/dauw) wordt het niet aangeraden om radiatoren in te schakelen tijdens koeling.
Het is mogelijk om de software aan te passen die [inschakelen van radiatoren bij een te lage brontemperatuur blokkeert](./mogelijke_uitbreidingen.md).



# Gebruikershandleiding bestand-service

OP het systeem staat een gedeelde map met een aantal (voor het huis) relevante documenten. De procedure om deze bestanden te open is:
- Maak vanaf een laptop (of tablet) verbinding met het WiFi netwerk van het systeem.
- Open de gedeelte mappen.
  - Op Windows gaat dit via Explorer op pad \\openhab.home\ of op pad \\192.168.160.10\
  - Op Apple en Linux gaat dit via pad smb://openhab.home of op pad smb://192.168.160.10/
- Kijk naar een map die begint met "user" en open deze.
- Gebruik de gebruikersnaam en wachtwoord voor het openen van deze share.
- Kopieer de map documenten naar de eigen laptop en naar een veilige backup.

Let op: Dit is geen algemene file-sharing service. Alle bestanden op deze share kunnen bij een toekomstige update van het systeem verdwijnen. Kopieer de bestanden naar een eigen laptop en/of naar een veilige backup om ze veilig te stellen.
