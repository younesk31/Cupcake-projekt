![alt text](https://i.imgur.com/iGlmYeK.png)
# Baggrund
Vi har landet en vigtig opgave fra Olsker Cupcakes. Det er endnu et dybdeøkologisk iværksættereventyr fra Bornholm, som har ramt den helt rigtige opskrift. Et par hipstere fra København har været forbi bageriet, og indsamlet nogle krav og lavet en halvfærdig mockup af en tænkt forside. En mockup er en meget løs skitse, som viser hvordan det færdige website skal se ud. Det er selvfølgelig ikke alt som er med, og som er tænkt igennem, så det er vores opgave at stille spørgsmål til manglende funktionalitet, komme med forslag osv.

Når man som leverandør skal løse sådan en opgave, er det godt at dele opgaven op i små etaper. Så tænk fra starten over hvor lidt vi kan lave for at få den første prototype i luften. Med andre ord: vi skal ikke lade os forblænde af hipsternes farver og striber og mange funktionaliteter. Vi æder elefanten lidt ad gangen.

# Userstories (funktionelle krav)
Det første kundemøde mundede ud i en række såkaldte user-stories. De beskriver på kort form hvilke brugere, som har hvilke behov og hvad de ønsker at opnå. Det kan godt være at der dukker flere user-stories op undervejs i processen, eller I vælger at stryge nogle af dem:

US-1: Som kunde kan jeg bestille og betale cupcakes med en valgfri bund og top, sådan at jeg senere kan køre forbi butikken i Olsker og hente min ordre.

US-2 Som kunde kan jeg oprette en konto/profil for at kunne betale og gemme en en ordre.

US-3: Som administrator kan jeg indsætte beløb på en kundes konto direkte i MySql, så en kunde kan betale for sine ordrer.

US-4: Som kunde kan jeg se mine valgte ordrelinier i en indkøbskurv, så jeg kan se den samlede pris.

US-5: Som kunde eller administrator kan jeg logge på systemet med email og kodeord. Når jeg er logget på, skal jeg kunne min email på hver side (evt. i topmenuen, som vist på mockup’en).

US-6: Som administrator kan jeg se alle ordrer i systemet, så jeg kan se hvad der er blevet bestilt.

US-7: Som administrator kan jeg se alle kunder i systemet og deres ordrer, sådan at jeg kan følge op på ordrer og holde styr på mine kunder.

US-8: Som kunde kan jeg fjerne en ordre fra min indkøbskurv, så jeg kan justere min ordre.

US-9: Som administrator kan jeg fjerne en ordre, så systemet ikke kommer til at indeholde udgyldige ordrer. F.eks. hvis kunden aldrig har betalt.

# Ikke-funktionelle krav
1. Der laves en mockup i Adobe XD, som viser de websider den færdige løsning kommer til at bestå af.
2. Ordrer, kunder og øvrige data skal gemmes i en database.
3. Databasen skal normaliseres på 3. normalform.
4. Kildekoden skal deles på GitHub.
5. Det færdige produkt skal udvikles i Java, MySql, HTML, CSS, Twitter Bootstrap og køre på en Tomcat webcontainer.
6. Det færdige produkt skal i sidste ende køre på en Droplet hos Digital Ocean
7. Løsningen skal udvikles med udgangspunkt i vores startkode.

# Deliveries (det som skal leveres)
1. Et EER diagram over databasen.
2. Et kørende website, som løser Olsker Cupcakes behov. Websitet skal køre på en droplet hos Digital Ocean, så vi kan sende et link til kunden til gennemsyn. Aflever et link sammen med et link til jeres GitHub repository.
3. Hver user story implementeres en ad gangen. Kunden vil som minimum se en løsning på de første seks.
4. Når de første 6 user-stories er implementeret, tager I resten en ad gangen og ser hvor langt I når.
5. Der løber flere krav på senere på måneden i form af en lille rapport og anden teknisk dokumentation. Det optimale ville være hvis I er færdige med at kode webshoppen søndag den  den 25. april og så bruger den sidste uge på dokumentationen. Der indkaldes til briefing på rapporten mandag den 26. april kl. 11.00 - 12.00.

# Ressourcer
1. UI stuff
2. Mockup. Det er desværre kun forsiden vi har fået udleveret og det er okay at ændre layoutet.
Headergrafik

# The Bottoms

Bottom | Price
------------ | -------------
Chocolate | 5.00
Vanilla | 5.00
Nutmeg | 5.00
Pistacio | 6.00
Almond | 7.00


# The Toppings

Topping | Price
------------ | -------------
Chocolate | 5.00
Blueberry | 5.00
Rasberry | 5.00
Crispy | 6.00
Strawberry | 6.00
Rum/Raisin | 7.00
Orange | 8.00
Lemon | 8.00
Blue cheese | 9.00
