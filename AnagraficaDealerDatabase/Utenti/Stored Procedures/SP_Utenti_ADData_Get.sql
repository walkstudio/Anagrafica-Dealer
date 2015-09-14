-- =============================================
-- Author:		Diego Fronda
-- Create date: 08/05/2015
-- =============================================
CREATE PROCEDURE [Utenti].[SP_Utenti_ADData_Get] @UserID nvarchar(50) AS 

declare @SQLQry varchar(500)
set @SQLQry = '
select givenName Nome, sn Cognome, Mail FROM OPENQUERY( ADSI, 
   ''SELECT givenName, sn, mail
   FROM ''''LDAP://onmi'''' where sAMAccountName = ''''' + @UserID + '''''
    and objectCategory = ''''user'''''')

'
set @SQLQry = '
select ''Nome'' Nome, ''Cognome'' Cognome, ''nome.cognome@mail.com'' Email 
'

exec(@SQLQry)