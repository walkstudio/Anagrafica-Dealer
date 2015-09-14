using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Data;

namespace Spindox.AnagraficaDealer
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        private AnagraficaDealerService proxyMtd = new AnagraficaDealerService();

        private void CaricaUserLoggedIn()
        {

            DataTable myDataTable = proxyMtd.GetProfilo(Convert.ToInt32(Session["IDProfilo"]));

            if (myDataTable.Rows.Count > 0)
            {
                ruoloLabel.Text = myDataTable.Rows[0]["ProfiloUtente"].ToString();
            }
            else
            {
                ruoloLabel.Text = "Profilo inesistente";
            }

            //if (idProfiloTextBox.Text == "")
            //{
            //    idProfiloTextBox.Text = Session["IDProfilo"].ToString();
            //}

        }


        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Session["UserID"] = 1;
                //Session["NomeUtente"] = "Gabriele Oberti";
                //Session["ProfiloUtente"] = "Profilo1";
                //Session["Amministrazione"] = "True";
                //Session["Eccezioni"] = "False";
                //Session["RagioniSocialiCorrelate"] = "False";

                //Session["ArchivioDataBase"] = "False";
                //Session["ArchivioCruscotto"] = "False";
                //Session["ReportAnomalie"] = "False";
                //Session["ReportScarti"] = "True";



                if (Session["UserID"] == null || Session["UserID"].ToString() == "" )
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }


                utenteLabel.Text = Session["NomeUtente"].ToString();
                ruoloLabel.Text = Session["ProfiloUtente"].ToString();

                if (Session["Amministrazione"].ToString() == "True" || Session["Eccezioni"].ToString() == "True")
                {
                    imgUtente.ImageUrl = "~/Resources/Images/Master/user_enabled.png";
                    imgUtente.CssClass = "pointerCursor";
                    imgUtente.Enabled = true;
                    imgUtente.ToolTip = "Amministrazione";
                }

                if (Session["RagioniSocialiCorrelate"].ToString() == "False")
                {
                    divMenuRelazioni.Visible = false;
                }

                if (Session["ArchivioDataBase"].ToString() == "False" && Session["ArchivioCruscotto"].ToString() == "False" &&
                    Session["ReportAnomalie"].ToString() == "False" && Session["ReportScarti"].ToString() == "False")
                {
                    divMenuArchivio.Visible = false;
                }


                //Setting div onclick page based on permission
                if (Session["ArchivioDataBase"].ToString() == "True")
                {
                    divMenuArchivio.Attributes.Add("onclick", "goTo('ArchivioDatabase.aspx');");
                }
                if (Session["ArchivioDataBase"].ToString() == "False" && Session["ArchivioCruscotto"].ToString() == "True")
                {
                    divMenuArchivio.Attributes.Add("onclick", "goTo('ArchivioCruscotto.aspx');");
                }
                if (Session["ArchivioDataBase"].ToString() == "False" && Session["ArchivioCruscotto"].ToString() == "False"
                    && (Session["ReportAnomalie"].ToString() == "True" || Session["ReportScarti"].ToString() == "True"))
                {
                    divMenuArchivio.Attributes.Add("onclick", "goTo('Importazioni.aspx');");
                }
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {

            //CaricaUserLoggedIn();

        }




        protected void imgUtente_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["Amministrazione"].ToString() == "True")
            {
                Response.Redirect("~/Utenti.aspx");
            }
            else if (Session["Eccezioni"].ToString() == "True")
            {
                Response.Redirect("~/ImportazioniEccezioni.aspx");
            }

        }
        protected void imgLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

    }
}