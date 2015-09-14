using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer
{
    public partial class Utenti : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;

        private int IDUtente
        {
            set
            {
                Session["IDUtente"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopupElimina.EliminaButtonClicked += new UserControl.RagioniSocialiCorrelate.EliminaEventHandler(PopupElimina_EliminaButtonClicked);

            if (!IsPostBack)
            {
                proxyMtd = new AnagraficaDealerService();
                gvUtenti.DataSource = proxyMtd.GetAllUtenti();
                gvUtenti.DataBind();
            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || Session["Amministrazione"].ToString() == "False")
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }
        protected void cbSelected_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow gvr = (GridViewRow)chk.NamingContainer;

            int rowIndex = Convert.ToInt32(gvr.DataItemIndex);
            /*Save IDProfilo in session variable*/
            if (chk.Checked)
            {
                int id;
                bool parsed = Int32.TryParse(gvUtenti.DataKeys[rowIndex].Value.ToString(), out id);

                if (parsed)
                {
                    IDUtente = id;
                }

                GestioneUtentiSubMenuControl.enableBtnModifica(true);
                GestioneUtentiSubMenuControl.enableBtnElimina(true);

            }
            else
            {
                Session.Remove("IDUtente");
                GestioneUtentiSubMenuControl.enableBtnModifica(false);
                GestioneUtentiSubMenuControl.enableBtnElimina(false);
            }


            /*Select only one checkbox at time*/
            foreach (GridViewRow row in gvUtenti.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("cbSelected");

                if (!chk.Equals(ChkBoxRows))
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        private void PopupElimina_EliminaButtonClicked(object sender, EventArgs e)
        {
           
            try
            {
                Boolean attivo = false;
                string IDUtenteSelezionato = null;

                foreach (GridViewRow row in gvUtenti.Rows)
                {
                    CheckBox chkSelected = (CheckBox)row.FindControl("cbSelected");
                    if (chkSelected.Checked)
                    {
                        attivo = ((CheckBox)row.FindControl("Attivo")).Checked;
                        IDUtenteSelezionato = chkSelected.Attributes["key"];
                    }
                }

                int IDUtente = Convert.ToInt32(Session["IDUtente"].ToString());
                AnagraficaDealerService proxyMtd = new AnagraficaDealerService();
                proxyMtd.DeleteUtente(IDUtente);
                Session.Remove("IDUtente");
                GestioneUtentiSubMenuControl.enableBtnModifica(false);
                GestioneUtentiSubMenuControl.enableBtnElimina(false);

                PopupElimina.Hide();

                gvUtenti.DataSource = proxyMtd.GetAllUtenti();
                gvUtenti.DataBind();
                utenteUpdatePanel.Update();
            }          
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }
        public void showEliminaPopup()
        {
            foreach(GridViewRow gvr in gvUtenti.Rows)
            {

                CheckBox chk =(CheckBox)gvr.FindControl("cbSelected");
                if (chk.Checked)
                {
                    int gridIndex = gvr.DataItemIndex;
                    string idUtente = gvUtenti.DataKeys[gvr.DataItemIndex].Value.ToString();

                    PopupElimina.Show("Sei sicuro di voler attivare/disattivare l'utente?", idUtente, gridIndex);
                }
            }   
        }

        protected void gvUtenti_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;
            e.Row.Attributes["onmouseover"] = string.Format("RowMouseOver({0});", e.Row.RowIndex);
            e.Row.Attributes["onmouseout"] = string.Format("RowMouseOut({0});", e.Row.RowIndex);
        }
    }
}