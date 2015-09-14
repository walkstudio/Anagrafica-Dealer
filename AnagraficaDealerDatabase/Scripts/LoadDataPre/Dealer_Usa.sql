USE [AnagraficaDealer]
GO

--Inserisco i Campi visibili ai Committenti
INSERT INTO [Dealer].[Usa] 
  ([IDTipoDealer],[IDCampoDati])
    SELECT IDTipoDealer = 1, IDCampoDati FROM [Utenti].[CampoDati] WHERE NomeCampo IN ('Area', 'AreaDiCompetenza', 'AreaManager', 'BOL', 'Canale', 'CAP', 'CFTitolare', 'ClassificazioneMaster', 'Cliente', 'Cluster', 'Codice', 'CodiceFornitore', 'VecchioCodice', 'CodiceVogi', 'CondizioniPagamento', 'DataAperturaCodice', 'DataChiusuraCodice', 'DataContratto', 'DataInvioDisdetta', 'DataTerminePreavviso', 'DealerAssociatiAttivi', 'DealerAssociatiDisattivi', 'Richiedente', 'Email', 'Pec', 'EmailTitolare', 'Fax', 'FideiussioneAffitto', 'FideiussioneCommerciale', 'FirmaDigitale', 'FlagCancellazione', 'FT', 'FTE', 'Funzionario', 'GiorniPreavviso', 'GruppoPrezzi', 'Indirizzo', 'Localita', 'Magazzino', 'Nome1', 'Nome2', 'NomeTitolare', 'Note', 'NumeroAddetti', 'NumeroVetrine', 'Operativita', 'OrarioApertura', 'Piu12', 'PIVA', 'Provincia', 'ProvRea', 'PT', 'RagioneSociale', 'Rea', 'Regione', 'SegmentazioneCanale', 'Stato', 'Supporti', 'Telefono', 'TelefonoNegozio', 'TipoRemunerazione')

INSERT INTO [Dealer].[Usa] 
  ([IDTipoDealer],[IDCampoDati])
    SELECT IDTipoDealer = 2, IDCampoDati FROM [Utenti].[CampoDati] WHERE NomeCampo IN ('Area',  'AreaDiCompetenza',  'AreaManager',  'BOL',  'Canale',  'CAP',  'CentroAssistenzaTecnica',  'CentroCommerciale',  'CFTitolare',  'Cliente',  'Cluster',  'Codice',  'CodiceFornitore',  'VecchioCodice',  'CodiceVogi',  'CondizioniPagamento',  'DataAperturaCodice',  'DataAperturaNegozio',  'DataChiusuraCodice',  'DataChiusuraNegozio',  'DataInvioDisdetta',  'DataTerminePreavviso',  'DatiCateneAm',  'DatiCateneFunzionario',  'Richiedente',  'Email',  'Pec',  'EmailTitolare',  'Fax',  'FlagCancellazione',  'FT',  'FTE',  'Funzionario',  'GestoreCondiviso',  'GiorniPreavviso',  'GruppoPrezzi',  'Indirizzo',  'Insegna',  'Latitudine',  'Localita',  'Longitudine',  'Magazzino',  'MagazzinoCentralizzato',  'NegozioTop',  'Nome1',  'Nome2',  'NomeTitolare',  'Note',  'NumeroAddetti', 'NumeroVetrine',  'Operativita',  'OrarioApertura',  'PIVA', 'Provincia',  'PT',  'RagioneSociale',  'Regione',  'SegmentazioneCanale',  'ShopInStore',  'Stato',  'Supporti',  'Telefono',  'TelefonoNegozio',  'Tipologia',  'TipologiaArredo',  'TipoRemunerazione',  'ValoreAffitto')
  
INSERT INTO [Dealer].[Usa] 
  ([IDTipoDealer],[IDCampoDati])
    SELECT IDTipoDealer = 3, IDCampoDati FROM [Utenti].[CampoDati] WHERE NomeCampo IN ('Area', 'CAP', 'CentroCommerciale', 'CFTitolare', 'Cluster', 'Codice', 'CodiceFornitore', 'VecchioCodice', 'CodiceVogi', 'DataAperturaNegozio', 'DataChiusuraNegozio', 'DataDisdetta', 'DataInvioDisdetta', 'DataTerminePreavviso', 'DimensioneAreaVendita', 'Richiedente', 'Email', 'Pec', 'EmailTitolare', 'Fax', 'FirmaDigitale', 'GestoreCondiviso', 'GiorniPreavviso', 'Indirizzo', 'IndirizzoSpedizioneMateriale', 'Localita', 'MasterDealer', 'Nome1', 'Nome2', 'NomeTitolare', 'Note', 'NumeroVetrine', 'Operativita', 'OrarioApertura', 'PointSpecial', 'PIVA', 'Provincia', 'ProvRea', 'RagioneSociale', 'Rea', 'Regione', 'Stato', 'Supporti', 'Telefono', 'TelefonoNegozio', 'TipologiaArredo')
  
INSERT INTO [Dealer].[Usa] 
  ([IDTipoDealer],[IDCampoDati])
    SELECT IDTipoDealer = 4, IDCampoDati FROM [Utenti].[CampoDati] WHERE NomeCampo IN ('Area', 'AreaManager', 'BOL', 'Canale', 'CAP', 'CFTitolare', 'Cliente', 'Cluster', 'Codice', 'CodiceFornitore', 'VecchioCodice', 'CodiceVogi', 'CondizioniPagamento', 'DataAperturaCodice', 'DataChiusuraCodice', 'DataContratto', 'DataDisdetta', 'DataInvioDisdetta', 'DataTerminePreavviso', 'Dimensionamento', 'Richiedente', 'Email', 'Pec', 'EmailTitolare', 'Fax', 'FirmaDigitale', 'FlagCancellazione', 'Funzionario', 'GiorniPreavviso', 'GruppoPrezzi', 'Indirizzo', 'IndirizzoSpedizioneMateriale', 'Localita', 'Magazzino', 'MaterialeEspositivo', 'ModelloVendita', 'Plurimandatario', 'Nome1', 'Nome2', 'NomeTitolare', 'Note', 'Operativita', 'OrarioApertura', 'PIVA', 'Provincia', 'ProvRea', 'RagioneSociale', 'Rea', 'Regione', 'Stato', 'Supporti', 'Telefono', 'TelefonoNegozio', 'TipoRemunerazione', 'ZonaAssegnata')
  
INSERT INTO [Dealer].[Usa] 
  ([IDTipoDealer],[IDCampoDati])
    SELECT IDTipoDealer = 5, IDCampoDati FROM [Utenti].[CampoDati] WHERE NomeCampo IN ('Area', 'AreaManager', 'BOL', 'Canale', 'CAP', 'CFTitolare', 'Cliente', 'Cluster', 'Codice', 'CodiceFornitore', 'VecchioCodice', 'CodiceVogi', 'CondizioniPagamento', 'DataAperturaCodice', 'DataContratto', 'Dimensionamento', 'Email', 'Pec', 'EmailTitolare', 'Fax', 'FirmaDigitale', 'FlagCancellazione', 'Funzionario', 'GruppoPrezzi', 'Indirizzo', 'IndirizzoSpedizioneMateriale', 'Localita', 'Magazzino', 'MaterialeEspositivo', 'ModelloVendita', 'Plurimandatario', 'Nome1', 'Nome2', 'NomeTitolare', 'Note', 'Operativita', 'OrarioApertura', 'PIVA', 'Provincia', 'RagioneSociale', 'Regione', 'Stato', 'Supporti', 'Telefono', 'TelefonoNegozio', 'TipoRemunerazione', 'ZonaAssegnata')




	
