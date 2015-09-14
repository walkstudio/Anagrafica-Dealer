using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{
    public partial class PopupMessaggio : System.Web.UI.UserControl
    {
        public void ShowMsgBox(string msgbody, Boolean IsError)
        {
            lblPopupMessaggio.Text = msgbody;

            if (IsError)
                lblHeaderPopupMessaggio.Text = "ERRORE";


            else
                lblHeaderPopupMessaggio.Text = "INFO";


            popupMessaggio.Show();
            panelPopupMessaggio.Update();


        }


        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            popupMessaggio.Hide();
            panelPopupMessaggio.Update();
        }
    }
}