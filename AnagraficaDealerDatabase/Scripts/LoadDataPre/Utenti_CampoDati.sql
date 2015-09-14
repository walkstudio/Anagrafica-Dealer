USE [AnagraficaDealer]
GO

--Tabella Anagrafica

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Area', 'Area', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 115)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Canale', 'Canale', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 102)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CAP', 'CAP', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 114)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Codice', 'Codice', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 101)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('VecchioCodice', 'Vecchio Codice', 'Anagrafica', 'TextBox', 'Testo', 100, 1, 3, 130)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataAperturaNegozio', 'Data Apertura Negozio', 'Anagrafica', 'TextBox', 'Data', 10, 1, 3, 121)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataAperturaCodice', 'Data Apertura Codice', 'Anagrafica', 'TextBox', 'Data', 10, 0, 2, 120)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataTerminePreavviso', 'Data Termine Preavviso', 'Anagrafica', 'TextBox', 'Data', 10, 1, 3, 123)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataChiusuraNegozio', 'Data Chiusura Negozio', 'Anagrafica', 'TextBox', 'Data', 10, 1, 3, 124)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataChiusuraCodice', 'Data Chiusura Codice', 'Anagrafica', 'TextBox', 'Data', 10, 0, 2, 125)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Richiedente', 'Disdetta', 'Anagrafica', 'DropDownList', 'Testo', 100, 1, 3, 122)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('IndirizzoSpedizioneMateriale', 'Ind. Spedizione Materiale', 'Anagrafica', 'TextBox', 'Testo', 100, 1, 3, 117)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Indirizzo', 'Indirizzo', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 110)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Localita', 'Località', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 111)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('MasterDealer', 'MasterDealer', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 131)

--INSERT INTO [Utenti].[CampoDati]
--	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
--     VALUES ('Nome1', 'Nome1', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 105)

--INSERT INTO [Utenti].[CampoDati] 
--	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
--     VALUES ('Nome2', 'Nome2', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 106)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Operativita', 'Operatività', 'Anagrafica', 'DropDownList', 'Testo', 100, 1, 3, 107)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('PIVA', 'Partita IVA', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 103)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Provincia', 'Provincia', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 112)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('RagioneSociale', 'Ragione Sociale', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 104)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Regione', 'Regione', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 113)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Stato', 'Stato', 'Anagrafica', 'TextBox', 'Testo', 100, 0, 2, 108)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Telefono', 'Telefono', 'Anagrafica', 'TextBox', 'NumeroTelefonico', 20, 0, 2, 116)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Tipologia', 'Tipologia', 'Anagrafica', 'DropDownList', 'Testo', 100, 1, 3, 109)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ZonaAssegnata', 'Zona Assegnata', 'Anagrafica', 'TextBox', 'Testo', 100, 1, 3, 132)


--Tabella Dati Amministrativi

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('AreaDiCompetenza', 'Area di Competenza', 'Dati Amministrativi', 'DropDownList', 'Testo', 100, 1, 3, 201)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('BOL', 'BOL', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 202)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CodiceFornitore', 'Codice Fornitore', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 1, 3, 203)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CodiceVogi', 'Codice VOGI', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 1, 3, 204)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CondizioniPagamento', 'Condizioni Pagamento', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 243)

	 INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataContratto', 'Data Contratto', 'Dati Amministrativi', 'TextBox', 'Data', 10, 1, 3, 210)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataDisdetta', 'Data Disdetta', 'Dati Amministrativi', 'TextBox', 'Data', 10, 1, 3, 211)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DataInvioDisdetta', 'Data Invio Disdetta', 'Dati Amministrativi', 'TextBox', 'Data', 10, 1, 3, 212)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DealerAssociatiAttivi', 'Dealer Associati Attivi', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 220)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DealerAssociatiDisattivi', 'Dealer Associati Disattivi', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 221)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Pec', 'Email PEC', 'Dati Amministrativi', 'TextBox', 'Email', 100, 1, 3, 230)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('FideiussioneAffitto', 'Fideiussione Affitto', 'Dati Amministrativi', 'CheckBox', 'Boolean', 1, 1, 3, 251)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('FideiussioneCommerciale', 'Fideiussione Commerciale', 'Dati Amministrativi', 'CheckBox', 'Boolean', 1, 1, 3, 252)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('FirmaDigitale', 'Firma Digitale', 'Dati Amministrativi', 'CheckBox', 'Boolean', 1, 1, 3, 244)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('GiorniPreavviso', 'Giorni Preavviso', 'Dati Amministrativi', 'TextBox', 'Numero', 100, 1, 3, 213)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('GruppoPrezzi', 'Gruppo Prezzi', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 242)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Magazzino', 'Magazzino', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 0, 2, 240)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('MagazzinoCentralizzato', 'Magazzino Centralizzato', 'Dati Amministrativi', 'CheckBox', 'Boolean', 1, 1, 3, 241)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Plurimandatario', 'Plurimandatario', 'Dati Amministrativi', 'CheckBox', 'Boolean', 1, 1, 3, 250)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Note', 'Note', 'Dati Amministrativi', 'TextBox', 'Note', 100, 1, 3, 299)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ProvRea', 'Prov Rea', 'Dati Amministrativi', 'DropDownList', 'Testo', 100, 1, 3, 260)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Rea', 'Rea', 'Dati Amministrativi', 'TextBox', 'Testo', 100, 1, 3, 261)


--Tabella Negozio

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CentroCommerciale', 'Centro Commerciale', 'Negozio', 'CheckBox', 'Boolean', 1, 1, 3, 320)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CFTitolare', 'CF Titolare', 'Negozio', 'TextBox', 'Testo', 100, 1, 3, 301)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Cluster', 'Cluster', 'Negozio', 'DropDownList', 'Testo', 100, 1, 3, 321)

	 INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Dimensionamento', 'Dimensionamento', 'Negozio', 'DropDownList', 'Testo', 100, 1, 3, 326)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DimensioneAreaVendita', 'Dim. Area vendita (MQ)', 'Negozio', 'DropDownList', 'Testo', 100, 1, 3, 322)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Email', 'Email Negozio', 'Negozio', 'TextBox', 'Email', 100, 0, 2, 311)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('EmailTitolare', 'Email Titolare', 'Negozio', 'TextBox', 'Email', 100, 1, 3, 302)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Fax', 'Fax', 'Negozio', 'TextBox', 'NumeroTelefonico', 20, 0, 2, 312)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('FT', 'FT', 'Negozio', 'TextBox', 'Numero', 100, 0, 2, 351)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('FTE', 'FTE', 'Negozio', 'TextBox', 'Numero', 100, 0, 2, 350)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Insegna', 'Insegna', 'Negozio', 'TextBox', 'Testo', 100, 1, 3, 340)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Latitudine', 'Latitudine', 'Negozio', 'TextBox', 'Testo', 100, 1, 3, 331)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Longitudine', 'Longitudine', 'Negozio', 'TextBox', 'Testo', 100, 1, 3, 330)
	 	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('MaterialeEspositivo', 'Materiale Espositivo', 'Negozio', 'DropDownList', 'Testo', 100, 1, 3, 325)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('NomeTitolare', 'Nome Titolare', 'Negozio', 'TextBox', 'Testo', 100, 1, 3, 300)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('NumeroVetrine', 'Numero Vetrine', 'Negozio', 'TextBox', 'Numero', 100, 1, 3, 323)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('NumeroAddetti', 'Numero Addetti', 'Negozio', 'TextBox', 'Numero', 100, 0, 2, 353)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('OrarioApertura', 'Orario Apertura', 'Negozio', 'OrarioApertura', 'OrarioApertura', 300, 1, 3, 399)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('PT', 'PT', 'Negozio', 'TextBox', 'Numero', 100, 0, 2, 352)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('TelefonoNegozio', 'Telefono Negozio', 'Negozio', 'TextBox', 'NumeroTelefonico', 20, 1, 3, 310)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('TipologiaArredo', 'Tipologia Arredi', 'Negozio', 'DropDownList', 'Testo', 100, 1, 3, 324)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ValoreAffitto', 'Valore Affitto', 'Negozio', 'TextBox', 'Numero', 100, 1, 3, 341)


--Tabella Vendite

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('AreaManager', 'Area Manager', 'Vendite', 'TextBox', 'Testo', 100, 0, 2, 400)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('CentroAssistenzaTecnica', 'Centro Assistenza Tecnica', 'Vendite', 'TextBox', 'Testo', 100, 0, 2, 415)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ClassificazioneMaster', 'Classificazione Master', 'Vendite', 'TextBox', 'Testo', 100, 0, 2, 410)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Cliente', 'Cliente', 'Vendite', 'TextBox', 'Testo', 100, 0, 2, 420)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DatiCateneAm', 'Dati Catene (AM)', 'Vendite', 'TextBox', 'Testo', 100, 1, 3, 402)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('DatiCateneFunzionario', 'Dati Catene (Funzionario)', 'Vendite', 'TextBox', 'Testo', 100, 1, 3, 403)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Funzionario', 'Funzionario', 'Vendite', 'TextBox', 'Testo', 100, 0, 2, 401)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('GestoreCondiviso', 'Gestori Condivisi', 'Vendite', 'CheckBoxList', 'Boolean', 1, 1, 3, 422)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ModelloVendita', 'Modello Vendita', 'Vendite', 'CheckBoxList', 'Boolean', 100, 1, 3, 421)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('NegozioTop', 'Negozio Top', 'Vendite', 'CheckBox', 'Boolean', 1, 1, 3, 411)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Piu12', '+12', 'Vendite', 'CheckBox', 'Boolean', 1, 1, 3, 414)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('PointSpecial', 'Point Special', 'Vendite', 'CheckBox', 'Boolean', 1, 1, 3, 412)
	 
INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('SegmentazioneCanale', 'Segmentazione Canale', 'Vendite', 'DropDownList', 'Testo', 1, 1, 3, 423)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('ShopInStore', 'Shop In Store', 'Vendite', 'CheckBox', 'Boolean', 1, 1, 3, 413)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('Supporti', 'Supporti', 'Vendite', 'TextBox', 'Testo', 100, 1, 3, 425)

INSERT INTO [Utenti].[CampoDati] 
	([NomeCampo],[NomeCampoFrontEnd],[NomeTabella],[TipoWebControl],[TipoDato],[LunghezzaMassima],[PermessoModificabile],[PermessoDiDefault],[Ordinamento])
     VALUES ('TipoRemunerazione', 'Tipo Remunerazione', 'Vendite', 'DropDownList', 'Testo', 100, 1, 3, 424)