# SignMeUp.Cloud.Server

[![Chocolatey](https://img.shields.io/badge/Chocolatey-Ready-orange?style=flat-square)](https://community.chocolatey.org/packages/signmeup-cloud-server)
[![.NET](https://img.shields.io/badge/.NET-9.0%20%7C%2010.0-purple?style=flat-square)](https://dotnet.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**Server di firma digitale grafometrica e gestione documentale per ambienti enterprise.**

SignMeUp.Cloud è una piattaforma completa per la gestione del ciclo di vita dei documenti con firma grafometrica, progettata per integrarsi in contesti aziendali complessi tramite API REST e plugin dedicati.

## 🚀 Funzionalità Principali

* **Gestione Documenti**: API REST per caricamento PDF da applicazioni esterne e automazione del workflow.
* **Firma Multipla**: Acquisizione firma grafometrica con tablet/stylus (standard ISO 19794-7) e firma tramite OTP (SMS/Email).
* **Integrazione Enterprise**: Supporto nativo per Active Directory (SSO), Windows Integrated Auth e Machine-to-Machine tramite API Key.
* **Gestione Utenti e Ruoli**: Controllo degli accessi basato su ruoli (RBAC) e gestione avanzata delle postazioni fisiche.
* **Stampa Automatica**: Client integrato per la stampa e l'archiviazione su percorsi di rete post-firma.
* **Plugin Ready**: Moduli pre-integrati per la comunicazione con sistemi legacy (es. AS400) e generazione flussi (es. AccompagnamentoTXT).

## ⚙️ Requisiti di Sistema

* **Sistemi Operativi**: Windows Server 2016+ / Windows 10+ (x64)
* **Runtime**: [.NET Desktop Runtime](https://dotnet.microsoft.com/download) (Verifica la versione specifica richiesta dal pacchetto)
* **Database**: Microsoft SQL Server (2019+) o PostgreSQL (12+)

## 📦 Installazione

Il metodo consigliato per l'installazione e l'aggiornamento su ambienti Windows è tramite **Chocolatey**. L'automazione configurerà i file e reigstrerà il Servizio Windows.

### Tramite Chocolatey (Consigliato)
Apri PowerShell come Amministratore ed esegui:
```powershell
choco install signmeup-cloud-server -y
```

### Installazione Manuale
Se non utilizzi Chocolatey, puoi scaricare l'archivio ZIP dall'area Releases, estrarlo nella directory di destinazione e registrare manualmente l'eseguibile come Servizio Windows.

🛠️ Configurazione e Primo Avvio
Dopo l'installazione, il servizio SignMeUp Cloud Server verrà avviato automaticamente.

Apri il file appsettings.json o appsettings.Production.json (nella cartella di installazione) per configurare la connessione al Database.

Al primo avvio, il sistema applicherà automaticamente le migrazioni creando le tabelle necessarie.

Accedi all'interfaccia web (di default su http://localhost:5000 o la porta configurata).



### 🆘 Supporto e Documentazione
Per maggiori dettagli su configurazioni avanzate, integrazione API e logiche di reverse proxy, consulta la nostra documentazione:

[Segnala un Bug / Issue Tracking](https://www.google.com/search?q=https://github.com/smeup/signmeup-cloud-binaries/issues)

Powered by SMEUP | Built with ❤️ in Italy