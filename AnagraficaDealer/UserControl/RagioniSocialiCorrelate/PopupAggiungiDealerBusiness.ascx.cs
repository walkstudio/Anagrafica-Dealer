using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{
    public class AggiungiDealerBusinessEventArgs : EventArgs
    {
        public AggiungiDealerBusinessEventArgs(string CodiceDealerIN,string RagioneSocialeIN,string IndirizzoIN)
        {
      
            this.Codice = CodiceDealerIN;
            this.RagioneSociale = RagioneSocialeIN;
            this.Indirizzo = IndirizzoIN;
        }

            public string Codice { get; set; }
            public string RagioneSociale { get; set; }
            public string Indirizzo { get; set; }
    }

    public delegate void AggiungiDealerBusinessEventHandler(object sender, AggiungiDealerBusinessEventArgs e);

    public partial class PopupAggiungiDealerBusiness : System.Web.UI.UserControl
    {

        private AnagraficaDealerService proxyMtd;

        public event AggiungiDealerBusinessEventHandler AggiungiButtonClicked;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                proxyMtd = new AnagraficaDealerService();
            }
        }

        protected void btnAggiungi_Click(object sender, ImageClickEventArgs e)
        {
            if (AggiungiButtonClicked != null)
            {
                string codiceDealer = txtCodiceDealer.Text;
                string ragioneSociale = txtRagioneSociale.Text;
                string indirizzo = txtIndirizzo.Text;

                AggiungiDealerBusinessEventArgs args = new AggiungiDealerBusinessEventArgs(codiceDealer,ragioneSociale,indirizzo);

                AggiungiButtonClicked(sender, args);
            }
        }

        private void inizializzaPopup()
        {
            lblErrore.Text = "";
            txtCodiceDealer.Enabled = true;
            txtRagioneSociale.Enabled = true;
            txtIndirizzo.Enabled = true;
            panelPopupAggiungiDealerBusiness.Update();
        }

        public void Show()
        {
            InitializeDatiDealer();
            inizializzaPopup();
            mpPopupAggiungiDealerBusiness.Show();
        }

        public void Hide()
        {
            mpPopupAggiungiDealerBusiness.Hide();
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            mpPopupAggiungiDealerBusiness.Hide();
        }

        public void setErrorMessage(string errorMessage)
        {
            lblErrore.Text = errorMessage;
        }

        public void InitializeDatiDealer()
        {
            txtCodiceDealer.Text = "";
            txtRagioneSociale.Text = "";
            txtIndirizzo.Text = "";
        }
    }
}