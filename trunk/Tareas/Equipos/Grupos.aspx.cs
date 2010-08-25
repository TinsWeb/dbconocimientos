using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

namespace Tareas.Equipos
{
    public partial class Grupos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridEquipos_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["GrupoID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }


    }
}