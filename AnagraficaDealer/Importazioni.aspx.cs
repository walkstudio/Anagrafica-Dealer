using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AnagraficaDealerClassLib;

namespace Spindox.AnagraficaDealer
{
    public partial class Importazioni : System.Web.UI.Page
    {
        AnagraficaDealerService proxyAds;
        private DataTable ExportTable
        {
            get
            {
                if (ViewState["ExportTable"] == null)
                {
                    DataTable dt = new DataTable();
                    ViewState["ExportTable"] = dt;
                }
                return (DataTable)ViewState["ExportTable"];
            }
            set
            {
                ViewState["ExportTable"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            proxyAds = new AnagraficaDealerService();
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || (Session["ReportScarti"].ToString() == "False" && Session["ReportAnomalie"].ToString() == "False"))
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }

        protected void anomalieGridView_DataBound(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {    //Todo da inserire ID
                DataTable dt = proxyAds.GetProfilo(1);

                Boolean reportAnomalie = Convert.ToBoolean(Session["ReportAnomalie"].ToString());
                Boolean reportScarti = Convert.ToBoolean(Session["ReportScarti"].ToString());


                if (!reportAnomalie)
                {
                    //anomalieGridView.Columns[1].Visible = true;
                    anomalieGridView.Columns[3].Visible = false;
                }
                if (!reportScarti)
                {
                    //anomalieGridView.Columns[2].Visible = true;
                    anomalieGridView.Columns[6].Visible = false;
                }
                if(!reportAnomalie && !reportScarti)
                {
                    //anomalieGridView.Columns[0].Visible = false;
                    //anomalieGridView.Columns[1].Visible = false;
                    //anomalieGridView.Columns[2].Visible = false;
                    anomalieGridView.Columns[3].Visible = false;
                    anomalieGridView.Columns[6].Visible = false;
                    //PopupMessaggio.ShowMsgBox("Profilo non abilitato alla visione dei report.", false);
                }

            }
        }

        protected void anomalieGridView_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                ExportTable = proxyAds.GetAllExport(2);
                anomalieGridView.DataSource = ExportTable;
                anomalieGridView.DataBind();
            }
        }

        protected void anomalieGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            anomalieGridView.PageIndex = e.NewPageIndex;
            anomalieGridView.DataSource = ExportTable;
            anomalieGridView.DataBind();
        }
    }
}