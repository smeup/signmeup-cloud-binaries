# Changelog

Tutte le modifiche rilevanti a **SignMeUp.Cloud.Server** saranno documentate in questo file.

Il formato è basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.0.0/),
e questo progetto aderisce al [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2026-04-16

### Aggiunto (Added)
* **Distribuzione Chocolatey**: Aggiunto supporto completo per l'installazione automatizzata tramite pacchetto Chocolatey (`.nupkg`), inclusa la gestione nativa del Servizio Windows.
* **Repository Binari**: Separazione della distribuzione pubblica dei file binari per garantire maggiore sicurezza e velocità di scaricamento.
* **Licenza MIT**: Aggiunto il file di licenza al pacchetto di distribuzione pubblica.

### Modificato (Changed)
* **Pipeline CI/CD**: Ristrutturazione del processo di rilascio automatizzato per la sincronizzazione dei metadati e degli asset grafici verso la pagina pubblica del pacchetto.
* **Ottimizzazioni**: Migliorata la gestione dell'apertura del database al primo avvio per la creazione automatica delle tabelle.

---