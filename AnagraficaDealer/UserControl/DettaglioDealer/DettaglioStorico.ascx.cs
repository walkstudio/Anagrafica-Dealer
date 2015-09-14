using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Data;

namespace Spindox.AnagraficaDealer.UserControl.DettaglioDealer
{
    public partial class DettaglioStorico : System.Web.UI.UserControl
    {
        private AnagraficaDealerService proxyMtd = new AnagraficaDealerService();

        protected void Page_Load(object sender, EventArgs e)
        {
            int IDDealer = Convert.ToInt32(Session["IDDealer"]);
            DataTable myStorico = proxyMtd.GetStorico(IDDealer, tipologiaDropDownList.SelectedValue);
            storicoGridView.DataSource = myStorico;
            storicoGridView.DataBind();
        }
    }
}