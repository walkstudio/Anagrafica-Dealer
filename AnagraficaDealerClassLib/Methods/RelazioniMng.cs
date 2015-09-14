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
    internal class RelazioniMng
    {
        private SqlOperations sqlop;



        internal DataTable SearchRelazioni(int idTipoDealer, string codice, string ragioneSociale, string relazione)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[4];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDTipoDealer";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idTipoDealer;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "CodiceDealer";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = codice;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "RagioneSociale";
            dbp[2].DbType = DbType.String;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = ragioneSociale;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "Relazione";
            dbp[3].DbType = DbType.String;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = relazione;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_RelazioniDealer_Search";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);


            return dt;
        }


        internal DataTable GetDettaglioRelazione(int idRelazione, int idTipoDealer)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDRelazione";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idRelazione;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "IDTipoDealer";
            dbp[1].DbType = DbType.Int32;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = idTipoDealer;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_RelazioniDealer_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);


            return dt;
        }

        internal string DeleteRelazione(int idRelazione, int idTipoDealer)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[2];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "IDRelazione";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = idRelazione;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "IDTipoDealer";
            dbp[1].DbType = DbType.Int32;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = idTipoDealer;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_RelazioniDealer_Delete";
            sco.SPParams = dbp;

            DataTable dt;
            
            
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";

          
        }

        internal DataTable GetAllDealerRelazioni(string codiceDealer, string ragioneSocialeDealer,int idTipoDealer)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[3];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "CodiceDealer";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = codiceDealer;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "RagioneSocialeDealer";
            dbp[1].DbType = DbType.String;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = ragioneSocialeDealer;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "IdTipoDealer";
            dbp[2].DbType = DbType.Int32;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = idTipoDealer;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_RelazioniDealer_GetDealer";
            sco.SPParams = dbp;

            DataTable dt;

            sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }

        internal string InserRelazioneDealer(Relazioni rel){
            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

            DbParameter[] dbp = new DbParameter[4];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "NomeRelazione";
            dbp[0].DbType = DbType.String;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = rel.NomeRelazione;

            dbp[1] = new SqlParameter();
            dbp[1].ParameterName = "IDTipoDealer";
            dbp[1].DbType = DbType.Int32;
            dbp[1].Direction = ParameterDirection.Input;
            dbp[1].Value = rel.IDTipoDealer;

            dbp[2] = new SqlParameter();
            dbp[2].ParameterName = "IDDealer1";
            dbp[2].DbType = DbType.Int32;
            dbp[2].Direction = ParameterDirection.Input;
            dbp[2].Value = rel.IDDealerConsumer;

            dbp[3] = new SqlParameter();
            dbp[3].ParameterName = "IDDealer2";
            dbp[3].DbType = DbType.Int32;
            dbp[3].Direction = ParameterDirection.Input;
            dbp[3].Value = rel.IDDealer;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Dealer.SP_RelazioniDealer_Insert";
            sco.SPParams = dbp;

            DataTable dt;


            string proc = sqlop.ExecuteProcedure(sco, out dt);

            if (proc != string.Empty)
                return proc;

            return "";

        }
       
    }
}
