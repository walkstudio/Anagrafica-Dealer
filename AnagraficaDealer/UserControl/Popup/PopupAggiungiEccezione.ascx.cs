using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{
    public class AggiungiEccezioneEventArgs : EventArgs
    {
        public AggiungiEccezioneEventArgs(string CodiceDealerIN)
        {
            this.Codice = CodiceDealerIN;
        }

        public string Codice { get; set; }
    }

    public delegate void AggiungiEccezioneEventHandler(object sender, AggiungiEccezioneEventArgs e);

    public partial class PopupAggiungiEccezione : System.Web.UI.UserControl
    {

        private AnagraficaDealerService proxyMtd;

        public event AggiungiEccezioneEventHandler AggiungiButtonClicked;

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
                string codiceDealer = codiceDealerTextBox.Text;

                AggiungiEccezioneEventArgs args = new AggiungiEccezioneEventArgs(codiceDealer);

                AggiungiButtonClicked(sender, args);
            }
        }

        private void inizializzaPopup()
        {
            lblErrore.Text = "";
            codiceDealer.Enabled = true;
            panelPopupAggiungiEccezione.Update();
        }

        public void Show()
        {
            InitializeDatiDealer();
            inizializzaPopup();
            mpPopupAggiungiEccezione.Show();
        }

        public void Hide()
        {
            mpPopupAggiungiEccezione.Hide();
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            mpPopupAggiungiEccezione.Hide();
        }

        public void setErrorMessage(string errorMessage)
        {
            lblErrore.Text = errorMessage;
        }

        public void InitializeDatiDealer()
        {
            codiceDealerTextBox.Text = "";
        }
    }
}