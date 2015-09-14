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
    public partial class CreaRelazioni : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyADS;

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
            PopupAggiungiRelazioneDealer.AggiungiButtonClicked += new UserControl.RagioniSocialiCorrelate.AggiungiRelazioneDealerEventHandler(PopupAggiungiRelazioneDealer_AggiungiButtonClicked);
            proxyADS = new AnagraficaDealerService();
            if (!IsPostBack)
            {
               
            }          
        }

        private void PopupAggiungiRelazioneDealer_AggiungiButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.AggiungiRelazioneDealerEventArgs e)
        {
            if (e.TipoRicerca == 1)
            {

                IDDealerScelto1HF.Value = e.IDDealer.ToString();
                TBCodiceDealer1.Text = e.CodiceDealer;
                TBRagioneSociale1.Text = e.RagioneSociale;

                ddlTipoDealer1.Enabled = false;

               
                    TBCodiceDealer1.Enabled = false;
                    TBRagioneSociale1.Enabled = false;
                    RBCodiceDealer1.Enabled = false;
                    RBRagioneSociale1.Enabled = false;
                    btnCD1.Enabled = false;
                    btnRS1.Enabled = false;
            }
            else if (e.TipoRicerca == 2)
            {
               
                    IDDealerScelto2HF.Value = e.IDDealer.ToString();
                    TBCodiceDealer2.Text = e.CodiceDealer;
                    TBRagioneSociale2.Text = e.RagioneSociale;     
              
                    ddlTipoDealer2.Enabled = false;            
                    TBCodiceDealer2.Enabled = false;
                    RBRagioneSociale2.Enabled = false;
                    RBCodiceDealer2.Enabled = false;
                    TBRagioneSociale2.Enabled = false;
                    btnCD2.Enabled = false;
                    btnRS2.Enabled = false;
                       
            }
            PopupAggiungiRelazioneDealer.Hide();
            creaRelUpdatePanel.Update();
        }


        
        protected void SalvaRSButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Relazioni rel = new Relazioni();
                rel.NomeRelazione = txtNomeRelazione.Text;
                rel.IDDealerConsumer = Convert.ToInt32(IDDealerScelto1HF.Value);
                rel.IDDealer = Convert.ToInt32(IDDealerScelto2HF.Value);
                rel.IDTipoDealer = Convert.ToInt32(ddlTipoDealer2.SelectedValue);

                if ((rel.IDDealerConsumer != rel.IDDealer) || (rel.IDTipoDealer == 2))
                {
                    string err = proxyADS.InserRelazioneDealer(rel);
                    if (err == "")
                    {
                        PopupMessaggio.ShowMsgBox("Relazione creata correttamente.", false);
                        inizializzaPagina();
                    }
                    else
                    {
                        if (err.Contains("IX_RelazioneConsumer") || err.Contains("IX_RelazioneBusiness"))
                        {
                            throw new Exception("Relazione esistente.");
                        }
                        else
                        {
                            throw new Exception("Relazione non creata correttamente.");
                        }
                    }
                }
                else
                {
                    throw new Exception("Relazione non creata correttamente.");
                }
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
            
            finally
            {
                resetDealer1();
                resetDealer2();
            }
        }


        protected void btnCercaDealer1_Click(object sender, ImageClickEventArgs e)
        {
            int tipoRicerca = 1;
            DataTable dt = new DataTable();
            int idTipoDealer = Convert.ToInt32(ddlTipoDealer1.SelectedValue);

            dt = proxyADS.GetAllDealerRelazioni(TBCodiceDealer1.Text, TBRagioneSociale1.Text, idTipoDealer);

            PopupAggiungiRelazioneDealer.Show(tipoRicerca,dt);
            creaRelUpdatePanel.Update();
        }

        protected void btnResetDealer1_Click(object sender, ImageClickEventArgs e)
        {
            resetDealer1();
        }

        protected void btnCercaDealer2_Click(object sender, ImageClickEventArgs e)
        {
            int tipoRicerca = 2;
            DataTable dt = new DataTable();
            int idTipoDealer = Convert.ToInt32(ddlTipoDealer2.SelectedValue);

            dt = proxyADS.GetAllDealerRelazioni(TBCodiceDealer2.Text, TBRagioneSociale2.Text, idTipoDealer);

            PopupAggiungiRelazioneDealer.Show(tipoRicerca,dt);
            creaRelUpdatePanel.Update();
        }

        protected void btnResetDealer2_Click(object sender, ImageClickEventArgs e)
        {
            resetDealer2();

        }

        private void resetDealer1()
        {
            ddlTipoDealer1.Enabled = false;
            ddlTipoDealer1.SelectedIndex = 0;
            RBCodiceDealer1.Enabled = true;
            RBCodiceDealer1.Checked = true;
            TBCodiceDealer1.Enabled = true;
            TBCodiceDealer1.Text = "";
            RBRagioneSociale1.Checked = false;
            RBRagioneSociale1.Enabled = true;
            TBRagioneSociale1.Enabled = false;
            TBRagioneSociale1.Text = "";
            btnCD1.Visible = true;
            btnRS1.Visible = false;
            TBDealerScelto1.Text = "";
            TBDealerScelto1.Visible = false;
            IDDealerScelto1HF.Value = "";
            btnRS1.Enabled = true;
            btnCD1.Enabled = true;
            creaRelUpdatePanel.Update();
           
        }

        private void resetDealer2()
        {
            ddlTipoDealer2.Enabled = true;
            ddlTipoDealer2.SelectedIndex = 0;
            RBCodiceDealer2.Enabled = true;
            RBCodiceDealer2.Checked = true;
            TBCodiceDealer2.Enabled = true;
            TBCodiceDealer2.Text = "";
            RBRagioneSociale2.Checked = false;
            RBRagioneSociale2.Enabled = true;
            TBRagioneSociale2.Enabled = false;
            TBRagioneSociale2.Text = "";
            TBDealerScelto2.Text = "";
            btnCD2.Visible = true;
            btnRS2.Visible = false;
            IDDealerScelto2HF.Value = "";
            TBDealerScelto2.Visible = false;
            btnRS2.Enabled = true;
            btnCD2.Enabled = true;
            creaRelUpdatePanel.Update();
        }

        private void inizializzaPagina()
        {
            txtNomeRelazione.Text = "";
            resetDealer1();
            resetDealer2();
        }

        protected void radioBtnDCCD_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton) sender;
            enableRadioButtonField(rb.Checked, TBCodiceDealer1, TBRagioneSociale1, btnCD1, btnRS1);
        }

        protected void radioBtnDCRS_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            enableRadioButtonField(rb.Checked, TBRagioneSociale1, TBCodiceDealer1, btnRS1, btnCD1);
        }

        protected void radioBtnDCD_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            enableRadioButtonField(rb.Checked, TBCodiceDealer2, TBRagioneSociale2, btnCD2, btnRS2);
        }

        protected void radioBtnDRS_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            enableRadioButtonField(rb.Checked, TBRagioneSociale2, TBCodiceDealer2, btnRS2, btnCD2);
        }

        private void enableRadioButtonField(bool rbChecked, TextBox txtEnabled, TextBox txtDisabled, ImageButton btnVisible, ImageButton btnInvisible)
        {
            if (rbChecked)
            {
                txtEnabled.Enabled = true;
                txtDisabled.Enabled = false;
                btnVisible.Visible = true;
                btnInvisible.Visible = false;
                txtDisabled.Text = "";
            }
        }

    }
}