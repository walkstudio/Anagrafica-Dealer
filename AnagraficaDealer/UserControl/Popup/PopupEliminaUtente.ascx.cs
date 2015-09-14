using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AnagraficaDealerClassLib;


namespace Spindox.AnagraficaDealer.UserControl.Popup
{

    public delegate void EliminaUtenteEventHandler(object sender, EventArgs e);

    public partial class PopupEliminaUtente : System.Web.UI.UserControl
    {
        public event EliminaUtenteEventHandler EliminaUtenteButtonClicked;

        public void Show()
        {
            mpPopupEliminaUtente.Show();
        }

        public void Hide()
        {
            mpPopupEliminaUtente.Hide();
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {
            mpPopupEliminaUtente.Hide();
        }

        protected void btnElimina_Click(object sender, ImageClickEventArgs e)
        {
            if (EliminaUtenteButtonClicked != null)
            {

                EliminaUtenteButtonClicked(sender, e);
            }
        }

    }
}