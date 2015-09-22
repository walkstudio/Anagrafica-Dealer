using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Web.UI.HtmlControls;
using System.Configuration;
namespace Spindox.AnagraficaDealer
{
    public partial class Ricerca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //btn_refresh.Click += new EventHandler(btn_refresh_Click);
            Page.Header.Controls.AddAt(0, new HtmlMeta { HttpEquiv = "X-UA-Compatible", Content = "IE=7" });
            //Ricarica i dati solo se non e' una postback asincrona.
            //if (HttpContext.Current.Session["newusr"] == null && ScriptManager1.AsyncPostBackSourceElementID != "ImageButtonSyncAll")
            //  GetAllData();
            if (ConfigurationManager.AppSettings["authmode"] == "OFF")
                HttpContext.Current.Session["user"] = ConfigurationManager.AppSettings["usertest"].ToString();
            else
                HttpContext.Current.Session["user"] = (Context.User.Identity.Name.Split(new Char[] { '\\' }))[1];


        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetRagioneSociale(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
             dt = proxyMtd.GetRagioneSociale(pre);

            //DataRow[] allNameDR = (from a in dt.AsEnumerable()
            //                       where a.Field<string>("RagioneSociale").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
            //                       select a).ToArray();
             DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                    where a.Field<string>("RagioneSociale").ToString().ToLower().Contains(pre.ToLower())//, true, CultureInfo.CurrentCulture)
                                    select a).ToArray();
            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("RagioneSociale").ToString());

            }
            return allName;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetPartitaIva(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetPartitaIva(pre);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   where a.Field<string>("PIVA").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("PIVA").ToString());

            }
            return allName;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetDealers(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetAllDealersCode(pre);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   where a.Field<string>("Codice").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("Codice").ToString());

            }
            return allName;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetMasterDealers(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetAllMasterDealerCode(pre);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   //where a.Field<string>("Codice").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   where a.Field<string>("MasterDealer").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                //allName.Add(dr.Field<string>("Codice").ToString());
                allName.Add(dr.Field<string>("MasterDealer").ToString());

            }
            return allName;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetLocalita(string pre, string prov, string regione)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetLocalita(pre,prov,regione);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   where a.Field<string>("Localita").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("Localita").ToString());

            }
            return allName;
        }

        [WebMethod(EnableSession = true)]
        public static string GestioneRicerca(string xmlRicerca, string action)
        {

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();

            string user = HttpContext.Current.Session["User"].ToString();
            if (action == "S")
            {
                string ret = proxyMtd.GestioneRicerca(xmlRicerca, user);
                return ret;
            }
            else
            {
                string ret = proxyMtd.GestioneRicerca(user);
                return ret;

            }
        }

        [WebMethod(EnableSession=true)]
        public static List<string> RicercaDealer(string xmlInput)
        {
            string user = HttpContext.Current.Session["User"].ToString();
            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();
            xmlInput = xmlInput.Replace("&","$$");
            DataTable dt = proxyMtd.RicercaDealer(xmlInput, user);

            //List<string> ls = new List<string>();
            //ls.Add("");
            var columnsList = new List<string>();
            //HttpContext.Current.Session["dtTmp"] = dt;
           
            if(dt==null || dt.Rows.Count==0)
            {
                DataTable dtTmp = new DataTable();
                columnsList = null;
                return columnsList;

                //dtTmp.Columns.Add("Codice", typeof(string));
                //dtTmp.Columns.Add("Canale", typeof(string));
                //dtTmp.Columns.Add("RagioneSociale", typeof(string));
                //dtTmp.Columns.Add("Stato", typeof(string));
                //dtTmp.Columns.Add("Area", typeof(string));

                ////SOLO PER TEST:ELIMINARE
                //DataRow newRow = dtTmp.NewRow();
                //Random rng = new Random();
                //for (int i = 0; i < 1300; i++)
                //{
                //    newRow = dtTmp.NewRow();
                //    newRow["Codice"] = rng.Next(9999).ToString("00000") + "." + rng.Next(9999).ToString("00000");
                //    newRow["Canale"] = "I" + rng.Next(9).ToString("0");
                //    newRow["RagioneSociale"] = "Dealer Test "+i.ToString()+" srl";
                //    newRow["Stato"] = "Attivo";
                //    newRow["Area"] = "Nord Ovest";
                //    dtTmp.Rows.Add(newRow);
                //}


                //columnsList = dtTmp.AsEnumerable()
                // .SelectMany(row => dtTmp.Columns.Cast<DataColumn>()
                //                           .Select(col => Convert.ToString(row[col])))
                // .ToList();

                //return columnsList;
                //SOLO PER TEST:ELIMINARE

            }
            columnsList = dt.AsEnumerable()
                .SelectMany(row => dt.Columns.Cast<DataColumn>()
                                          .Select(col => Convert.ToString(row[col])))
                .ToList();
            return columnsList;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ListItem> GetInfoDealer(string info, string param)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();

            List<ListItem> allInfo = new List<ListItem>();
            string utente =  HttpContext.Current.Session["user"].ToString();
            dt = proxyMtd.GetInfoDealer(info, param, utente);

            if (dt == null) return allInfo;

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   select a).ToArray();

            switch (info)
            {
                case "S":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("NomeStato").ToString(), dr.Field<int>("IDStato").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "T":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("NomeTipoDealer").ToString(), dr.Field<int>("IDTipoDealer").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "Z":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDZona").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "C":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("NomeCanale").ToString(), dr.Field<int>("IDCanale").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "R":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDRegione").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "A":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDAreaManager").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "P":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDProvincia").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "L":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDComune").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "O":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Operativita").ToString(), dr.Field<int>("IDOperativita").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "F":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Nome").ToString(), dr.Field<int>("IDFunzionario").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "V":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("ModelloVendita").ToString(), dr.Field<int>("IDModelloVendita").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "G":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("SegmentazioneCanale").ToString(), dr.Field<int>("IDSegmentazioneCanale").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "CL":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("Cluster").ToString(), dr.Field<int>("IDCluster").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "AC":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("NomeArea").ToString(), dr.Field<int>("IDAreaDiCompetenza").ToString());
                        allInfo.Add(li);
                    }
                    break;
                case "TA":
                    foreach (DataRow dr in allNameDR)
                    {
                        ListItem li = new ListItem(dr.Field<string>("TechAss").ToString(), dr.Field<string>("TechAss").ToString());
                        allInfo.Add(li);
                    }
                    break;
            }


            return allInfo;
        }



        [WebMethod(EnableSession = true)]
        public static int SaveDealerId(string id)
        {
            try {
                HttpContext.Current.Session["IDDealer"] = id;
                return 0;
            }
            catch { return -1; }

        }

        [WebMethod(EnableSession = true)]
        public static int ExportQuery(string strRicerca)
        {
            try
            {
                HttpContext.Current.Session["ExportQuery"] = strRicerca;
                return 0;
            }
            catch { return -1; }

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetFunzionari(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetAllFunzionari(pre);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   where a.Field<string>("Funzionario").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("Funzionario").ToString());

            }
            return allName;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetSupporti(string pre)
        {
            DataTable dt = new DataTable();

            AnagraficaDealerClassLib.AnagraficaDealerService proxyMtd;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();


            List<string> allName = new List<string>();
            dt = proxyMtd.GetAllSupporti(pre);

            DataRow[] allNameDR = (from a in dt.AsEnumerable()
                                   where a.Field<string>("Supporti").ToString().StartsWith(pre, true, CultureInfo.CurrentCulture)
                                   select a).ToArray();

            foreach (DataRow dr in allNameDR)
            {
                allName.Add(dr.Field<string>("Supporti").ToString());

            }
            return allName;
        }


    }
}