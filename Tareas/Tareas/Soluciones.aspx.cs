﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

namespace Tareas.Tareas
{
    public partial class Soluciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridSeguimientos_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["TareaID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}