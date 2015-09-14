using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;
using System.Xml.Linq;

namespace AnagraficaDealerClassLib.Methods
{
   internal class ExportMng
    {
       private SqlOperations sqlop;

        internal DataTable GetAllExport(int fileType)
        {

            sqlop = new SqlOperations();
            sqlop.databaseConnection = ConfigurationManager.ConnectionStrings["cs"].ToString();
            DbParameter[] dbp = new DbParameter[1];

            dbp[0] = new SqlParameter();
            dbp[0].ParameterName = "FileType";
            dbp[0].DbType = DbType.Int32;
            dbp[0].Direction = ParameterDirection.Input;
            dbp[0].Value = fileType;

            SqlCommandObject sco = new SqlCommandObject();
            sco.SPName = "Export.ExportedFiles_Get";
            sco.SPParams = dbp;

            DataTable dt;
            string proc = sqlop.ExecuteProcedure(sco, out dt);

            return dt;
        }
    }
}
