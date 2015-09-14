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
    public partial class RicercaRelazioni : System.Web.UI.Page
    {
        AnagraficaDealerService proxyADS;

        public DataTable RelazioniResults
        {
            get
            {
                if (Session["RelazioniResults"] == null)
                {
                    DataTable dt = new DataTable();
                    Session["RelazioniResults"] = dt;
                }
                return (DataTable)Session["RelazioniResults"];
            }
            set
            {
                Session["RelazioniResults"] = value;
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
            PopupElimina.EliminaButtonClicked += new UserControl.RagioniSocialiCorrelate.EliminaEventHandler(PopupElimina_EliminaButtonClicked);
            Page.ClientScript.GetPostBackEventReference(gvRelazioni, "");
            proxyADS = new AnagraficaDealerService();
            if (!IsPostBack)
            {
                RelazioniResults = null;
            }
        }

        private void PopupElimina_EliminaButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.EliminaEventArgs e)
        {
            try
            {

                int IDRelazione = Convert.ToInt32(e.IDObject);
                int IDTipoDealer = Convert.ToInt32(((Label)gvRelazioni.Rows[e.GridIndex].FindControl("IDTipoDealer")).Text);

                string error = proxyADS.DeleteRelazione(IDRelazione, IDTipoDealer);

                if (error != "")
                {
                    throw new Exception(error);
                }

                DataRow[] dr = RelazioniResults.Select("IDRelazione="+IDRelazione);

                //RelazioniResults.Rows.RemoveAt(e.GridIndex);
                RelazioniResults.Rows.Remove(dr[0]);
                gvRelazioni.DataSource = RelazioniResults;
                gvRelazioni.DataBind();

                relazioniUpdatePanel.Update();
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        protected void btnEliminaRelazione_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton) sender;
            GridViewRow gvr = (GridViewRow) btn.NamingContainer;

            int rowIndex;
            if (gvRelazioni.AllowPaging)
            {
                rowIndex = gvr.DataItemIndex - (gvRelazioni.PageIndex) * gvRelazioni.PageSize;
            }
            else
            {
                rowIndex = gvr.DataItemIndex;
            }

            string idRelazione = gvRelazioni.DataKeys[rowIndex].Value.ToString();




            PopupElimina.Show("Sei sicuro di voler eliminare la relazione?", idRelazione, rowIndex);
        }

        
       

        protected void btnRicercaRelazioni_Click(object sender, ImageClickEventArgs e)
        {
            RelazioniResults = null;

            string codiceDealer = txtCodiceDealer.Text.Trim();
            string ragioneSociale = txtRagioneSociale.Text.Trim();
            string relazione = txtRelazione.Text.Trim();
            int idTipoDealer = Convert.ToInt32(ddlTipoDealer.SelectedValue);

            RelazioniResults = proxyADS.SearchRelazioni(idTipoDealer, codiceDealer, ragioneSociale, relazione);
            gvRelazioni.DataSource = RelazioniResults;
            gvRelazioni.DataBind();

            lblNumeroRelazioni.Text = gvRelazioni.Rows.Count.ToString();
        }

        private void inizializzaRichercaRelazioni()
        {
            lblNumeroRelazioni.Text = "";
            lblRicercaRisultati1.Text = "";
            lblRicercaRisultati2.Text = "";

            RelazioniResults = null;

        }


        protected void gvRelazioni_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow row = gvRelazioni.SelectedRow;
            int rowIndex;
            if (gvRelazioni.AllowPaging)
            {
                rowIndex = row.DataItemIndex - (gvRelazioni.PageIndex) * gvRelazioni.PageSize;
            }
            else
            {
                rowIndex = row.DataItemIndex;
            }

            int IDRelazione = Convert.ToInt32(gvRelazioni.DataKeys[rowIndex].Value);
            int IDTipoDealer = Convert.ToInt32(((Label)gvRelazioni.Rows[rowIndex].FindControl("IDTipoDealer")).Text);

            DettaglioRelazioni.Show(IDRelazione, IDTipoDealer);
        }

        protected void gvRelazioni_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                e.Row.Attributes["style"] = "cursor: pointer;";

                for (int i = 1; i < e.Row.Cells.Count - 1; i++)
                {
                    e.Row.Cells[i].Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvRelazioni, "Select$" + e.Row.RowIndex);
                    e.Row.Attributes["onmouseover"] = string.Format("RowMouseOver({0});", e.Row.RowIndex);
                    e.Row.Attributes["onmouseout"] = string.Format("RowMouseOut({0});", e.Row.RowIndex);
                }

                e.Row.ToolTip = "Clicca per aprire il dettaglio.";
            }
        }

        protected void gvRelazioni_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRelazioni.PageIndex = e.NewPageIndex;
            gvRelazioni.DataSource = RelazioniResults;
            gvRelazioni.DataBind();
        }

        protected void gvRelazioni_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return; 
            e.Row.Attributes["onmouseover"] = string.Format("RowMouseOver({0});", e.Row.RowIndex);
            e.Row.Attributes["onmouseout"] = string.Format("RowMouseOut({0});", e.Row.RowIndex);
           
        }



    }
}