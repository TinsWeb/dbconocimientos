using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace Tareas
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {

                DevExpress.Web.ASPxMenu.MenuItem menuitem = new DevExpress.Web.ASPxMenu.MenuItem("Cerrar Sesión", "logout", "", "~/Account/Logout.aspx");

                //mnuTareas.Items[0].Items.Add(menuitem);
                //mnuTareas.Visible = true;
            }
            else {
                mnuTareas.Visible = false;
            }
            
        }
        
    }
}
