using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;
using System.Dynamic;

namespace AnagraficaDealerClassLib.Methods
{
    internal class RicercaMng
    {
        private SqlOperations sqlop;

        internal DataTable GetAllDealersCode(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "DealerCode";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPParams = dbp;
            sco.SPName = "[Dealer].[SP_RicercaDealerCode_Get]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal DataTable GetAllMasterDealerCode(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "DealerCode";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPParams = dbp;
            sco.SPName = "[Dealer].[SP_RicercaMasterDealerCode_Get]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal DataTable RicercaDealer(string strRicerca, string user)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[2];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "vXML";
            dbp[0].DbType = DbType.Xml;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = strRicerca;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Utente";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = user;
            sco.SPParams = dbp;

            sco.SPName = "[Utility].[SP_RicercaDealer_Get]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }


        internal DataTable GetInfoDealer(string info, string param, string utente)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();
            DbParameter[] dbp = new DbParameter[1];
            SqlCommandObject sco = new SqlCommandObject();
            switch (info)
            {
                case "S":
                    sco.SPName = "[Dealer].[SP_StatoDealer_GetAll]";
                    break;
                case "T":
                    dbp = new DbParameter[1];
                    dbp[0] = new SqlParameter();
                    dbp[0].ParameterName = "Utente";
                    dbp[0].DbType = DbType.String;
                    dbp[0].Direction = ParameterDirection.Input;
                    dbp[0].Value = utente;
                    sco.SPParams = dbp;
                    sco.SPName = "[Dealer].[SP_TipoDealer_GetAll]";
                    break;
                case "Z":
                    sco.SPName = "[Utility].[SP_Zone_GetAll]";
                    break;
                case "C":
                    dbp = new DbParameter[1];
                    dbp[0] = new SqlParameter();
                    dbp[0].ParameterName = "TipoDealer";
                    dbp[0].DbType = DbType.String;
                    dbp[0].Direction = ParameterDirection.Input;
                    dbp[0].Value = param;
                    sco.SPParams = dbp;
                    sco.SPName = "[Dealer].[SP_Canali_GetAll]";
                    break;
                case "R":
                    sco.SPName = "[Utility].[SP_Regioni_Get]";
                    dbp = new DbParameter[1];
                    dbp[0] = new SqlParameter();
                    dbp[0].ParameterName = "IDZona";
                    dbp[0].DbType = DbType.String;
                    dbp[0].Direction = ParameterDirection.Input;
                    dbp[0].Value = (param == "" ? "0" : param);
                    sco.SPParams = dbp;
                    break;
                case "P":
                    sco.SPName = "[Utility].[SP_Province_Get]";
                    dbp = new DbParameter[1];
                    dbp[0] = new SqlParameter();
                    dbp[0].ParameterName = "IDRegione";
                    dbp[0].DbType = DbType.String;
                    dbp[0].Direction = ParameterDirection.Input;
                    dbp[0].Value = (param == "" ? "0" : param);
                    sco.SPParams = dbp;
                    break;
                case "L":
                    sco.SPName = "[Utility].[SP_Comuni_Get]";
                    dbp = new DbParameter[1];
                    dbp[0] = new SqlParameter();
                    dbp[0].ParameterName = "IDProvincia";
                    dbp[0].DbType = DbType.String;
                    dbp[0].Direction = ParameterDirection.Input;
                    dbp[0].Value = (param == "" ? "0" : param);
                    sco.SPParams = dbp;
                    break;
                case "A":
                    sco.SPName = "[Utility].[SP_AreaManager_GetAll]";
                    break;
                case "O":
                    sco.SPName = "[Area].[SP_Operativita_GetAll]";
                    break;
                case "F":
                    sco.SPName = "[Importo].[SP_Funzionario_GetAll]";
                    break;
                case "V":
                    sco.SPName = "[Negozio].[SP_ModelloVendita_GetAll]";
                    break;
                case "G":
                    sco.SPName = "[Utility].[SP_SegmentazioneCanale_GetAll]";
                    break;
                case "CL":
                    sco.SPName = "[Negozio].[SP_Cluster_GetAll]";
                    break;
                case "AC":
                    sco.SPName = "[Area].[SP_AreaCompetenza_GetAll]";
                    break;
                case "TA":
                    sco.SPName = "[Negozio].[SP_CentroAssistenzaTecnica_GetAll]";
                    break;
            }

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal DataTable GetRagioneSociale(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();

            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "RagioneSociale";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPName = "[Dealer].[SP_RicercaRagioneSociale_Get]";
            sco.SPParams = dbp;
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal DataTable GetPartitaIva(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();

            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "PartitaIva";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPName = "[Dealer].[SP_RicercaPartitaIva_Get]";
            sco.SPParams = dbp;
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal  DataTable GetLocalita(string pre,string prov, string regione)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();

            DbParameter[] dbp = new DbParameter[3];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Localita";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Provincia";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = prov;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "Regione";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = regione;

            sco.SPName = "[Dealer].[SP_RicercaLocalita_Get]";
            sco.SPParams = dbp;
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }
        internal string GestioneRicerca(string strRicerca, string user)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[2];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Ricerca";
            dbp[0].DbType = DbType.Xml;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = strRicerca;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Utente";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = user;
            sco.SPParams = dbp;

            sco.SPName = "[Utility].[SP_ArchivioRicerca_Insert]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return proc;

        }

        internal string GestioneRicerca(string user)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[2];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Utente";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = user;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Ricerca";
            dbp[1].DbType = DbType.Xml;
            dbp[1].Direction = ParameterDirection.Output;

            sco.SPParams = dbp;
            sco.SPName = "[Utility].[SP_ArchivioRicerca_Get]";
            DataTable dt;

            List<ExpandoObject> outputList = new List<ExpandoObject>();

            string proc = sqlop.ExecuteProcedure(sco, out dt, out outputList);
            IEnumerable<dynamic> Ricerca = outputList.Cast<dynamic>().Where(x => x.Nome.Contains("@Ricerca"));

            return Convert.ToString(Ricerca.First().Value);
        }

        internal DataTable GetAllFunzionari(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Funzionario";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPParams = dbp;
            sco.SPName = "[Dealer].[SP_Funzionari_GetAll]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

        internal DataTable GetAllSupporti(string pre)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            DbParameter[] dbp = new DbParameter[1];
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Supporto";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = pre;

            sco.SPParams = dbp;
            sco.SPName = "[Dealer].[SP_Supporti_GetAll]";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;

        }

    }
}
