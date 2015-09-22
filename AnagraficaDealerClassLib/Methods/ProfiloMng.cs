using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;
using System.Xml.Linq;

namespace AnagraficaDealerClassLib.Methods
{
    internal class ProfiloMng
    {
        private SqlOperations sqlop;

   

        internal DataTable GetAllProfili()
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Profilo_GetAll";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);



            return dt;
        }

        internal DataTable GetProfilo(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDProfilo";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Profilo_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal string InsertProfilo(Profilo myProfilo, List<TipoDealer> myTipoDealerList, List<AutorizzazioneCampi> myAutorizzazioneCampiList)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[12];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "NomeProfilo";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = myProfilo.NomeProfilo;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "ArchivioDatabase";
            dbp[1].DbType = DbType.Boolean;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = myProfilo.ArchivioDatabase;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "ArchivioCruscotto";
            dbp[2].DbType = DbType.Boolean;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = myProfilo.ArchivioCruscotto;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "ReportAnomalie";
            dbp[3].DbType = DbType.Boolean;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = myProfilo.ReportAnomalie;

            dbp[4] = new SqlParameter();
            dbp[4].ParameterName = "ReportScarti";
            dbp[4].DbType = DbType.Boolean;
            dbp[4].Direction = ParameterDirection.Input;
            dbp[4].Value = myProfilo.ReportScarti;

            dbp[5] = new SqlParameter();
            dbp[5].ParameterName = "Portafoglio";
            dbp[5].DbType = DbType.Boolean;
            dbp[5].Direction = ParameterDirection.Input;
            dbp[5].Value = myProfilo.Portafoglio;

            dbp[6] = new SqlParameter();
            dbp[6].ParameterName = "Amministrazione";
            dbp[6].DbType = DbType.Boolean;
            dbp[6].Direction = ParameterDirection.Input;
            dbp[6].Value = myProfilo.Amministrazione;

            dbp[7] = new SqlParameter();
            dbp[7].ParameterName = "RagioniSocialiCorrelate";
            dbp[7].DbType = DbType.Int32;
            dbp[7].Direction = ParameterDirection.Input;
            dbp[7].Value = myProfilo.RagioniSocialiCorrelate;

            dbp[8] = new SqlParameter();
            dbp[8].ParameterName = "Eccezioni";
            dbp[8].DbType = DbType.Boolean;
            dbp[8].Direction = ParameterDirection.Input;
            dbp[8].Value = myProfilo.Eccezioni;

            XElement tipoDealerXml = new XElement("Dealer",
                            from TipoDealer in myTipoDealerList
                            select new XElement("TipoDealer",
                                    new XElement("IDTipoDealer", TipoDealer.IDTipoDealer)
                                                )
                                    );

            dbp[9] = new SqlParameter();
            dbp[9].ParameterName = "TipoDealerXml";
            dbp[9].DbType = DbType.String;
            dbp[9].Direction = ParameterDirection.Input;
            dbp[9].Value = tipoDealerXml.ToString();

            XElement autorizzazioneCampiXml = new XElement("Autorizzazioni",
                                    from AutorizzazioneCampi in myAutorizzazioneCampiList
                                    select new XElement("AutorizzazioneCampi",
                                            new XElement("IDAutorizzazioneCampi", AutorizzazioneCampi.IDAutorizzazioneCampi),
                                            new XElement("Autorizzazione", AutorizzazioneCampi.Autorizzazione),
                                            new XElement("IDCampoDati", AutorizzazioneCampi.IDCampoDati)
                                                        )
                                                );

            dbp[10] = new SqlParameter();
            dbp[10].ParameterName = "AutorizzazioneCampiXml";
            dbp[10].DbType = DbType.String;
            dbp[10].Direction = ParameterDirection.Input;
            dbp[10].Value = autorizzazioneCampiXml.ToString();

            dbp[11] = new SqlParameter();
            dbp[11].ParameterName = "IDRuolo";
            dbp[11].DbType = DbType.Int32;
            dbp[11].Direction = ParameterDirection.Input;
            dbp[11].Value = myProfilo.IDRuolo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Profilo_Insert";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal string UpdateProfilo(Profilo myProfilo, List<TipoDealer> myTipoDealerList, List<AutorizzazioneCampi> myAutorizzazioneCampiList)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[13];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDProfilo";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = myProfilo.IDProfilo;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "NomeProfilo";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = myProfilo.NomeProfilo;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "ArchivioDatabase";
            dbp[2].DbType = DbType.Boolean;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = myProfilo.ArchivioDatabase;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "ArchivioCruscotto";
            dbp[3].DbType = DbType.Boolean;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = myProfilo.ArchivioCruscotto;

            dbp[4] = new SqlParameter();
            dbp[4].ParameterName = "ReportAnomalie";
            dbp[4].DbType = DbType.Boolean;
            dbp[4].Direction = ParameterDirection.Input;
            dbp[4].Value = myProfilo.ReportAnomalie;

            dbp[5] = new SqlParameter();
            dbp[5].ParameterName = "ReportScarti";
            dbp[5].DbType = DbType.Boolean;
            dbp[5].Direction = ParameterDirection.Input;
            dbp[5].Value = myProfilo.ReportScarti;

            dbp[6] = new SqlParameter();
            dbp[6].ParameterName = "Portafoglio";
            dbp[6].DbType = DbType.Boolean;
            dbp[6].Direction = ParameterDirection.Input;
            dbp[6].Value = myProfilo.Portafoglio;

            dbp[7] = new SqlParameter();
            dbp[7].ParameterName = "Amministrazione";
            dbp[7].DbType = DbType.Boolean;
            dbp[7].Direction = ParameterDirection.Input;
            dbp[7].Value = myProfilo.Amministrazione;

            dbp[8] = new SqlParameter();
            dbp[8].ParameterName = "RagioniSocialiCorrelate";
            dbp[8].DbType = DbType.Int32;
            dbp[8].Direction = ParameterDirection.Input;
            dbp[8].Value = myProfilo.RagioniSocialiCorrelate;

            dbp[9] = new SqlParameter();
            dbp[9].ParameterName = "Eccezioni";
            dbp[9].DbType = DbType.Boolean;
            dbp[9].Direction = ParameterDirection.Input;
            dbp[9].Value = myProfilo.Eccezioni;

            XElement tipoDealerXml = new XElement("Dealer",
                                        from TipoDealer in myTipoDealerList
                                        select new XElement("TipoDealer",
                                                new XElement("IDTipoDealer", TipoDealer.IDTipoDealer)
                                                            )
                                                );

            dbp[10] = new SqlParameter();
            dbp[10].ParameterName = "TipoDealerXml";
            dbp[10].DbType = DbType.String;
            dbp[10].Direction = ParameterDirection.Input;
            dbp[10].Value = tipoDealerXml.ToString();

            XElement autorizzazioneCampiXml = new XElement("Autorizzazioni",
                                                from AutorizzazioneCampi in myAutorizzazioneCampiList
                                                select new XElement("AutorizzazioneCampi",
                                                        new XElement("IDAutorizzazioneCampi", AutorizzazioneCampi.IDAutorizzazioneCampi),
                                                        new XElement("Autorizzazione", AutorizzazioneCampi.Autorizzazione),
                                                        new XElement("IDCampoDati", AutorizzazioneCampi.IDCampoDati)
                                                                    )
                                                            );

            dbp[11] = new SqlParameter();
            dbp[11].ParameterName = "AutorizzazioneCampiXml";
            dbp[11].DbType = DbType.String;
            dbp[11].Direction = ParameterDirection.Input;
            dbp[11].Value = autorizzazioneCampiXml.ToString();

            dbp[12] = new SqlParameter();
            dbp[12].ParameterName = "IDRuolo";
            dbp[12].DbType = DbType.Int32;
            dbp[12].Direction = ParameterDirection.Input;
            dbp[12].Value = myProfilo.IDRuolo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Profilo_Update";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal string DeleteProfilo(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDProfilo";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Profilo_Delete";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal DataTable GetAllRuoli()
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Ruolo_GetAll";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal DataTable IsCodRuoloActive(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDProfilo";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utility.SP_Is_CodRuolo_Active";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }
    }
}
