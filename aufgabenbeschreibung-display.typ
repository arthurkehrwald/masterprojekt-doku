#set text(
  lang: "de"
)

#set par(
    justify: true
)

= Aufgabenbeschreibung Displaytechnik

== Zielsetzung

Das Display soll folgende Eigenschaften haben:

- _Autostereoskopisch_: Das Display vermittelt den Eindruck von dreidimensionaler Tiefe, ohne dass eine Brille getragen werden muss.
- _Transparent_: Das Display ist lichtdurchlässig und unmittelbar hinter der Bildfläche befindliche Gegenstände bleiben erkennbar.
- _Bewegungsparallaxe_: Die Darstellung bleibt unabhängig von der Betrachtungsposition perspektivisch korrekt.

== Lösungsansatz

Die Herausforderung liegt in der Kombination einer autostereoskopischen Darstellung mit Transparenz und Bewegungsparallaxe. Das bei autostereoskopischen Displays am weitesten verbreitete Mittel zur Bildkanaltrennung ist das Linsenraster. Das austretende Licht wird dabei durch eine optische Schicht so abgelenkt, dass einzelne Pixelspalten nur aus bestimmten Blickwinkeln zu sehen sind. Dadurch können in benachbarten Pixelspalten unterschiedliche Bildkanäle angezeigt werden. Bei einem transparenten Display würde eine solche Linsenoptik alles hinter dem Display unkenntlich machen. Mit einer Parallaxbarriere, einer primitiveren Alternative zum Linsenraster, ist das nicht der Fall. Anstatt Licht abzulenken wird es durch schwarze vertikale Streifen einige Millimeter über der Bildfläche blockiert. Licht kann somit ohne starke Diffraktion durch das Display passieren. Die Helligkeit wird allerdings bei zwei Bildkanälen um mindestens die Hälfte reduziert.

Wie eine Rasterlinsenoptik hat auch eine statische Parallaxbarriere einen sogenannten "Sweetspot". Bei Betrachtungspunkten außerhalb dieses Bereichs kommt es zu Fehlern in der Kanaltrennung. Um an beliebigen Standpunkten eine korrekte Darstellung zu ermöglichen, soll die Parallaxbarriere daher auf einem LCD dargestellt werden, sodass sie dynamisch an den aktuellen Betrachtungspunkt angepasst werden kann. Die daraus resultierende Einschränkung auf einen gleichzeitigen Betrachter wird dabei in Kauf genommen.

== Komplikationen

Bei einer Umsetzung werden voraussichtlich folgende Probleme auftreten:
- Die Darstellungsqualität ist äußerst empfindlich für Verzögerungen bei der Anpassung an den Betrachtungspunkt. Da hinter dem Display echte Objekte zu sehen sind, die stets unmittelbar aus der korrekten Perspektive erscheinen, fallen besonders bei schnellen Kopfbewegungen selbst minimale Verzögerungen von einigen Millisekunden negativ auf.
- Die Lichtdurchlässigkeit ist durch die Überlagerung mehrerer Displayschichten reduziert. Es gilt, die Displays so auszuwählen und die Parallaxbarriere so zu konstruieren, dass der Aufbau insgesamt möglichst lichtdurchlässig ist. Gegebenenfalls ist eine Beleuchtung der Objekte hinter der Bildfläche und/oder ein Abdunkeln der Umgebung dennoch notwendig.
- Es können durch die Überlagerung zweier Pixelraster Interferenzmuster wie der Moiré-Effekt und durch die stereoskopische Darstellung ein Übersprechen zwischen den Bildkanälen auftreten.

== Aufgaben

=== Literaturrecherche

Zunächst sollen bestehende Forschungsarbeiten, aber auch kommerzielle Produkte analysiert und verglichen werden um festzustellen ob es schon Displays mit den gewünschten Eigenschaften gibt, und gegebenenfalls einen besseren Lösungsansatz zu finden.
