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
    public partial class DettaglioRelazioni : System.Web.UI.UserControl
    {


        public void Show(int IDRelazione, int idTipoDealer)
        {
            LoadDettaglio(IDRelazione, idTipoDealer);           
            mpPopupDettaglioRelazioni.Show();
        }

        public void Hide()
        {
            inizializzaDati();
            mpPopupDettaglioRelazioni.Hide();
        }

        private void LoadDettaglio(int IDRelazione, int tipoDealer)
        {
            

            AnagraficaDealerService proxyADS = new AnagraficaDealerService();
            DataTable dt = proxyADS.GetDettaglioRelazione(IDRelazione, tipoDealer);


            lblCodiceDealer.Text = dt.Rows[0]["CodiceDealerConsumer"].ToString();
            lblNome.Text = dt.Rows[0]["RagioneSocialeDealerConsumer"].ToString();
            lblIndirizzo.Text = dt.Rows[0]["IndirizzoDealerConsumer"].ToString();
            lblCanale.Text = dt.Rows[0]["CanaleDealerConsumer"].ToString();
            lblStato.Text = dt.Rows[0]["StatoDealerConsumer"].ToString();



            lblCodiceRelativo.Text = dt.Rows[0]["CodiceDealer"].ToString();
            lblCanaleRelativo.Text = dt.Rows[0]["CanaleDealer"].ToString();
            lblIndirizzoRelativo.Text = dt.Rows[0]["IndirizzoDealer"].ToString();
            lblNomeRelativo.Text = dt.Rows[0]["RagioneSocialeDealer"].ToString();
            lblStatoRelativo.Text = dt.Rows[0]["StatoDealer"].ToString();
            
            //panelPopupDettaglioRelazioni.Update();

        }

        private void inizializzaDati()
        {
            lblCodiceDealer.Text = "";
            lblCodiceRelativo.Text = "";
            lblCanale.Text = "";
            lblCanaleRelativo.Text = "";
            lblIndirizzo.Text = "";
            lblIndirizzoRelativo.Text = "";
            lblNome.Text = "";
            lblNomeRelativo.Text = "";
            lblStato.Text = "";
            lblStatoRelativo.Text = "";

            //panelPopupDettaglioRelazioni.Update();
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            mpPopupDettaglioRelazioni.Hide();
        }
    }
}