using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Spindox.AnagraficaDealer
{
    public partial class ReportAnomalie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = new DataTable();

                DataColumn col1 = new DataColumn("Data");
                DataColumn col2 = new DataColumn("File");

                col1.DataType = System.Type.GetType("System.String");
                col2.DataType = System.Type.GetType("System.String");

                table.Columns.Add(col1);
                table.Columns.Add(col2);

                DataRow row1 = table.NewRow();
                row1[col1] = "06/05/2015";
                row1[col2] = "ReportAnomalie_06-05-2015.xlsx";
                table.Rows.Add(row1);

                DataRow row2 = table.NewRow();
                row2[col1] = "07/05/2015";
                row2[col2] = "ReportAnomalie_07-05-2015.xlsx";
                table.Rows.Add(row2);

                anomalieGridView.DataSource = table;
                anomalieGridView.DataBind();
            }
        }
    }
}