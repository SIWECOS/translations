# translations

Alle Texte für

* Business Layer
* Scanner
* Wiki

## Verzeichnisstruktur

```text
.
|- "texts"
|  |- scannerbezeichner
|  |  |- testname
|  |  |  |- "Background"
|  |  |  |  `- sprachdateien
:  :  :  :
|  |  |  `- "Solution_Tips"
|  |  |     `- sprachdateien
|  |  |- "_RESULTS"
|  |  |  `- ergebnistext
|  |  |     `- sprachdateien
|  |  `- "_SCANNER_NAME"
|  |      `- sprachdateien
|  `- "SIWECOS"
|     `- "_RESULTS"
|        `- ergebnistext
|           `- sprachdateien
`- "wiki"
   |- "_WIKI_SCANNER"
   |  |- "_use"
   |  `- sprachdateien
   `- seitenname
      |- "link"
      |  `- sprachdateien
      `- "wikitext"
         `- sprachdateien
```

### *sprachdateien*

In der Beschreibung oben sind einige Verzeichnisse als ''sprachdateien'' bezeichnet.
In diesen befindet sich für jede Sprache eine Datei, die den Text in der jeweiligen Landessprache enthält.
Also z.B. "de.wiki" und "en.wiki".

### Verzeichnisse

* **texts**
  \
  In diesem Verzeichnis finden sich alle Texte, die der Business Layer und die Scanner benötigen.

  Die Beschreibung der Scanner wird, über ein Template zusammengefasst, ebenfalls ins Wiki eingetragen.

  * *scannerbezeichner*
    \
    Dies ist der Kurzname eines unserer Scanner ("TLS", "HEADER"…).
    In diesen Verzeichen sind die Texte der Scanner gespeichert.
  
    * *testname*
      \
      Jeder Scanner hat verschiedene Tests.
      Für jeden Test gibt es ein Verzeichnis, das erklärenden Text zu dem Test enthält.
      Für jeden Test gibt es vorgegebene Bereiche, zu denen es je einen Text geben muss.
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

        Es ist möglich, mehr als eine Kategorie anzugeben. In dem Fall sollten die Kategorien Zeile für Zeile aufgeführt werden.

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
        Wenn hier also "Test 1" in jeder Sprache gespeichert ist, lautet der Seitenname "Test_1/DE" für die Deutsch und "Test_1/EN" für Englisch.

      * **Details**
        \
        Scheint momentan nicht verwendet zu werden.

    * **_RESULTS**
      \
      In diesem Verzeichnis finden sich alle Texte, die der Scanner benötigt.
      Für jeden Text gibt es ein Verzeichnis dessen Name der Textname ist.

      * *ergebnisname*
        \
        In jedem Verzeichnis gibt es je eine Sprachdatei ("de.wiki", "en.wiki"…) für den Text in der jeweiligen Landessprache.

    * **_SCANNER_NAME**
      \
      In diesem Verzeichnis gibt es je eine Sprachdatei ("de.wiki", "en.wiki"…) für den Namen des Scanners in der jeweiligen Landessprache.

  * **SIWECOS**
    \
    Dieses Verzeichnis hat nur ein Unterverzeichnis "**_RESULTS**", das genauso aufgebaut ist,wie das **_RESULTS** Verzeichnis bei den Scannern.

* **wiki**
  \
  In diesem Verzeichnis sind alle Texte zu finden, die ins Wiki geladen werden.

  * **_WIKI_SCANNER**
    \
    Das Wiki Template wird für die Testbeschreibungen verwendet.

    Der Template Text ist ein Wiki-Text und wird für jede Sprache in einer eigenen Sprachdatei ("de.wiki", "en.wiki"…) gespeichert

    Alle referenzierten Unterbereiche müssen in der Datei **_use** aufgelistet werden.

  * *seitenname*
    \
    Hier sind die Seiten unseres Wikis zu finden, die wir übersetzen lassen.
    Dementsprechend finden sich in den Unterverzeichnissen hier wieder Sprachdateien.

    * **link**
      \
      Dieses Verzeichnis entspricht dem Verzeichnis **Link**, das oben bei den Business Layer Texten beschrieben ist.

    * **wikitext**
      \
      Hier finden sich die Sprachdateien fürs Wiki.

## Scripte

Um die Texte in SIWECOS und im Wiki verfügbar zu machen, werden verschiedene Scripte verwendet.

Außerdem gibt es Scripte um die Texte ins PO-Format und wieder zurück in die Verzeichnisstruktur zu überführen.

### `dir2lang`

Mit diesem Script werden alle Text in je eine Sprachdatei pro Sprache und Scanner zusammengefasst.
Sie sollten im Verzeichnis `build/siwecos-business-layer` gespeichert werden.
Der Pfad zu diesem Verzeichnis wird in `siwecos.conf` unter `LANGUAGE_DIR` festgelegt. Ansonsten werden die Dateien im Verzeichnis `lang`, das sich im selben Verzeichnis wie `dir2lang` befindet, abgelegt.

Fürs Zusammenfassen werden alle verwendeten Texte mithilfe des SIWECOS Wikis in HTML ungeformt.
Eventuelle Fehler wie z.B. fehlende Links werden dabei gemeldet.

Es ist also notwendig, für das Wiki einen passwortgeschützen API Zugriff einzurichten und die Daten in der Datei `wiki.conf` zu hinterlegen.

### `dir2wiki`

Mit diesem Script werden Texte in unserem Wiki aktualisiert.

In `wiki.conf` müssen die Zugangsdaten fürs Wiki hinterlegt sein.

### `checkwiki`

Mit diesem Script können wir prüfen ob alle Seiten im Wiki vorhanden sind.

### `dir2po` **in Arbeit**

Mit diesem Script werden die Texte in je eine Sprachdatei pro Sprache und Scanner zusammengefasst.
Sie werden im Verzeichnis `poedit`, das sich im selben Verzeichnis wie `dir2po` befindet, abgelegt.

Diese Dateien lassen sich an Übersetzer geben, um die Texte in andere Sprachen zu übersetzen.

### `po2dir` **in Arbeit**

Dieses Script nimmt die bearbeiteten Sprachdateien und fügt die Texte wieder in die Verzeichnisstruktur ein.
