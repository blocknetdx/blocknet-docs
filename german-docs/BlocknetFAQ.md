# BLOCKNET

Dieses Repo ist jetzt veraltet. Weitere Informationen finden Sie im Dokumentationsportal unter [https://docs.blocknet.co](https://docs.blocknet.co).

---

![alt text](https://github.com/BlocknetDX/blocknet-docs/blob/master/pictures/block.PNG "Logo Title Text 1")

Das Internet der Blockchains


## FAQ-Dokument erstellt durch die Community


### Was ist Blocknet?
Blocknet bietet die generelle Struktur für Dienste zwischen verschiedenen Blockchains. Blocknet dient dem aufkommenden Ökosystem der Tokens. Der erste Dienst auf Basis der Blocknet Infrastruktur ist eine dezentralisierte Börse.


### Wozu dient Blocknet?
Blocknet ermöglicht Dienste zwischen verschiedenen Blockchains. Als Beispiel seien hier die dezentralisierte Börse, die Wertschöpfüng von API-Systemen, und der digitale P2P-Austauch von Dienstleistungen genannt. Dies sind Kerneigenschaften für Anwendungen, die verschiedene Blockchains verknüpfen.


### Wie funktioniert Blocknet?
Um die Blockchain-übergreifenden Dienste zu unterstützen, biete Blocknet 3 Komponenten, die alle zusammen arbeiten um, die drei Kerndienste zu gewährleisten.

* Diese Komponenten sind:

  * der Blockchain-Router und die Xbridge-Technologie

  * das Tauschprotokoll für die Börse

  * der Datenaustausch zwischen den Blockchains

* Die Kerndienste sind:

  * der dezentralisierte Handel von Coins

  * Die Bereitstellung von Diensten übergreifend über verschiedene Blockchains

  * Die Wertschöpfung von Diensten
  
  
### Was ist eine dezentralisierte Börse?
Eine dezentralisierte Börse ist ein Dienst, der es zwei Parteien (entweder Menschen oder auch Maschinen) erlaubt, eine Währung oder einen Token ohne einen Mittelsmann zu tauschen. 

Der Begriff "dezentralisiert" umschreibt hierbei die volle Kontrolle des Handels im Gegensatz zur Verteilung des Prozesses auf mehrere Parteien; idealerweise ermöglicht die dezentrale Lösung die volle Souveränität der Parteien in dem Sinne, dass keine dritte Partei benötigt wird, um die Interaktion möglich zu machen.


### Wie funktioniert eine dezentralisierte Börse?
Börsen haben 4 Grundfunktionen:

  * Einlagen von Kapital

  * Darstellung von Aufträgen

  * Abgleich von Aufträgen (Handel)

  * Den Austausch von Tokens

Daher, um wirklich eine dezentralisierte Börse zu sein, müssen alle diese Kernfunktionen dezentral sein.

Blocknet dezentralisiert diese auf folgende Weise:

* Das Kapital des Traders verbleibt in dessen eigener Wallet, und er ist nicht darauf angewiesen, eine dritte Partei in irgendeinem Ablauf des Handels miteinzubeziehen.

* Orders werden direkt von Trader zu Trader über das DHT-Netzwerk Blockchainübergreifend veröffentlicht. Die Anwendung des Traders erstellt das Orderbuch eigenständig, anstatt sich auf einen zentralen Orderbuch-Service zu verlassen.

* Orders werden zwischen den Tradern automatisch abgeglichen. Wenn eine Partei einen Handel akzeptiert, erstellt die Anwendung beider Trader den Tausch, und übermittelt diesen über das blockchainübergreifende Netzwerk.

* Der Austausch von Tokens wird ohne einen Mittelsmann erreicht, in dem Sinne, dass die Gegenparteien sich nicht gegenseitig vertrauen müssen. Das "Atomic"-Protokoll wird dafür verwendet (dass bedeutet, entweder ist findet ein Handel statt, oder es passiert gar nichts), welches  das Protokoll OP_CHECKLOCKTIMEVERIFY, um Attacken während der Transaktion unmöglich zu machen. Weitere Informationen rund um dieses Protokoll findet man hier: http://kaykurokawa.blogspot.co.za/2015/10/atomic-cross-chain-transfer-overview.html


### Warum ist eine dezentralisierte Börse eine Grundvoraussetzung für das Token Ökosystem?
Dezentralisierte Börsen machen Blockchain Dienstleistungen an sich monetisierbar, unterbinden die Friktion und die hohen Kosten der traditionellen Zahlungsmethoden, welche die Wertschöpfung des ganzen API-Ökosystems unterbunden haben.

Mithilfe der dezentralisierten Börse kann ein Nutzer einen Dienst in seiner gewünschten Währung bezahlen, auch wenn dieser Dienst an sich eine andere Währung benötigt. In einer Welt, in der (a) bereits tausende Blockchains existieren, und (b) das Aufblähen der Blockchains nicht aufzuhalten ist, und es deshalb ratsam ist, nicht zu viele Dienste auf einer Blockchain anzubieten, sind Zwischen-Blockchains-Dienste eine Notwendigkeit und ein Dienst, der das Ökosystem erst möglich macht.


### Welche Coins unterstützt die dezentralisierte Börse?
Blocknet wurde mit maximaler Interoperabilität aufgestellt, deshalb können die meisten Blockchain Tokens ohne weiteres Programmieren integriert werden.

Aktuelle Vorraussetzungen für die Integration sind:

* Unterstützung von OP_CHECKLOCKTIMEVERIFY

* Ein JSON RPC Interface basierend auf dem Bitcoin Core

Daraus folgte, dass Blocknet einen Großteil der existierenden Kryptowährungen unterstützt, und man keine Erlaubnis von irgendjemandem einzuholen braucht, um diese auf der Börse zu handeln.


### Wie schnell ist die dezentralisierte Börse?
Direkt.

Destotrotz sollte man sich im Klaren darüber sein, daß, wenn ein Handel abgeschlossen wurde und man die Coins erhalten hat, diese erst wieder nutzbar sind, wenn die jeweilige Blockchain genügend Bestätigungen generiert hat.

*Anmerkung: Eine zukünfige Verbesserung könnte einen Filter im Orderbuch vorsehen, damit Trader ihre Coins mit weniger als den notwendigen Bestätigungen bereits wieder handeln können, sofern diese als "safe" gesehen werden. Dies kommt dann Trading-T ypen entgegen, die ein stetigen Eingehen und Schließen einer Position benötigen, als Beispiel sei hier Scalping genannt.*


### Wie privat ist die dezentralisierte Börse?
Da eine dezentralisierte Börse vom Trader nicht verlangt, private Informationen jedweder Art einer dritten Partei mitzuteilen, geniessen sie ein höchstmöglichen Grad an Privatspähre.

Für die meisten Wallets gilt allerdings, daß Transaktionen in gewissen Bereichen durchaus eine IP-Adresse zuzuordnen sind. Um dies zu umgehen, könnte man ein TOR- oder I2P-Netzwerk nutzen. Blocknets DHT-Netzwerktechnik bedient sich aber keiner IP-Adressen.

Zusammen mit einem stark privatsphäreschützenden Coin stellt eine solche IP-unabhängige Technik eine annähernd perfekte Lösung dar. Als Beipiel für eine schnelle "Verschleierung" kann man zB einen Handel von einem beliebigen Coin zu ZCash machen, welche man dann auf eine neue Adresse versendet, und von dort dann wieder zurückhandelt.

### Welche weiteren Anwendungen ermöglicht das XBridge-Protokoll neben der dezentralisierten Börse?
Blocknet dient als systemübergreifende Infrastruktur für das entstehende Token-Ökosystem. Jeder Dienst oder feingliedrige, gut abgestimmte Mikrodienst, kann mit passenden DApps über die Infrastruktur von Blocknet abgewickelt werden.

Durch das Nutzen der dezentralisierten Börse werden diese Dienste letzlich wertschöpfend, und bieten ausschließlich Vorteile gegenüber den traditionellen Zahlungsnetzwerken, deren nicht spannungsfreien Systemen eine Wertschöpfung eines Großteils der API-Systeme verhindert hat.

Mit und durch die dezentralisierte Börse kann ein Nutzer im Prinzip mit jeder beliebigen Währung/Token einen Dienst bezahlen unabhängig von dem eigentlichen zugrundeliegenden Wert.

### Welche Vorteile bringt es, eine Service-Node zu betreiben? Wie viele Blocks braucht man dazu?
Blocknet bietet zwei Typen von Nodes (Knotenpunkte im Netzwerk): ein "Service-Node" sowie eine "Trader-Node". Serviceknoten habe keinerlei Kontrolle über jedweden Coin des Handelnden. Ihre Funktion liegt einzig in der Einsammlung und Verteilung der Handelsgebühren. Ein typischer Service-Node-Operator wird voll synchronisierte Wallets jeder Kryptowährung laufen haben, die er unterstützen möchte, um idealerweise im Eigennutzen so viele Gebühren wie möglich einzuheimsen. Trader-Nodes ermöglichen den Handel auf der Börse durch ihre Präsenz. Für eine Service-Node braucht man aktuell 5000 Blocks, um auf der Exchange zu handeln braucht man prinzipiell keinerlei Blocks.
 
 
### Wird es Gebühren für das Traden auf der dezentralisierten Börse geben?
Ja, Gebühren werden erhoben, allerdings weit unterhalb gängiger Gebühren zentralisierter Börsen.

Die Gebühren setzen sich strukturell dabei wie folgt zusammen:
  * Transaktionen über die Netzwerke der austauschenden Währungen unterliegen den Gebühren, die das jeweilige Netzwerk für die P2SH-Transaktionen erhebt.

  * Eine zusätzliche geringe Gebühr, die in Block erhoben wird, wobei die Software dafür sorgt, daß beim Handel die benötigten Block für die Gebühren vorgehalten werden.


### Werden Blocks benötigt, um auf der Börse aktiv zu werden?
Nein, um die Börse zu nutzen, sind KEINE Block nötig. Ausschließlich die Service-Node-Operator benötigen die erwähnten Block, um die Gebühren einzusammeln und zu verteilen. Nichtsdestotrotz haben Service-Nodes keinerlei Kontrolle über die gehandelten Währungen. Einzig das Einsammeln und Verteilen der Gebühren ist die Aufgabe der Service-Nodes.

---
Weitere Fragen und Antworten findet man auch auf Reddit: [Reddit Blocknet Q/A](https://www.reddit.com/r/theblocknet/comments/676buj/ask_anything_about_blocknet_qa/)
