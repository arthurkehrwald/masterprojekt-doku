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

Die Herausforderung liegt in der Kombination einer autostereoskopischen Darstellung mit Transparenz und Bewegungsparallaxe. Das bei autostereoskopischen Displays am weitesten verbreitete Mittel zur Bildkanaltrennung ist das Linsenraster. Das austretende Licht wird dabei durch eine optische Schicht so abgelenkt, dass einzelne Pixelspalten nur aus bestimmten Blickwinkeln zu sehen sind. Dadurch können in benachbarten Pixelspalten unterschiedliche Bildkanäle angezeigt werden, ohne dass es zu einem Übersprechen kommt. Bei einem transparenten Display würde eine solche Linsenoptik alles hinter dem Display unkenntlich machen. Mit einer Parallaxbarriere, einer primitiveren Alternative zum Linsenraster, ist das nicht der Fall. Anstatt Licht abzulenken wird es durch schwarze vertikale Streifen einige Millimeter über der Bildfläche blockiert. Licht kann somit ohne starke Diffraktion durch das Display passieren. Die Helligkeit wird allerdings bei zwei Bildkanälen um mindestens die Hälfte reduziert.

Wie eine Rasterlinsenoptik hat auch eine statische Parallaxbarriere einen sogenannten "Sweetspot". Bei Betrachtungspunkten außerhalb dieses Bereichs kommt es zu Fehlern in der Kanaltrennung. Um an beliebigen Standpunkten eine korrekte Darstellung zu ermöglichen, soll die Parallaxbarriere daher auf einem LCD dargestellt werden, sodass sie dynamisch an den aktuellen Betrachtungspunkt angepasst werden kann. Die daraus resultierende Einschränkung auf einen gleichzeitigen Betrachter wird dabei in Kauf genommen.

Das Bild wird auf der zweiten Displayschicht hinter der Parallaxbarriere auf einem weiteren LCD oder einem transparenten OLED-Panel angezeigt. Als Alternative zur Parallaxbarriere lässt sich ohne Veränderungen am Versuchsaufbau auch mit Lichtfeldsynthese experimentieren (Computational Display).

== Komplikationen

Bei einer Umsetzung werden voraussichtlich folgende Probleme auftreten:
- Die Darstellungsqualität ist äußerst empfindlich für Verzögerungen bei der Anpassung an den Betrachtungspunkt. Da hinter dem Display echte Objekte zu sehen sind, die stets unmittelbar aus der korrekten Perspektive erscheinen, fallen besonders bei schnellen Änderungen des Betrachtungspunktes selbst minimale Verzögerungen von einigen Millisekunden negativ auf.
- Die Lichtdurchlässigkeit ist durch die Überlagerung mehrerer Displayschichten reduziert. Es gilt, die Displays so auszuwählen und die Parallaxbarriere so zu konstruieren, dass der Aufbau insgesamt möglichst lichtdurchlässig ist. Dazu eignet sich für die hintere Schicht ein transparentes OLED und für die vordere Schicht ein monochromes LCD. Die Beschaffung solcher Displays ist allerdings im Vergleich zu farbigen LCDs deutlich aufwändiger, weil es sich nicht um Massenware handelt. Gegebenenfalls ist außerdem eine Beleuchtung der Objekte hinter der Bildfläche und/oder ein Abdunkeln der Umgebung notwendig.
- Es können durch die Überlagerung zweier Pixelraster Interferenzmuster wie der Moiré-Effekt und durch die stereoskopische Darstellung ein Übersprechen zwischen den Bildkanälen auftreten.
- Die Displayschichten sind leicht diffus, weil sie Mikrostrukturen enthalten, die das Licht unregelmäßig brechen. Dadurch erscheint der Bereich hinter der Bildfläche mit zunehmender Distanz unscharf. Möglicherweise kann diese Unschärfe durch die Verwendung bestimmter Displays, zum Beispiel solcher mit einer geringen Pixeldichte, deutlich reduziert werden.

== Aufgaben

=== Literaturrecherche

Zunächst sollen bestehende Forschungsarbeiten, aber auch kommerzielle Produkte analysiert und verglichen werden um prüfen, ob es schon Displays mit den gewünschten Eigenschaften gibt, herauszufinden, welche Lösungen für die im ersten Abschnitt beschriebenen Teilprobleme existieren, um diese dann bestmöglich zu kombinieren.

=== Konstruktion und Prototypenbau

#figure(
  grid(
    columns: 2,
    gutter: 2em,
    image("bilder/displaymodul-frontal.png", height: 40%),
    image("bilder/displaymodul-seitenansicht.png", height: 40%)
  ),
  caption: [Front- und Seitenansicht der geplanten Display-Baugruppe]
)

Ein Prototyp wird in einer CAD-Software konstruiert und im Maker Space der TH Köln gebaut. Die strukturellen Elemente sind Acrylglasplatten und Extrusionsprofile aus Aluminium. Der Prototyp besteht aus folgenden Baugruppen:

- _Display-Baugruppe_, in der die beiden Displayschichten mitsamt Ansteuerungselektronik und Spannungsversorgung untergebracht sind.
- _Rechner-Baugruppe_ mit einem Computer, auf dem unsere Software läuft, und einem gewöhnlichen Bildschirm, der zu ihrer Konfiguration dient.
- _Schaukasten_, in dem sich eine beleuchtete Demoszene mit einem kleinen Roboterarm befindet.
- _Aufstellrahmen_, an dem allen anderen Module befestigt und aufrecht hingestellt werden können.

=== Softwareentwicklung

Es wird eine Software entwickelt, die auf dem Prototypen ein dreidimensionales Bild darstellen kann. Dazu müssen Stereo-Bilder einer dreidimensionalen Szene aus einer mit der erfassten Betrachtungsposition übereinstimmenden Off-Axis-Perspektive in Echtzeit mit einer passenden Parallaxbarriere berechnet werden. Außerdem ist dafür zu sorgen, dass die beiden Displays und die Lautsprecher zeitlich synchronisiert sind.

Als technische Grundlage ist die Verwendung der Game Engine Unity geplant, weil sie durch ihr sogenanntes XR-Provider-Interface die Möglichkeit bietet, effizient (ohne zweimalige Ausführung der Render-Pipeline) Stereobilder zu rendern und dabei die Positionsdaten unseres Trackingsystems zum spätest-möglichen Zeitpunkt in diesen Prozess einzubinden, sodass die Latenz durch das Rendering so gering wie möglich bleibt. Außerdem unterstützt Unity Ambisonics-Tonwiedergabe und Inferenz mit zahlreichen neuronalen Netzen, die für unser Trackingsystem relevant sind und ist auf Windows, Linux und MacOS lauffähig, sodass die Wahl des Betriebssystems nicht eingeschränkt wird. Für die Entwicklung einer Demo-Anwendung ist Unity ebenfalls gut geeignet.
