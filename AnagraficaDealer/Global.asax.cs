using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using AnagraficaDealerClassLib;
using System.Data;

namespace Spindox.AnagraficaDealer
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                AnagraficaDealerService proxtCRMP = new AnagraficaDealerService();
                string username = (Context.User.Identity.Name.Split(new Char[] { '\\' }))[1];
                //proxtCRMP.WriteLogger("username" + username, "Info");
                DataTable dt = proxtCRMP.GetUtente(username);

                if (dt != null && dt.Rows.Count != 0)
                {
                    //proxtCRMP.WriteLogger("dt.Rows.Count:" + dt.Rows.Count, "Info");
                    //Trace.Write(" dt.Rows.Count " + dt.Rows.Count.ToString());
                    Session["user"] = username;
                    Session["UserID"] = dt.Rows[0]["IDUsername"];
                    Session["NomeUtente"] = dt.Rows[0]["Nome"] + " " + dt.Rows[0]["Cognome"];
                    Session["IDProfilo"] = dt.Rows[0]["IDProfilo"];
                    Session["ProfiloUtente"] = dt.Rows[0]["NomeProfilo"];
                    
                    Session["ArchivioDataBase"] = dt.Rows[0]["ArchivioDataBase"];
                    Session["ArchivioCruscotto"] = dt.Rows[0]["ArchivioCruscotto"];
                    Session["ReportAnomalie"] = dt.Rows[0]["ReportAnomalie"];
                    Session["ReportScarti"] = dt.Rows[0]["ReportScarti"];             
                   
                    Session["Amministrazione"] = dt.Rows[0]["Amministrazione"];
                    Session["RagioniSocialiCorrelate"] = dt.Rows[0]["RagioniSocialiCorrelate"];
                    Session["Eccezioni"] = dt.Rows[0]["Eccezioni"];
                }
            }
            //Session["IDUtente"] = 1;
            Session["IDDealer"] = 0;
            //Session["IDProfiloLoggedInTest"] = 3;
            Session["DivNumSelected"] = 1;
            Session["retCode"] = String.Empty;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}