using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl
{
    public partial class GestioneDealerBusinessSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAggiungiImageButton_Click(object sender, ImageClickEventArgs e)
        {
            DealerBusiness cr = (DealerBusiness)Parent.Page;
            cr.showAggiungiPopup();
        }
    }
}