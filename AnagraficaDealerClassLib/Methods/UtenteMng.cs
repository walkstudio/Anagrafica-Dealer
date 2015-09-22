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
    internal class UtenteMng
    {
        private SqlOperations sqlop;

        internal DataTable getFromActiveDirectory(string username)
        {
            try
            {
                sqlop = new SqlOperations();
                sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

                DbParameter[] dbp = new DbParameter[1];

                dbp[0] = new SqlParameter();
                dbp[0].ParameterName = "UserID";
                dbp[0].DbType = DbType.String;
                dbp[0].Direction = ParameterDirection.Input;
                dbp[0].Value = username;

                SqlCommandObject sco = new SqlCommandObject();
                sco.SPName = "Utenti.SP_Utenti_ADData_Get";
                sco.SPParams = dbp;

                DataTable dt;
                string proc = sqlop.ExecuteProcedure(sco, out dt);

                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable GetAllUtenti()
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Utenti_GetAll";
            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);
           
            return dt;
        }

        internal DataTable GetUtente(int idObj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDUtente";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Utenti_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }



        internal DataTable GetUtente(string username)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();


            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Username";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = username;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_UtentiFromUsername_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal Boolean InsertUtente(Utente obj)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[9];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "Nome";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = obj.Nome;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Cognome";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = obj.Cognome;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "Email";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = obj.Email;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "UserID";
            dbp[3].DbType = DbType.String;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = obj.UserID;

            dbp[4] = new SqlParameter();
            dbp[4].ParameterName = "IDProfilo";
            dbp[4].DbType = DbType.Int32;
            dbp[4].Direction = ParameterDirection.Input;
            dbp[4].Value = obj.IDProfilo;

            dbp[5] = new SqlParameter();
            dbp[5].ParameterName = "Attivo";
            dbp[5].DbType = DbType.Boolean;
            dbp[5].Direction = ParameterDirection.Input;
            dbp[5].Value = obj.Attivo;

            dbp[6] = new SqlParameter();
            dbp[6].ParameterName = "IDUtente";
            dbp[6].DbType = DbType.Int32;
            dbp[6].Direction = ParameterDirection.Output;
            dbp[6].Value = obj.IDUtente;

            dbp[7] = new SqlParameter();
            dbp[7].ParameterName = "Esiste";
            dbp[7].DbType = DbType.Boolean;
            dbp[7].Direction = ParameterDirection.Output;

            dbp[8] = new SqlParameter();
            dbp[8].ParameterName = "CodRuolo";
            dbp[8].DbType = DbType.String;
            dbp[8].Direction = ParameterDirection.Input;
            dbp[8].Value = String.IsNullOrEmpty(obj.CodRuolo) ? (object)DBNull.Value : obj.CodRuolo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Utenti_Insert";
            sco.SPParams = dbp;

            DataTable dt;
            List<ExpandoObject> outputList = new List<ExpandoObject>(); 
          
            string proc = sqlop.ExecuteProcedure(sco, out dt, out outputList);
            IEnumerable<dynamic> esiste = outputList.Cast<dynamic>().Where(x => x.Nome.Contains("@Esiste"));

            return Convert.ToBoolean(esiste.First().Value);
        }

        internal string UpdateUtente(Utente obj)
        {
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[7];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDUtente";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = obj.IDUtente;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "Nome";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = obj.Nome;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "Cognome";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = obj.Cognome;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "Email";
            dbp[3].DbType = DbType.String;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = obj.Email;

            dbp[4] = new SqlParameter();
            dbp[4].ParameterName = "UserID";
            dbp[4].DbType = DbType.String;
            dbp[4].Direction = ParameterDirection.Input;
            dbp[4].Value = obj.UserID;

            dbp[5] = new SqlParameter();
            dbp[5].ParameterName = "IDProfilo";
            dbp[5].DbType = DbType.Int32;
            dbp[5].Direction = ParameterDirection.Input;
            dbp[5].Value = obj.IDProfilo;

            dbp[6] = new SqlParameter();
            dbp[6].ParameterName = "CodRuolo";
            dbp[6].DbType = DbType.String;
            dbp[6].Direction = ParameterDirection.Input;
            dbp[6].Value = String.IsNullOrEmpty(obj.CodRuolo) ? (object)DBNull.Value : obj.CodRuolo;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Utenti_Update";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;
            
            return "";
        }

        internal string DeleteUtente(int idObj)
        {
            
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDUtente";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idObj;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Utenti.SP_Utenti_Delete";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";
        }
    }
}
