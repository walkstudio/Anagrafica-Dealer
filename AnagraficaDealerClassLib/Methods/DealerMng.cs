using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;
using System.Dynamic;
using System.Xml.Linq;

namespace AnagraficaDealerClassLib.Methods
{
    internal class DealerMng
    {
       private SqlOperations sqlop;

        internal DataTable GetAllTipoDealer(string utente = null)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "utente";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = utente;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_TipoDealer_GetAll";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);
          
            if (dt.Rows.Count == 0)
            {
                dt.Columns.Add("IDTipoDealer", typeof(int));
                dt.Columns.Add("NomeTipoDealer", typeof(string));
            }

            return dt;
        }

        internal DataTable GetAllDealer()
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_Dealer_GetAll";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal DataTable GetDealer(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealer";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_Dealer_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }


        internal DataTable GetStorico(int idObj, string tipologia)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealer";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Tipologia";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = tipologia;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_Storico_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal string UpdateDealer(int IDUtente, DealerUpdate myDealerUpdate)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDUtente";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = IDUtente;

            XDocument DealerUpdateXml = new XDocument(
                           new XElement("DealerUpdate",
                             new XElement("Dealer",
                               new XAttribute("IDDealer", myDealerUpdate.IDDealer),
                               new XElement("Variazioni"))));

            foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdate.DealerUpdateFieldsList)
            {
                if (myDealerUpdateFields.IsDatoModificato)
                {
                    XElement newElement = DealerUpdateXml.Element("DealerUpdate").Element("Dealer").Element("Variazioni");
                    newElement.Add(new XElement("Variazione",
                         new XAttribute("NomeCampo", myDealerUpdateFields.NomeCampo),
                         new XAttribute("DatoVecchio", myDealerUpdateFields.DatoVecchio),
                         new XAttribute("DatoNuovo", myDealerUpdateFields.DatoNuovo)));
                }
            }

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "DealerUpdateXml";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = DealerUpdateXml.ToString();


            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_Dealer_Update";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "Scheda Dealer aggiornata con successo";
        }

        internal DataTable Dealer_CaricaValoriMultipli(string idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "NomeCampo";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_CaricaValoriMultipli";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal DataTable Dealer_CaricaValoriMultipliSelected(int idDealer, string nomeCampo)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealer";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idDealer;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "NomeCampo";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = nomeCampo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_CaricaValoriMultipliSelected";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal DataTable Dealer_OrarioApertura_Get(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealer";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_OrarioApertura_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal DataTable GetAllDealerImport()
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

           
            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerImport_GetAll";
            
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (dt.Rows.Count == 0)
            {
                //dt.Columns.Add("IDDealer", typeof(int));
                dt.Columns.Add("Codice", typeof(string));
            }

            return dt;
        }

        internal string DeleteDealerImport(string Obj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            //dbp[0] = new SqlParameter();
            //dbp[0].ParameterName = "IDDealer";
            //dbp[0].DbType = DbType.Int32;
            //dbp[0].Direction = ParameterDirection.Input;
            //dbp[0].Value = idObj;

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Codice";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = Obj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerImport_Delete";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal string InsertDealerImport(string idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            //dbp[0] = new SqlParameter();
            //dbp[0].ParameterName = "IDDealer";
            //dbp[0].DbType = DbType.Int32;
            //dbp[0].Direction = ParameterDirection.Input;
            //dbp[0].Value = idObj;
            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Codice";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;


            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Import.SP_EccezioniImport_Insert";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        //internal int ExistsDealerImport(string obj)
        //{

        //    sqlop = new SqlOperations();
        //    sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

        //    DbParameter[] dbp = new DbParameter[2];

        //    dbp[0] = new SqlParameter();
        //    dbp[0].ParameterName = "Codice";
        //    dbp[0].DbType = DbType.String;
        //    dbp[0].Direction = ParameterDirection.Input;
        //    dbp[0].Value = obj;

        //    dbp[1] = new SqlParameter();
        //    dbp[1].ParameterName = "IDDealer";
        //    dbp[1].DbType = DbType.Int32;
        //    dbp[1].Direction = ParameterDirection.Output;
        

        //    SqlCommandObject sco = new SqlCommandObject();
        //    sco.SPName = "Import.SP_EccezioniImport_Exists";
        //    sco.SPParams = dbp;

        //    DataTable dt;
        //    List<ExpandoObject> output;
        //    string proc = sqlop.ExecuteProcedure(sco, out dt, out output);
        //    IEnumerable<dynamic> idDealer = output.Cast<dynamic>().Where(x => x.Nome.Contains("@IDDealer"));

        //    return idDealer.First().Value;
        //}


        internal DataTable GetAllDealerBusiness()
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_GetAll";

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (dt.Rows.Count == 0)
            {
                dt.Columns.Add("IDDealerBusiness", typeof(int));
                dt.Columns.Add("Codice", typeof(string));
                dt.Columns.Add("Nome", typeof(string));
                dt.Columns.Add("Indirizzo", typeof(string));
            }

            return dt;
        }

        internal DataTable GetDealerBusiness(int idDealerBusiness)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealerBusiness";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idDealerBusiness;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal string DeleteDealerBusiness(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealerBusiness";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_Delete";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal string InsertDealerBusiness(DealerBusiness obj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[3];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Codice";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = obj.Codice;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Nome";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = obj.Nome;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "Indirizzo";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = obj.Indirizzo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_Insert";
            sco.SPParams = dbp;


            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal string UpdateDealerBusiness(DealerBusiness obj)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[4];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDDealerBusiness";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = obj.IDDealerBusiness;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Codice";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = obj.Codice;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "Nome";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = obj.Nome;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "Indirizzo";
            dbp[3].DbType = DbType.String;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = obj.Indirizzo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_Update";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }

        internal Boolean ExistsDealerBusiness(string obj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Codice";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = obj;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Esiste";
            dbp[1].DbType = DbType.Boolean;
            dbp[1].Direction = ParameterDirection.Output;


            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_DealerBusiness_Exists";
            sco.SPParams = dbp;

            DataTable dt;
            List<ExpandoObject> output;
            string proc = sqlop.ExecuteProcedure(sco, out dt, out output);
            IEnumerable<dynamic> idDealerBusiness = output.Cast<dynamic>().Where(x => x.Nome.Contains("@Esiste"));

            return idDealerBusiness.First().Value;
        }
    }
}
