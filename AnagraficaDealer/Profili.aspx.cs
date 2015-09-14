using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer
{
    public partial class Profili : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;
        private int IDProfilo
        {
            set
            {
                Session["IDProfilo"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopupElimina.EliminaButtonClicked += new UserControl.RagioniSocialiCorrelate.EliminaEventHandler(PopupEliminaProfilo_EliminaButtonClicked);

            if (!IsPostBack)
            {
                proxyMtd = new AnagraficaDealerService();
                profiloGridView.DataSource = proxyMtd.GetAllProfili();
                profiloGridView.DataBind();
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

        private void PopupEliminaProfilo_EliminaButtonClicked(object sender, EventArgs e)
        {
            try
            {

                int IDProfilo = Convert.ToInt32(Session["IDProfilo"].ToString());
                AnagraficaDealerService proxyMtd = new AnagraficaDealerService();
               // proxyMtd.DeleteProfilo(IDProfilo);
                string error = proxyMtd.DeleteProfilo(IDProfilo);
                if (error != string.Empty)
                {
                    PopupElimina.Hide();
                    throw new Exception(error);
                }

                Session.Remove("IDProfilo");
                GestioneProfiliSubMenuControl.enableBtnModifica(false);
                GestioneProfiliSubMenuControl.enableBtnElimina(false);

                PopupElimina.Hide();

                profiloGridView.DataSource = proxyMtd.GetAllProfili();
                profiloGridView.DataBind();
                profiliUpdatePanel.Update();

            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
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
                bool parsed = Int32.TryParse(profiloGridView.DataKeys[rowIndex].Value.ToString(), out id);

                if (parsed)
                {
                    IDProfilo = id;
                }

                GestioneProfiliSubMenuControl.enableBtnModifica(true);
                GestioneProfiliSubMenuControl.enableBtnElimina(true);

            }
            else
            {
                Session.Remove("IDProfilo");
                GestioneProfiliSubMenuControl.enableBtnModifica(false);
                GestioneProfiliSubMenuControl.enableBtnElimina(false);
            }


            /*Select only one checkbox at time*/
            foreach (GridViewRow row in profiloGridView.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("cbSelected");

                if (!chk.Equals(ChkBoxRows))
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }


        public void showEliminaPopup()
        {
            foreach (GridViewRow gvr in profiloGridView.Rows)
            {

                CheckBox chk = (CheckBox)gvr.FindControl("cbSelected");
                if (chk.Checked)
                {
                    int gridIndex = gvr.DataItemIndex;
                    string idProfilo = profiloGridView.DataKeys[gvr.DataItemIndex].Value.ToString();

                    PopupElimina.Show("Sei sicuro di voler eliminare il profilo selezionato?", idProfilo, gridIndex);
                }
            } 
           
        }

    }
}