using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Data;

namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{
    public class AggiungiRelazioneDealerEventArgs : EventArgs
    {
        public AggiungiRelazioneDealerEventArgs(int tipoRicercaIN, int IDDealerIN, string CodiceDealerIN, string RagioneSocialeIN)
        {
            this.TipoRicerca = tipoRicercaIN;
            this.IDDealer = IDDealerIN;
            this.CodiceDealer = CodiceDealerIN;
            this.RagioneSociale = RagioneSocialeIN;
        }
        public int TipoRicerca { get; set; }

        public int IDDealer { get; set; }

        public string CodiceDealer { get; set; }

        public string RagioneSociale { get; set; }
    }

    public delegate void AggiungiRelazioneDealerEventHandler(object sender, AggiungiRelazioneDealerEventArgs e);

    public partial class PopupAggiungiRelazioneDealer : System.Web.UI.UserControl
    {

        private AnagraficaDealerService proxyMtd;
        public event AggiungiRelazioneDealerEventHandler AggiungiButtonClicked;
        public int TipoRicerca
        {
            get
            {
                int tipoRicerca;
                bool parsed = Int32.TryParse(TipoRicercaHF.Value, out tipoRicerca);

                if (parsed)
                    return tipoRicerca;
                else
                    throw new Exception("Error: The passed parameter is not an integer.");
            }
            set
            {
                TipoRicercaHF.Value = value.ToString();
            }
        }
        public DataTable AggiungiRelazione
        {
            get
            {
                if (Session["AggiungiRelazione"] == null)
                {
                    DataTable dt = new DataTable();
                    Session["AggiungiRelazione"] = dt;
                }
                return (DataTable)Session["AggiungiRelazione"];
            }
            set
            {
                Session["AggiungiRelazione"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                proxyMtd = new AnagraficaDealerService();
            }
        }

        private void inizializzaPopup()
        {
            lblErrore.Text = "";           
            Session.Remove("AggiungiRelazione");
        }

        public void Show(int tipoRicercaIN, DataTable dtIN)
        {
            inizializzaPopup();
            AggiungiRelazione = dtIN;
        
            relazioneGV.DataSource = dtIN;
            relazioneGV.DataBind();
            relazioneGV.SetPageIndex(0);
            TipoRicerca = tipoRicercaIN;

            mpPopupAggiungiRelazioneDealer.Show();
            panelPopupAggiungiRelazioneDealer.Update();      
        }

        public void Hide()
        {
            mpPopupAggiungiRelazioneDealer.Hide();                  
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            Hide();
        }

        public void setErrorMessage(string errorMessage)
        {
            lblErrore.Text = errorMessage;
        }

        protected void btnAggiungiRel_Click(object sender, ImageClickEventArgs e)
        {
                if (AggiungiButtonClicked != null)
                {
                    ImageButton btn = (ImageButton)sender;
                    GridViewRow row = (GridViewRow)btn.NamingContainer;

                    int rowIndex;
                    if (relazioneGV.AllowPaging)
                    {
                        rowIndex = row.DataItemIndex - (relazioneGV.PageIndex) * relazioneGV.PageSize;
                    }
                    else
                    {
                        rowIndex = row.DataItemIndex;
                    }

                    int idDealer = Convert.ToInt32(relazioneGV.DataKeys[rowIndex].Value);
                    string codiceDealer = ((Label)row.FindControl("codiceDealer")).Text;
                    string ragioneSociale = ((Label)row.FindControl("ragioneSocialeDealer")).Text;

                    AggiungiRelazioneDealerEventArgs args = new AggiungiRelazioneDealerEventArgs(TipoRicerca, idDealer, codiceDealer, ragioneSociale);

                    AggiungiButtonClicked(sender, args);

                    Hide();
                }
        }
        
        protected void relazioneGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            relazioneGV.PageIndex = e.NewPageIndex;
            relazioneGV.DataSource = AggiungiRelazione;
            relazioneGV.DataBind();                     
        }      
    }
}