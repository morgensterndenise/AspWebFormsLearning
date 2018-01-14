using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormCombiningTablesInGridView
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnDSUpdatedHandler(Object source, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                // Perform any additional processing, 
                // such as setting a status label after the operation.
                lblUpdate.Text ="Changed information successfully!";
            }
            else
            {
                lblUpdate.Text = "No data updated!";
            }
        }

        protected void gvAuthors_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}