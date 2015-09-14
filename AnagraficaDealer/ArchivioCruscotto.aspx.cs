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
    public partial class ArchivioCruscotto : System.Web.UI.Page
    {
        AnagraficaDealerService proxyAds;

        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || Session["ArchivioCruscotto"].ToString() == "False")
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            proxyAds = new AnagraficaDealerService();

            if (!IsPostBack)
            {
                archivioCruscottoGridView.DataSource = proxyAds.GetAllExport(1);
                archivioCruscottoGridView.DataBind();
            }
            //if (!IsPostBack)
            //{
            //    DataTable table = new DataTable();

            //    DataColumn col1 = new DataColumn("Data");
            //    DataColumn col2 = new DataColumn("File");

            //    col1.DataType = System.Type.GetType("System.String");
            //    col2.DataType = System.Type.GetType("System.String");

            //    table.Columns.Add(col1);
            //    table.Columns.Add(col2);

            //    DataRow row1 = table.NewRow();
            //    row1[col1] = "06/05/2015";
            //    row1[col2] = "ReportAnomalie_06-05-2015.xlsx";
            //    table.Rows.Add(row1);

            //    DataRow row2 = table.NewRow();
            //    row2[col1] = "07/05/2015";
            //    row2[col2] = "ReportAnomalie_07-05-2015.xlsx";
            //    table.Rows.Add(row2);

            //    archivioCruscottoGridView.DataSource = table;
            //    archivioCruscottoGridView.DataBind();
            //}
        }

        protected void archivioCruscottoGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl = (Label)e.Row.FindControl("lblDataAC");
                if (lbl.Text == "")
                {
                    Image downloadBtn = (Image)e.Row.FindControl("imgDownload");
                    downloadBtn.Visible = false;
                }
            }
        }

        protected void archivioCruscottoGridView_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {    //Todo da inserire ID
                DataTable dt = proxyAds.GetProfilo(1);

                Boolean ArchivioCruscotto= Convert.ToBoolean(dt.Rows[0]["ArchivioCruscotto"]);

                if (!ArchivioCruscotto)
                {
                    archivioCruscottoGridView.Columns[0].Visible = false;
                    archivioCruscottoGridView.Columns[1].Visible = false;
                }
            }
        }
    }
}