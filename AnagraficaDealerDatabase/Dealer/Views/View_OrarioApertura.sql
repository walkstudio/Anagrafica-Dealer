﻿CREATE VIEW Dealer.View_OrarioApertura
AS
SELECT        TOP (100) PERCENT Negozio.Negozio.IDDealer, Negozio.OrarioDiApertura.IDOrarioApertura, Negozio.OrarioDiApertura.DalleMattina, 
                         Negozio.OrarioDiApertura.AlleMattina, Negozio.OrarioDiApertura.DallePomeriggio, Negozio.OrarioDiApertura.AllePomeriggio, Negozio.OrarioDiApertura.Lun, 
                         Negozio.OrarioDiApertura.Mar, Negozio.OrarioDiApertura.Mer, Negozio.OrarioDiApertura.Gio, Negozio.OrarioDiApertura.Ven, Negozio.OrarioDiApertura.Sab, 
                         Negozio.OrarioDiApertura.Dom
FROM            Negozio.Negozio INNER JOIN
                         Negozio.Apre ON Negozio.Negozio.IDDealer = Negozio.Apre.IDDealer INNER JOIN
                         Negozio.OrarioDiApertura ON Negozio.Apre.IDOrarioApertura = Negozio.OrarioDiApertura.IDOrarioApertura
ORDER BY Negozio.Negozio.IDDealer
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_OrarioApertura';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[11] 2[12] 3) )"
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
         Begin Table = "Negozio (Negozio)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 259
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Apre (Negozio)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 101
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrarioDiApertura (Negozio)"
            Begin Extent = 
               Top = 6
               Left = 463
               Bottom = 308
               Right = 678
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
      Begin ColumnWidths = 14
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
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
', @level0type = N'SCHEMA', @level0name = N'Dealer', @level1type = N'VIEW', @level1name = N'View_OrarioApertura';

