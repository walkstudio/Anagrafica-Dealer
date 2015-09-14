using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{
    public class AggiungiTipoDealerEventArgs : EventArgs
    {
        public AggiungiTipoDealerEventArgs(int IDTipoDealerIN, string NomeTipoDealerIN)
        {
            this.IDTipoDealer = IDTipoDealerIN;
            this.NomeTipoDealer = NomeTipoDealerIN;
        }
        public int IDTipoDealer { get; set; }

        public string NomeTipoDealer { get; set; }
    }

    public delegate void AggiungiTipoDealerEventHandler(object sender, AggiungiTipoDealerEventArgs e);

    public partial class PopupAggiungiTipoDealer : System.Web.UI.UserControl
    {

        private AnagraficaDealerService proxyMtd;
        public event AggiungiTipoDealerEventHandler AggiungiButtonClicked;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                proxyMtd = new AnagraficaDealerService();


            }
        }


        protected void ddlDealer_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlDealer.DataSource = proxyMtd.GetAllTipoDealer();
                ddlDealer.DataValueField = "IDTipoDealer";
                ddlDealer.DataTextField = "NomeTipoDealer";
                ddlDealer.DataBind();
            }
        }

        protected void btnAggiungi_Click(object sender, ImageClickEventArgs e)
        {
            if (AggiungiButtonClicked != null)
            {
                int idTipoDealer = Convert.ToInt32(ddlDealer.SelectedValue);
                string nomeTipoDealer = ddlDealer.SelectedItem.Text;

                AggiungiTipoDealerEventArgs args = new AggiungiTipoDealerEventArgs(idTipoDealer, nomeTipoDealer);

                AggiungiButtonClicked(sender, args);
            }
        }


        private void inizializzaPopup()
        {
            lblErrore.Text = "";
            ddlDealer.Enabled = true;
            ddlDealer.SelectedIndex = 0;

            UpdatePanelPopupAggiungiTipoDealer.Update();
        }

        public void Show()
        {
            inizializzaPopup();
            mpPopupAggiungiTipoDealer.Show();
        }

        public void Hide()
        {
            mpPopupAggiungiTipoDealer.Hide();

        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            mpPopupAggiungiTipoDealer.Hide();
        }

        public void setErrorMessage(string errorMessage)
        {
            lblErrore.Text = errorMessage;
        }

    }
}