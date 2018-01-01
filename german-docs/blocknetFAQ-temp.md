# BLOCKNET

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

Destotrotz sollte man sich im Klaren darüber sein, dass wenn ein Handel abgeschlossen wurde und man die Coins erhalten hat, diese erst wieder nutzbar sind, wenn die jeweilige Blockchain genügend Bestätigungen generiert hat.

*Anmerkung: Eine zukünfige Verbesserung könnte einen Filter im Orderbuch vorsehen, damit Trader ihre Coins mit weniger als den notwendigen Bestätigungen bereits wieder handeln können, sofern diese als "safe" gesehen werden. Dies kommt dann Trading-T ypen entgegen, die ein stetigen Eingehen und Schließen einer Position benötigen, als Beispiel sei hier Scalping genannt.*


### Wie privat ist die dezentralisierte Börse?
Da eine dezentralisierte Börse vom Trader nicht verlangt, private Informationen jedweder Art einer dritten Partei mitzuteilen, geniessen sie ein höchstmöglichen Grad an Privatspähre.

However, for most wallets, aspects of transactions are linkable to IP addresses, so in order to obfuscate that, one might use TOR or I2P. The Blocknet’s DHT network overlay does not use IP addresses, however.

Combined with any privacy-centric coin, a decentralized exchange run over IP-obfuscating tech is a near-perfect mixing solution. For example, one may trade some coins for Zcash, sends them to a different address, and then trade back again.

### Welche weiteren Anwendungen ermöglicht das XBridge-Protokoll neben der dezentralisierten Börse?
The Blocknet is designed as infrastructure for the emerging token ecosystem. Any service or orchestrated sequence of microservices provided by dapps may be delivered over the Blocknet's infrastructure.

Using decentralized exchange, these services are intrinsically monetizable, removing the friction and high costs of traditional payment networks - friction which has prevented the monetisation of the bulk of the API ecosystem.

Due to the decentralized exchange, consumers of a service may pay in their native token even if the service consumes a different token.
 
 
### Welche Vorteile bringt es, eine Service-Node zu betreiben? Wie viele Blocks braucht man dazu?
There are two types of node: a "service node" and a “trader node”. Service nodes do not handle or control any trader's coins. Their function is to collect and distribute trade fees. Typically a service node operator will run multiple full node wallets of whichever coins (s)he wants to support, in order to garner as many trade fees as possible. Trader nodes enable one to trade on the decentralized exchange.The amount of BLOCK currently needed to run a service node is 5,000 BLOCK. To use the exchange you will not need any BLOCK.
 
 
### Wird es Gebühren für das Traden auf der dezentralisierten Börse geben?
Yes, there are fees, though they are significantly lower that centralised exchanges.

The fee structure is as follows:
  * Transactions over the networks of each of your currency pairs will remain subject to their normal network fees for P2SH transactions

  * A tiny trade fee is charged in BLOCK and the software takes care of securing some BLOCK to pay the fee.


### Werden Blocks benötigt, um auf der Börse aktiv zu werden?
No, to use the exchange you will NOT need any BLOCK. Only the service node operators will need BLOCK in order to collect and distribute trade fees. Additionally, the service nodes do not handle or control and trader’s coins. The sole purpose of the service node is to only collect and distribute trade fees.

---
Weitere Fragen und Antworten findet man auch auf Reddit: [Reddit Blocknet Q/A](https://www.reddit.com/r/theblocknet/comments/676buj/ask_anything_about_blocknet_qa/)
