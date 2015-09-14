
CREATE VIEW [Dealer].[View_SubAgenti]
AS
SELECT        Dealer.Dealer.IDDealer, Dealer.Dealer.Indirizzo, Dealer.Dealer.PIVA, Dealer.Dealer.Telefono, Dealer.Dealer.Fax, Dealer.Dealer.DataModifica, 
                         Dealer.Dealer.IDUtente, Dealer.Dealer.IDTipoDealer, Dealer.Dealer.IDStato, Dealer.Dealer.Codice, Dealer.Stato.NomeStato AS Stato, 
                         Dealer.TipoDealer.NomeTipoDealer, Area.Operativita.Operativita, Area.Tipologia.Tipologia, InfoGenerali.InfoGenerali.CodiceFornitore, 
                         InfoGenerali.InfoGenerali.CodiceVogi, InfoGenerali.InfoGenerali.EMail, InfoGenerali.InfoGenerali.PEC, 
                         Dealer.CondizioniPagamento.NomeCondizioniPagamento AS CondizioniPagamento, Dealer.Canale.NomeCanale, Negozio.Negozio.Telefono AS TelefonoNegozio, 
                         Negozio.Negozio.NomeTitolare, Negozio.Negozio.Supporti, Negozio.Cluster.Cluster, Catene.TipoRemunerazione.TipoRemunerazione, Vendite.Vendite.CAP, 
                         Vendite.Vendite.Localita, Vendite.Vendite.Nome1, Utility.Provincia.Nome AS Provincia, Utility.Regione.Nome AS Regione, Disdetta.Disdetta.VecchioCodice, 
                         Disdetta.Disdetta.DataTerminePreavviso, Disdetta.Disdetta.DataInvioDisdetta, Disdetta.Disdetta.GiorniPreavviso, Disdetta.Disdetta.Note, Utility.Zona.Nome AS Area, 
                         Disdetta.DettaglioDisdetta.DataDisdetta, Vendite.VenditeCanali.Cliente, Vendite.VenditeCanali.GruppoPrezzi, Vendite.VenditeCanali.Magazzino, 
                         Vendite.VenditeCanali.Nome2, Utenti.Funzionario.AGL AS CodiceFunzionario, Utenti.Funzionario.Nome AS Funzionario, 
                         Utenti.AreaManager.VKBUR AS CodiceAreaManager, Utenti.AreaManager.Nome AS AreaManager, Negozio.NegozioAgenti.IndirizzoSpedizioneMateriale, 
                         Area.AreaSubAgenti.DataContratto, Area.AreaSubAgenti.FirmaDigitale, InfoGenerali.InfoSubAgenti.BOL, ISNULL(Vendite.Vendite.Nome1, '') 
                         + ' ' + ISNULL(Vendite.VenditeCanali.Nome2, '') AS RagioneSociale, InfoGenerali.InfoSubAgenti.DataChiusuraCodice, InfoGenerali.InfoSubAgenti.DataAperturaCodice, 
                         Disdetta.Richiedente.Richiedente, DettaglioAgenti.DettaglioAgenti.Plurimandatario, DettaglioAgenti.DettaglioAgenti.ZonaAssegnata, 
                         DettaglioAgenti.MaterialeEspositivo.MaterialeEspositivo, DettaglioAgenti.Dimensionamento.Dimensionamento, Negozio.Negozio.CFTitolare, 
                         Negozio.Negozio.EmailTitolare, Dealer.Dealer.DataModificaUtente, Dealer.Canale.IDCanale, Utility.Zona.IDZona AS IDArea, Utility.Regione.IDRegione, 
                         Utility.Provincia.IDProvincia, Negozio.Negozio.NomeContatto, Dealer.Canale.DescrizioneCanale AS Canale, Area.IDOperativita AS IDOperativita
FROM            Dealer.Dealer INNER JOIN
                         Dealer.Stato ON Dealer.Dealer.IDStato = Dealer.Stato.IDStato INNER JOIN
                         Dealer.TipoDealer ON Dealer.Dealer.IDTipoDealer = Dealer.TipoDealer.IDTipoDealer LEFT OUTER JOIN
                         InfoGenerali.InfoGenerali ON Dealer.Dealer.IDDealer = InfoGenerali.InfoGenerali.IDDealer LEFT OUTER JOIN
                         InfoGenerali.InfoSubAgenti ON InfoGenerali.InfoGenerali.IDDealer = InfoGenerali.InfoSubAgenti.IDDealer LEFT OUTER JOIN
                         Dealer.CanaliDealer ON Dealer.Dealer.IDDealer = Dealer.CanaliDealer.IDDealer LEFT OUTER JOIN
                         Dealer.Canale ON Dealer.CanaliDealer.IDCanale = Dealer.Canale.IDCanale LEFT OUTER JOIN
                         Dealer.CondizioniPagamento ON Dealer.CanaliDealer.IDCondizioniPagamento = Dealer.CondizioniPagamento.IDCondizioniPagamento LEFT OUTER JOIN
                         DettaglioAgenti.DettaglioAgenti ON Dealer.Dealer.IDDealer = DettaglioAgenti.DettaglioAgenti.IDDealer LEFT OUTER JOIN
                         DettaglioAgenti.MaterialeEspositivo ON 
                         DettaglioAgenti.DettaglioAgenti.IDMaterialeEspositivo = DettaglioAgenti.MaterialeEspositivo.IDMaterialeEspositivo LEFT OUTER JOIN
                         DettaglioAgenti.Dimensionamento ON DettaglioAgenti.Dimensionamento.IDDimensionamento = DettaglioAgenti.DettaglioAgenti.IDDimensionamento LEFT OUTER JOIN
                         Area.Area ON Dealer.Dealer.IDDealer = Area.Area.IDDealer LEFT OUTER JOIN
                         Area.Operativita ON Area.Area.IDOperativita = Area.Operativita.IDOperativita LEFT OUTER JOIN
                         Area.Tipologia ON Area.Area.IDTipologia = Area.Tipologia.IDTipologia LEFT OUTER JOIN
                         Area.AreaSubAgenti ON Area.Area.IDDealer = Area.AreaSubAgenti.IDDealer LEFT OUTER JOIN
                         Negozio.Negozio ON Dealer.Dealer.IDDealer = Negozio.Negozio.IDDealer LEFT OUTER JOIN
                         Negozio.NegozioAgenti ON Negozio.Negozio.IDDealer = Negozio.NegozioAgenti.IDDealer LEFT OUTER JOIN
                         Negozio.Cluster ON Negozio.Negozio.IDCluster = Negozio.Cluster.IDCluster LEFT OUTER JOIN
                         Negozio.Apre ON Dealer.Dealer.IDDealer = Negozio.Apre.IDDealer LEFT OUTER JOIN
                         Negozio.OrarioDiApertura ON Negozio.Apre.IDOrarioApertura = Negozio.OrarioDiApertura.IDOrarioApertura LEFT OUTER JOIN
                         Catene.Catene ON Dealer.Dealer.IDDealer = Catene.Catene.IDDealer LEFT OUTER JOIN
                         Catene.TipoRemunerazione ON Catene.Catene.IDTipoRemunerazione = Catene.TipoRemunerazione.IDTipoRemunerazione LEFT OUTER JOIN
                         Vendite.Vendite ON Dealer.Dealer.IDDealer = Vendite.Vendite.IDDealer LEFT OUTER JOIN
                         Vendite.VenditeCanali ON Vendite.Vendite.IDDealer = Vendite.VenditeCanali.IDDealer LEFT OUTER JOIN
                         Disdetta.Disdetta ON Dealer.Dealer.IDDealer = Disdetta.Disdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.DettaglioDisdetta ON Disdetta.Disdetta.IDDealer = Disdetta.DettaglioDisdetta.IDDealer LEFT OUTER JOIN
                         Disdetta.Richiedente ON Disdetta.Disdetta.IDRichiedente = Disdetta.Richiedente.IDRichiedente LEFT OUTER JOIN
                         Utenti.Funzionario ON Vendite.VenditeCanali.IDFunzionario = Utenti.Funzionario.IDFunzionario LEFT OUTER JOIN
                         Utenti.AreaManager ON Vendite.VenditeCanali.IDAreaManager = Utenti.AreaManager.IDAreaManager LEFT OUTER JOIN
                         Utility.Provincia ON Vendite.Vendite.IDProvincia = Utility.Provincia.IDProvincia LEFT OUTER JOIN
                         Utility.Regione ON Utility.Provincia.IDRegione = Utility.Regione.IDRegione LEFT OUTER JOIN
                         Utility.Zona ON Utility.Provincia.IDZona = Utility.Zona.IDZona
WHERE        (Dealer.Dealer.IDTipoDealer = 5)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 4, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_SubAgenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane4', @value = N'
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1860
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3645
         Alias = 1995
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_SubAgenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'      End
         Begin Table = "Catene (Catene)"
            Begin Extent = 
               Top = 313
               Left = 396
               Bottom = 408
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoRemunerazione (Catene)"
            Begin Extent = 
               Top = 328
               Left = 732
               Bottom = 423
               Right = 938
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vendite (Vendite)"
            Begin Extent = 
               Top = 63
               Left = 644
               Bottom = 254
               Right = 843
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VenditeCanali (Vendite)"
            Begin Extent = 
               Top = 197
               Left = 613
               Bottom = 461
               Right = 865
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Disdetta (Disdetta)"
            Begin Extent = 
               Top = 26
               Left = 421
               Bottom = 214
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DettaglioDisdetta (Disdetta)"
            Begin Extent = 
               Top = 42
               Left = 1026
               Bottom = 137
               Right = 1196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Richiedente (Disdetta)"
            Begin Extent = 
               Top = 414
               Left = 38
               Bottom = 509
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Funzionario (Utenti)"
            Begin Extent = 
               Top = 331
               Left = 1048
               Bottom = 443
               Right = 1218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaManager (Utenti)"
            Begin Extent = 
               Top = 210
               Left = 982
               Bottom = 322
               Right = 1153
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Provincia (Utility)"
            Begin Extent = 
               Top = 178
               Left = 1079
               Bottom = 347
               Right = 1261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Regione (Utility)"
            Begin Extent = 
               Top = 123
               Left = 686
               Bottom = 218
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Zona (Utility)"
            Begin Extent = 
               Top = 67
               Left = 1009
               Bottom = 162
               Right = 1179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 68
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_SubAgenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  Bottom = 394
               Right = 972
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CondizioniPagamento (Dealer)"
            Begin Extent = 
               Top = 59
               Left = 706
               Bottom = 154
               Right = 946
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DettaglioAgenti (DettaglioAgenti)"
            Begin Extent = 
               Top = 468
               Left = 739
               Bottom = 641
               Right = 944
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MaterialeEspositivo (DettaglioAgenti)"
            Begin Extent = 
               Top = 408
               Left = 255
               Bottom = 503
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dimensionamento (DettaglioAgenti)"
            Begin Extent = 
               Top = 678
               Left = 38
               Bottom = 773
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area (Area)"
            Begin Extent = 
               Top = 50
               Left = 980
               Bottom = 177
               Right = 1159
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Operativita (Area)"
            Begin Extent = 
               Top = 152
               Left = 1062
               Bottom = 247
               Right = 1232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tipologia (Area)"
            Begin Extent = 
               Top = 31
               Left = 1022
               Bottom = 126
               Right = 1192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AreaSubAgenti (Area)"
            Begin Extent = 
               Top = 152
               Left = 902
               Bottom = 322
               Right = 1083
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 248
               Left = 896
               Bottom = 464
               Right = 1094
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "NegozioAgenti (Negozio)"
            Begin Extent = 
               Top = 68
               Left = 341
               Bottom = 180
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cluster (Negozio)"
            Begin Extent = 
               Top = 245
               Left = 989
               Bottom = 340
               Right = 1159
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Apre (Negozio)"
            Begin Extent = 
               Top = 123
               Left = 315
               Bottom = 233
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrarioDiApertura (Negozio)"
            Begin Extent = 
               Top = 233
               Left = 1052
               Bottom = 338
               Right = 1231
            End
            DisplayFlags = 280
            TopColumn = 0
   ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_SubAgenti';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dealer (Dealer)"
            Begin Extent = 
               Top = 17
               Left = 27
               Bottom = 260
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Stato (Dealer)"
            Begin Extent = 
               Top = 132
               Left = 249
               Bottom = 242
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoDealer (Dealer)"
            Begin Extent = 
               Top = 18
               Left = 255
               Bottom = 129
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoGenerali (InfoGenerali)"
            Begin Extent = 
               Top = 102
               Left = 54
               Bottom = 248
               Right = 316
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InfoSubAgenti (InfoGenerali)"
            Begin Extent = 
               Top = 246
               Left = 26
               Bottom = 412
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CanaliDealer (Dealer)"
            Begin Extent = 
               Top = 200
               Left = 101
               Bottom = 312
               Right = 319
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Canale (Dealer)"
            Begin Extent = 
               Top = 255
               Left = 789
             ', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_SubAgenti';

