using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.Common;
using System.Data;
using System.Reflection;
using System.Data.SqlClient;


namespace AnagraficaDealerClassLib
{
    public class AnagraficaDealerService
    {

        AnagraficaDealerLogger logObj = new AnagraficaDealerLogger();
        #region Connessione da Properties della Lib
        
        //private static string dbConnectionString = Properties.Settings.Default.connectionString;
        
        #endregion

        #region Metodi Utenti
        public DataTable getFromActiveDirectory(string username)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.getFromActiveDirectory(username);
        }

        public DataTable GetUtente(string username)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.GetUtente(username);
        }

        public DataTable GetAllUtenti()
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.GetAllUtenti();
        }
        public DataTable GetUtente(int idObj)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.GetUtente(idObj);
        }
        public Boolean InsertUtente(Utente obj)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.InsertUtente(obj);
        }
        public string UpdateUtente(Utente obj)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.UpdateUtente(obj);
        }
        public string DeleteUtente(int idObj)
        {
            Methods.UtenteMng utente = new Methods.UtenteMng();
            return utente.DeleteUtente(idObj);
        }
        #endregion
              
        #region Metodi Profilo
        public DataTable GetAllProfili()
        {
            Methods.ProfiloMng profilo = new Methods.ProfiloMng();
            return profilo.GetAllProfili();
        }

        public DataTable GetProfilo(int idObj)
        {
            Methods.ProfiloMng profilo = new Methods.ProfiloMng();
            return profilo.GetProfilo(idObj);
        }
        
        public string InsertProfilo(Profilo myProfilo, List<TipoDealer> myTipoDealerList, List<AutorizzazioneCampi> myAutorizzazioneCampiList)
        {
            Methods.ProfiloMng profilo = new Methods.ProfiloMng();
            return profilo.InsertProfilo(myProfilo, myTipoDealerList, myAutorizzazioneCampiList);
        }
        
        public string UpdateProfilo(Profilo myProfilo, List<TipoDealer> myTipoDealerList, List<AutorizzazioneCampi> myAutorizzazioneCampiList)
        {
            Methods.ProfiloMng profilo = new Methods.ProfiloMng();
            return profilo.UpdateProfilo(myProfilo, myTipoDealerList, myAutorizzazioneCampiList);
        }
        
        public string DeleteProfilo(int idObj)
        {
            Methods.ProfiloMng profilo = new Methods.ProfiloMng();
            return profilo.DeleteProfilo(idObj);
        }
           #endregion

        #region Metodi Export
        public DataTable GetAllExport(int fileType)
        {
            Methods.ExportMng export = new Methods.ExportMng();
            return export.GetAllExport(fileType);
        }
        #endregion

        #region Metodi Dealer
        public DataTable GetAllTipoDealer(string utente = null)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetAllTipoDealer(utente);
        }

        public DataTable GetAllDealerImport()
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetAllDealerImport();
        }

        public string DeleteDealerImport(string Obj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.DeleteDealerImport(Obj);
        }

        public string InsertDealerImport(string idObj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.InsertDealerImport(idObj);
        }

        //public int ExistsDealerImport(string obj)
        //{
        //    Methods.DealerMng dealer = new Methods.DealerMng();
        //    return dealer.ExistsDealerImport(obj);
        //}

        public DataTable GetAllDealerBusiness()
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetAllDealerBusiness();
        }

        public string DeleteDealerBusiness(int idObj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.DeleteDealerBusiness(idObj);
        }

        public string InsertDealerBusiness(DealerBusiness obj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.InsertDealerBusiness(obj);
        }
        public Boolean ExistsDealerBusiness(string obj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.ExistsDealerBusiness(obj);
        }

        public DataTable GetDealerBusiness(int idDealerBusiness)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetDealerBusiness(idDealerBusiness);
        }

        public string UpdateDealerBusiness(DealerBusiness obj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.UpdateDealerBusiness(obj);
        }

        public string UpdateDealer(int IDUtente, DealerUpdate DealerUpdate)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.UpdateDealer(IDUtente, DealerUpdate);
        }

        public DataTable GetDealer(int idObj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetDealer(idObj);
        }

        public DataTable GetStorico(int idObj, string tipologia = null)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.GetStorico(idObj, tipologia);
        }

        public DataTable Dealer_CaricaValoriMultipli (string idObj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.Dealer_CaricaValoriMultipli(idObj);
        }

        public DataTable Dealer_CaricaValoriMultipliSelected(int idDealer, string nomeCampo)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.Dealer_CaricaValoriMultipliSelected(idDealer, nomeCampo);
        }

        public DataTable Dealer_OrarioApertura_Get(int idObj)
        {
            Methods.DealerMng dealer = new Methods.DealerMng();
            return dealer.Dealer_OrarioApertura_Get(idObj);
        }

        #endregion

        #region Metodi ProfiloAbilitazioni
        public DataTable AutorizzazioneCampi_Get(int myIDProfilo, int myIDDealer = 0)
        {
            Methods.ProfiloAbilitazioniMng profiloAbil = new Methods.ProfiloAbilitazioniMng();
            return profiloAbil.AutorizzazioneCampi_Get(myIDProfilo, myIDDealer);
        }

        public List<AutorizzazioneCampi> AutorizzazioneCampi_GetList(int myIDProfilo, int myIDDealer = 0)
        {
            Methods.ProfiloAbilitazioniMng profiloAbil = new Methods.ProfiloAbilitazioniMng();
            return profiloAbil.AutorizzazioneCampi_GetList(myIDProfilo, myIDDealer);
        }

        //public DataTable AbilitazioniTipoDealer_Get(int myIDProfilo)
        //{
        //    Methods.ProfiloAbilitazioniMng profiloAbil = new Methods.ProfiloAbilitazioniMng();
        //    return profiloAbil.AbilitazioniTipoDealer_Get(myIDProfilo);
        //}
        
        #endregion

        #region Metodi RelazioniDealer
        public DataTable SearchRelazioni(int idTipoDealer, string codice, string ragioneSociale, string relazione)
         {
            Methods.RelazioniMng relazioni = new Methods.RelazioniMng();
            return relazioni.SearchRelazioni(idTipoDealer, codice, ragioneSociale, relazione);
        }

        public DataTable GetDettaglioRelazione(int idRelazione, int idTipoDealer)
        {
            Methods.RelazioniMng relazioni = new Methods.RelazioniMng();
            return relazioni.GetDettaglioRelazione(idRelazione, idTipoDealer);
        }


        public string DeleteRelazione(int idRelazione, int idTipoDealer)
        {
            Methods.RelazioniMng relazioni = new Methods.RelazioniMng();
            return relazioni.DeleteRelazione( idRelazione,  idTipoDealer);
        }

        public DataTable GetAllDealerRelazioni(string codiceDealer, string ragioneSocialeDealer, int idTipoDealer)
        {
            Methods.RelazioniMng relazioni = new Methods.RelazioniMng();
            return relazioni.GetAllDealerRelazioni(codiceDealer, ragioneSocialeDealer, idTipoDealer);
        }

        public string InserRelazioneDealer(Relazioni relazione)
        {
            Methods.RelazioniMng relazioni = new Methods.RelazioniMng();
            return relazioni.InserRelazioneDealer(relazione);
        }

        #endregion

        #region Metodi Ricerca

        public DataTable GetInfoDealer(string info, string param,string utente)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetInfoDealer(info,param,utente);
        }

        public DataTable GetAllDealersCode(string pre)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetAllDealersCode(pre);
        }

       public DataTable GetAllMasterDealerCode(string pre)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetAllMasterDealerCode(pre);
        }

        public string GestioneRicerca(string strRicerca, string user)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GestioneRicerca(strRicerca, user);
        }

        public string GestioneRicerca(string user)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GestioneRicerca(user);
            
        }

        public DataTable GetRagioneSociale(string pre)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetRagioneSociale(pre);

        }

        public DataTable GetLocalita(string pre,string prov)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetLocalita(pre,prov);
        }

        public DataTable GetPartitaIva(string pre)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.GetPartitaIva(pre);

        }

        public DataTable RicercaDealer(string xmlInput, string user)
        {
            Methods.RicercaMng ricerca = new Methods.RicercaMng();
            return ricerca.RicercaDealer(xmlInput,user);
        }

        #endregion



    }



    public static class LinqUpdates
    {

        public static void Update<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (var item in source)
                action(item);
        }

    }

    public static class ConfigInfo
    {
        public static string GetCnnString()
        {
           ConnectionStringSettingsCollection settings = ConfigurationManager.ConnectionStrings;

           return settings[0].ToString();
        }
    }


    public static class OP
    {

        /*Converts List To DataTable*/
        public static DataTable ToDataTable<TSource>(this IList<TSource> data)
        {
            DataTable dataTable = new DataTable(typeof(TSource).Name);
            PropertyInfo[] props = typeof(TSource).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in props)
            {
                dataTable.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ??
                    prop.PropertyType);
            }

            foreach (TSource item in data)
            {
                var values = new object[props.Length];
                for (int i = 0; i < props.Length; i++)
                {
                    values[i] = props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;
        }  

    }



}