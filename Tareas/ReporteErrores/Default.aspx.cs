using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Principal;

namespace Tareas.ReporteErrores
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridReportes_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            MembershipUser usuario = Membership.GetUser();
            string usuario_asignado;
            if (User.Identity.IsAuthenticated)
            {
                usuario_asignado = usuario.ProviderUserKey.ToString();
            }
            else
            {
                usuario_asignado = null;
            }
            e.NewValues["fk_usuario"] = usuario_asignado;
            e.NewValues["fecha_creacion"] = DateTime.Now;
        }






    }
}