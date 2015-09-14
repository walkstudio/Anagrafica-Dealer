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
    public class ModificheDealerBusinessEventArgs : EventArgs
    {
        public int IDDealerBusiness { get; set; }
        public string Codice { get; set; }
        public string RagioneSociale { get; set; }
        public string Indirizzo { get; set; }

        public ModificheDealerBusinessEventArgs(int idDealerBusinessIN, string CodiceDealerIN, string RagioneSocialeIN, string IndirizzoIN)
        {
            this.IDDealerBusiness = idDealerBusinessIN;
            this.Codice = CodiceDealerIN;
            this.RagioneSociale = RagioneSocialeIN;
            this.Indirizzo = IndirizzoIN;
        }      
    }

    public delegate void ModificheDealerBusinessEventHandler(object sender, ModificheDealerBusinessEventArgs e);

    public partial class PopupModificheDealerBusiness : System.Web.UI.UserControl
    {

          private AnagraficaDealerService proxyMtd;
          public string IDDealerBusiness
          {
              get
              {
                  return IDDealerBusinessHF.Value;
              }
              set
              {
                  IDDealerBusinessHF.Value = value;
              }
          }
          public event ModificheDealerBusinessEventHandler ModificaButtonClicked;

          protected void Page_Load(object sender, EventArgs e)
          {
              if (!IsPostBack)
              {
                  proxyMtd = new AnagraficaDealerService();
              }
          }

          protected void btnModifica_Click(object sender, ImageClickEventArgs e)
          {
              if (ModificaButtonClicked != null)
              {
                  DealerBusiness dealerBusiness = new DealerBusiness();

                  int idDealer = Convert.ToInt32(IDDealerBusiness);
                  string codiceDealer = txtCodiceDealer.Text;
                  string ragioneSociale = txtRagioneSociale.Text;
                  string indirizzo = txtIndirizzo.Text;

                  ModificheDealerBusinessEventArgs args = new ModificheDealerBusinessEventArgs(idDealer, codiceDealer, ragioneSociale, indirizzo);

                  ModificaButtonClicked(sender, args);
              }
          }

          private void inizializzaPopup()
          {
              lblErrore.Text = "";
              txtCodiceDealer.Enabled = false;
              txtRagioneSociale.Enabled = true;
              txtIndirizzo.Enabled = true;
              panelPopupModificheDealerBusiness.Update();
          }

          public void Show(int IDDealerBusiness)
          {
              LoadDealerBusiness(IDDealerBusiness);
              mpPopupModificheDealerBusiness.Show();
          }

          public void Hide()
          {
              
              mpPopupModificheDealerBusiness.Hide();
          }

          protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
          {
              mpPopupModificheDealerBusiness.Hide();
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

          private void LoadDealerBusiness(int IDDealerBusiness)
          {

              AnagraficaDealerService proxyMtd = new AnagraficaDealerService();
              DataTable dt = proxyMtd.GetDealerBusiness(IDDealerBusiness);

              IDDealerBusinessHF.Value = dt.Rows[0]["IDDealerBusiness"].ToString();
              txtCodiceDealer.Text = dt.Rows[0]["Codice"].ToString();
              txtRagioneSociale.Text = dt.Rows[0]["Nome"].ToString();
              txtIndirizzo.Text = dt.Rows[0]["Indirizzo"].ToString();
              
              panelPopupModificheDealerBusiness.Update();
          }       
    }
}