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
    public partial class ImportEccezioni : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;
        private DataTable DealerTable
        {
            get
            {
                if (ViewState["DealerTable"] == null)
                {
                    DataTable dt = new DataTable();
                    ViewState["DealerTable"] = dt;
                }
                return (DataTable)ViewState["DealerTable"];
            }
            set
            {
                ViewState["DealerTable"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopupAggiungiEccezione.AggiungiButtonClicked += new UserControl.RagioniSocialiCorrelate.AggiungiEccezioneEventHandler(PopupAggiungiEccezione_AggiungiButtonClicked);
            PopupElimina.EliminaButtonClicked += new UserControl.RagioniSocialiCorrelate.EliminaEventHandler(PopupElimina_EliminaButtonClicked);
            proxyMtd = new AnagraficaDealerService();
            if (!IsPostBack)
            {

                DealerTable = proxyMtd.GetAllDealerImport();
                eccImportGridView.DataSource = DealerTable;
                eccImportGridView.DataBind();
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || Session["Eccezioni"].ToString() == "False")
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }

        private void PopupElimina_EliminaButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.EliminaEventArgs e)
        {
            try
            {
                //int idDealer = Convert.ToInt32(e.IDObject);

                proxyMtd.DeleteDealerImport(e.IDObject);

                DealerTable.Rows.RemoveAt(e.GridIndex);

                eccImportGridView.DataSource = DealerTable;
                eccImportGridView.DataBind();

                importUpdatePanel.Update();
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        private void PopupAggiungiEccezione_AggiungiButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.AggiungiEccezioneEventArgs e)
        {
            try
            {
                string err = proxyMtd.InsertDealerImport(e.Codice);

                if (err == "")
                {
                    DealerTable = proxyMtd.GetAllDealerImport();
                    eccImportGridView.DataSource = DealerTable;
                    eccImportGridView.DataBind();
                    importUpdatePanel.Update();

                    PopupAggiungiEccezione.Hide();
                }
                else
                {
                    PopupAggiungiEccezione.setErrorMessage("Codice esistente!");

                }
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        public void showAggiungiPopup()
        {
            PopupAggiungiEccezione.Show();
        }

        protected void btnEliminaImportDealer_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            int gridIndex = gvr.DataItemIndex;
            string codice = eccImportGridView.DataKeys[gvr.DataItemIndex].Value.ToString();

            PopupElimina.Show("Sei sicuro di voler eliminare il Dealer selezionato?", codice, gridIndex);

        }
    }
}