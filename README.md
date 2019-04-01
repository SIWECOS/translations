# translations

Alle Texte für

* Business Layer
* Scanner
* Wiki

## Verzeichnisstruktur

```
.
|- "texts"
|  |- scannerbezeichner
|  |  |- testname
|  |  |  |- "Background"
|  |  |  |  `- text
:  :  :  :
|  |  |  `- "Solution_Tips"
|  |  |     `- text
|  |  |- "_RESULTS"
|  |  |  `- ergebnistext
|  |  |     `- text
|  |  `- "_SCANNER_NAME"
|  |      `- text
|  `- "SIWECOS"
|     `- "_RESULTS"
|        `- ergebnistext
|           `- text
`- "wiki"
   |- "_WIKI_SCANNER"
   |  `- text
   `- seitenname
      |- "link"
      |  `- text
      `- "wikitext"
         `- text
```

### Erläuterungen

* *text*
  \
  In den Verzeichnissen die oben als ''text'' bezeichnet werden, befindet sich, für jede Sprache eine Sprachdatei. Also z.B. "de.wiki" und "en.wiki".

* *scannerbezeichner*
  \
  Dies ist der Kurzname eines unserer Scanner ("TLS", "HEADER"…).
  In diesen Verzeichen sind die Texte der Scanner gespeichert.
  
* *testname*
  \
  Jeder Scanner hat verschiedene Tests.
  Für jeden Test gibt es ein Verzeichnis, das erklärenden Text zu dem Test enthält.
  Für jeden Test gibt es vorgegebene Bereiche, zu denen es je einen Text geben muß.
  Jeder der Bereiche (jedes Verzeichnis) hat einen definierten Namen

  * **Headline**
    \
    Eine Überschrift für den Test.

  * **Background**
    \
    Liefert Hintergrundinformatioenn zum Test.

  * **Description**
    \
    Beschreibt das Problem.

  * **Consequence**
    \
    Beschreibt die Folgen einer Fehl-/Nicht-Konfiguration

  * **Solution_Tips**
    \
    Beschreibt was getan werden kann, um den festgestellten Fehler zu beheben.

  * **Category**
    \
    Dient der Einordnung des Tests. Testet er einen *Angriff*, eine *Software Version*, den *Webserver*…

  * **Negative**
    \
    Eine Meldung, die im Falle eines negativen Testergebisses verwendet wird.

  * **Positive**
    \
    Eine Meldung, die im Falle eines positiven Testergebisses verwendet wird.

  * **Link**
    \
    Der Name der Beschreibungsseite des Tests in unserem Wiki.
    Für jede Sprache gibt es eine Datei die den Namen in der jeweiligen Landessprache definiert.
    An diesen Namen werden jeweils ein Schrägstrich ("/") und das Sprachenkürzel in Großbuchstaben automatisch angehängt.
    Dies stellt sicher, dass auch identische Bezeichner in verschiedenen Sprachen verwendet werden können.
    Wenn hier also "Test 1" in jeder Sprache gespeichert ist, lautet der Seitenname "Test_1/DE" für die Deutsch und "Test 2/EN" für Englisch.

  * **Details**
    \
    Scheint momentan nicht verwendet zu werden.
  
* **_RESULTS**
  \
  In diesem Verzeichnis finden sich alle Texte, die der Scanner benötigt.
  Für jeden Text gibt es ein Verzeichnis dessen Name der Textname ist.

  * *textname*
    \
    In jedem Verzeichnis gibt es je eine Sprachdatei ("de.wiki", "en.wiki"…) für den Text in der jeweiligen Landessprache.

* **_SCANNER_NAME**
  \
  In diesem Verzeichnis gibt es je eine Sprachdatei ("de.wiki", "en.wiki"…) für den Namen des Scanners in der jeweiligen Landessprache.

* **SIWECOS**
  \
  Dieses Verzeichnis hat nur ein Unterverzeichnis "**_RESULTS**", das genauso aufgebaut ist,wie das **_RESULTS** Verzeichnis bei den Scannern.




`SCANNER`
