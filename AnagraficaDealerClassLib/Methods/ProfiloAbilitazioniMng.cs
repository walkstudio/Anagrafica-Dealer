using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;

namespace AnagraficaDealerClassLib.Methods
{
    internal class ProfiloAbilitazioniMng
    {
       private SqlOperations sqlop;

       internal DataTable AutorizzazioneCampi_Get(int myIDProfilo, int myIDDealer)
       {
           sqlop = new SqlOperations();
           sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

           DbParameter[] dbp = new DbParameter[2];

           dbp[0] = new SqlParameter();
           dbp[0].ParameterName = "IDProfilo";
           dbp[0].DbType = DbType.Int32;
           dbp[0].Direction = ParameterDirection.Input;
           dbp[0].Value = myIDProfilo;

           dbp[1] = new SqlParameter();
           dbp[1].ParameterName = "IDDealer";
           dbp[1].DbType = DbType.Int32;
           dbp[1].Direction = ParameterDirection.Input;
           dbp[1].Value = myIDDealer;

           SqlCommandObject sco = new SqlCommandObject();
           sco.SPName = "Utenti.SP_AutorizzazioneCampi_Get";
           sco.SPParams = dbp;

           DataTable dt;

           string proc = sqlop.ExecuteProcedure(sco, out dt);

           return dt;
       }

       internal List<AutorizzazioneCampi> AutorizzazioneCampi_GetList(int myIDProfilo, int myIDDealer)
       {
           sqlop = new SqlOperations();
           sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

           DbParameter[] dbp = new DbParameter[2];

           dbp[0] = new SqlParameter();
           dbp[0].ParameterName = "IDProfilo";
           dbp[0].DbType = DbType.Int32;
           dbp[0].Direction = ParameterDirection.Input;
           dbp[0].Value = myIDProfilo;

           dbp[1] = new SqlParameter();
           dbp[1].ParameterName = "IDDealer";
           dbp[1].DbType = DbType.Int32;
           dbp[1].Direction = ParameterDirection.Input;
           dbp[1].Value = myIDDealer;

           SqlCommandObject sco = new SqlCommandObject();
           sco.SPName = "Utenti.SP_AutorizzazioneCampi_Get";
           sco.SPParams = dbp;

           DataTable dt;
           
           string proc = sqlop.ExecuteProcedure(sco, out dt);

           List<AutorizzazioneCampi> myAutorizzazioneCampiList = new List<AutorizzazioneCampi>();

           foreach (DataRow myDataRow in dt.Rows)
               {
                   AutorizzazioneCampi myAutorizzazioneCampi = new AutorizzazioneCampi();
                   myAutorizzazioneCampi.IDAutorizzazioneCampi = Convert.ToInt32(myDataRow["IDAutorizzazioneCampi"]);
                   myAutorizzazioneCampi.Autorizzazione = Convert.ToInt32(myDataRow["Autorizzazione"]);
                   myAutorizzazioneCampi.IDCampoDati = Convert.ToInt32(myDataRow["IDCampoDati"]);
                   myAutorizzazioneCampi.NomeCampo = Convert.ToString(myDataRow["NomeCampo"]);
                   myAutorizzazioneCampi.NomeCampoFrontEnd = Convert.ToString(myDataRow["NomeCampoFrontEnd"]);
                   myAutorizzazioneCampi.NomeTabella = Convert.ToString(myDataRow["NomeTabella"]);
                   myAutorizzazioneCampi.TipoWebControl = Convert.ToString(myDataRow["TipoWebControl"]);
                   myAutorizzazioneCampi.TipoDato = Convert.ToString(myDataRow["TipoDato"]);
                   myAutorizzazioneCampi.LunghezzaMassima = Convert.ToInt32(myDataRow["LunghezzaMassima"]);
                   myAutorizzazioneCampiList.Add(myAutorizzazioneCampi);
               }

           return myAutorizzazioneCampiList;
       }

        //internal DataTable AbilitazioniTipoDealer_Get(int myIDProfilo)
        //{
        //    sqlop = new SqlOperations();
        //    sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();

        //    DbParameter[] dbp = new DbParameter[1];

        //    dbp[0] = new SqlParameter();
        //    dbp[0].ParameterName = "IDProfilo";
        //    dbp[0].DbType = DbType.Int32;
        //    dbp[0].Direction = ParameterDirection.Input;
        //    dbp[0].Value = myIDProfilo;

        //    SqlCommandObject sco = new SqlCommandObject();
        //    sco.SPName = "Utenti.SP_AbilitazioniTipoDealer_Get";
        //    sco.SPParams = dbp;

        //    DataTable dt;
        //    string proc = sqlop.ExecuteProcedure(sco, out dt);
        //    if (dt.Rows.Count == 0)
        //    {
        //        dt.Columns.Add("IDTipoDealer", typeof(int));
        //        dt.Columns.Add("NomeTipoDealer", typeof(string));
        //    }
        //    return dt;
        //}

    }
}
