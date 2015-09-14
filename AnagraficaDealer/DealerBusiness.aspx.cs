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
    public partial class DealerBusiness : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;

        private DataTable DealerTableBusiness
        {
            get
            {
                if (ViewState["DealerTableBusiness"] == null)
                {
                    DataTable dt = new DataTable();
                    ViewState["DealerTableBusiness"] = dt;
                }
                return (DataTable)ViewState["DealerTableBusiness"];
            }
            set
            {
                ViewState["DealerTableBusiness"] = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || Session["RagioniSocialiCorrelate"].ToString() == "False")
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopupAggiungiDealerBusiness.AggiungiButtonClicked += new UserControl.RagioniSocialiCorrelate.AggiungiDealerBusinessEventHandler(PopupAggiungiDealerBusiness_AggiungiButtonClicked);
            PopupElimina.EliminaButtonClicked += new UserControl.RagioniSocialiCorrelate.EliminaEventHandler(PopupElimina_EliminaButtonClicked);
            PopupModificheDealerBusiness.ModificaButtonClicked += new UserControl.RagioniSocialiCorrelate.ModificheDealerBusinessEventHandler(PopupModificheDealerBusiness_ModificaButtonClicked);

            proxyMtd = new AnagraficaDealerService();
            if (!IsPostBack)
            {
                DealerTableBusiness = proxyMtd.GetAllDealerBusiness();
                gvDealerBusiness.DataSource = DealerTableBusiness;
                gvDealerBusiness.DataBind();
                gvDealerBusiness.SetPageIndex(0);
            }      
        }

        private void PopupModificheDealerBusiness_ModificaButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.ModificheDealerBusinessEventArgs e)
        {
            try
            {

                AnagraficaDealerClassLib.DealerBusiness dealerBusiness = new AnagraficaDealerClassLib.DealerBusiness();

                dealerBusiness.IDDealerBusiness = Convert.ToInt32(e.IDDealerBusiness);
                dealerBusiness.Indirizzo = e.Indirizzo;
                dealerBusiness.Nome = e.RagioneSociale;
                dealerBusiness.Codice = e.Codice;

                proxyMtd.UpdateDealerBusiness(dealerBusiness);

                DealerTableBusiness = proxyMtd.GetAllDealerBusiness();

                gvDealerBusiness.DataSource = DealerTableBusiness;
                gvDealerBusiness.DataBind();
                dealerBusinessUpdatePanel.Update();

            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
        }
        }

        
        private void PopupElimina_EliminaButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.EliminaEventArgs e)
        {
            try
            {
                int idDealerBus = Convert.ToInt32(e.IDObject);

                proxyMtd.DeleteDealerBusiness(idDealerBus);
                DataRow[] dr = DealerTableBusiness.Select("IDDealerBusiness="+idDealerBus);
                //DealerTableBusiness.Rows.RemoveAt(e.GridIndex);
                DealerTableBusiness.Rows.Remove(dr[0]);
                gvDealerBusiness.DataSource = DealerTableBusiness;
                gvDealerBusiness.DataBind();
                dealerBusinessUpdatePanel.Update();
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }



        protected void PopupAggiungiDealerBusiness_AggiungiButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.AggiungiDealerBusinessEventArgs e)
        {
            try
            {
                bool esiste = proxyMtd.ExistsDealerBusiness(e.Codice);

                if (!esiste)
                {
                    AnagraficaDealerClassLib.DealerBusiness dealerBusiness = new AnagraficaDealerClassLib.DealerBusiness();
                  
                    dealerBusiness.Codice = e.Codice;
                    dealerBusiness.Nome = e.RagioneSociale;
                    dealerBusiness.Indirizzo = e.Indirizzo;

                    proxyMtd.InsertDealerBusiness(dealerBusiness);
                    DealerTableBusiness = proxyMtd.GetAllDealerBusiness();

                    gvDealerBusiness.DataSource = DealerTableBusiness;
                    gvDealerBusiness.DataBind();
                               

                    PopupAggiungiDealerBusiness.Hide();
                    dealerBusinessUpdatePanel.Update();
                  
                }
                
                else
                {
                    PopupAggiungiDealerBusiness.setErrorMessage("Codice esistente!");
                }

            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        public void showAggiungiPopup()
        {
            PopupAggiungiDealerBusiness.Show();
        }

        protected void btnEliminaDealerBusiness_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
         
            int rowIndex;
            if (gvDealerBusiness.AllowPaging)
            {
                rowIndex = gvr.DataItemIndex - (gvDealerBusiness.PageIndex) * gvDealerBusiness.PageSize;
            }
            else
            {
                rowIndex = gvr.DataItemIndex;
            }


            string idDealerBus = gvDealerBusiness.DataKeys[rowIndex].Value.ToString();

            PopupElimina.Show("Sei sicuro di voler eliminare il Dealer?", idDealerBus, rowIndex);
        }

        protected void gvDealerBusiness_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDealerBusiness.SelectedRow;
            int rowIndex;
            if(gvDealerBusiness.AllowPaging){
                rowIndex =row.DataItemIndex- (gvDealerBusiness.PageIndex) * gvDealerBusiness.PageSize ;
            }else{
                rowIndex= row.DataItemIndex;
            }

            int IDDealerBusiness = Convert.ToInt32(gvDealerBusiness.DataKeys[rowIndex].Value);
            PopupModificheDealerBusiness.Show(IDDealerBusiness);
        }

        protected void gvDealerBusiness_RowCreated(object sender, GridViewRowEventArgs e)
        {
           
                if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
                {
                    e.Row.Attributes["style"] = "cursor: pointer;";

                    for (int i = 1; i < e.Row.Cells.Count - 1; i++)
                    {
                        e.Row.Cells[i].Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvDealerBusiness, "Select$" + e.Row.RowIndex);
                    }

                    e.Row.ToolTip = "Clicca per modificare il DealerBusiness.";
                }
           
        }

        protected void gvDealerBusiness_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDealerBusiness.PageIndex = e.NewPageIndex;
            gvDealerBusiness.DataSource = DealerTableBusiness;
            gvDealerBusiness.DataBind();
        }        
    }
}