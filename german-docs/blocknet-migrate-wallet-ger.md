**Nötige Schritte zum Umziehen von der alten auf die neue Blocknet-Blockchain**

-   Als erstes erstelle ein Backup von der Datei wallet.dat (mache 2
    unabhängige Sicherungen)

-   In Windows findet man die Datei wallet.dat in dem Ordner
    C:\\Users\\User\\AppData\\Roaming\\blocknet (oder \\BlocknetDX in späteren
    Updates)

-   In OSX befindet sich die Datei wallet.dat in \~/Library/Application
    Support/blocknet\~/Library/Application Support/blocknet (oder /BlocknetDX in
    späteren Updates)

-   Entsperre deine Wallet komplett (also nicht nur zum staken) in dem
    Blocknet-Clienten (im Hauptmenü, „Settings“ \> „Unlock Wallet“)

-   Nutze nun die Debug-Konsole (im Hauptemü, „Tools“ \> „Debug Console“) und
    schreibe dort ```dumpwallet filename.txt``` (ersetze „filename.txt“
    durch einen Namen deiner Wahl)

-   Diese Datei wird nun in dem Verzeichnis erstellt, in dem auch das Start-Icon
    von deinem Blocknet-Client ist

**Lade dir den neuesten Blocknet-Clienten herunter**

-   Starte den Blocknet-Client

-   Nutze die Debug-Konsole und schreibe dort ```importwallet filename.txt``` (ersetze filename.txt durch den Dateinamen, den du im vorigen Schritt
    gewählt hast)

-   Versichere dich, dass die alten Adressen korrekt importiert wurden, indem du
    in der Debug-Konsole ```listreceivedbyaddress 0 true``` schreibst

**Wann soll man mit der wallet.dat umziehen und Grundlagen zur Nutzung des neuen
Clienten**

-   Immer dann, wenn ein Chain-Fork vorgenommen wird, muss man mit der
    wallet.dat auf die neue Chain umziehen

-   Wenn eine bestimmte Blocknet-Client -Version für einen Fork gebraucht wird,
    muss man diese Version herunterladen, sie synchronisieren, und die
    wallet.dat in das Hauptverzeichnis kopieren, bevor der Fork stattfindet

-   Bevor der Umzug, also der Fork stattgefunden hat, wird allerdings dein
    Guthaben nicht angezeigt werden

-   Zum Zeitpunkt des letzten Blocks wird ein Abbild der alten Chain erstellt

-   In dem Augenblick, wenn dieses Abbild auf die neue Chain übertragen wird,
    wird auch dein Guthaben wieder angezeigt

-   Zentralisierte Börsen werden dann in der Regel auch den Handel
    wiederaufnehmen, wenn klargestellt ist, dass der Umzug einwandfrei von
    statten gegangen ist

**Probleme beim Syncen der neuen Chain**

-   Schließe den Blocknet-Client

-   Mache eine Sicherungsdatei der wallet.dat bevor du etwas anderes machst
    (mache 2 unabhängige Sicherungen)

-   Sichere ebenso die blocknetdx.conf, sofern du eine Service-Node betreibst
    (mache 2 unabhängige Sicherungen)

-   Öffne den Blocknet-Client und lasse ihn die Chain synchronisieren

-   Ersetze die erstellte wallet.dat und gegebenenfalls die blocknetdx.conf mit
    deinen backups
