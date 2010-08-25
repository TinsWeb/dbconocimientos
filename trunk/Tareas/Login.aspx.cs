using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tareas.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string AutoFocoLogin = String.Format("<script>document.getElementById('{0}').focus();</script>", loginTareas.ClientID + "_UserName" );
            
            //Page.ClientScript.RegisterStartupScript(Page.GetType(), "AutoFoco", AutoFocoLogin);
            if (!Page.IsPostBack) {
                if (Request.IsAuthenticated && !string.IsNullOrEmpty(Request.QueryString["ReturnUrl"])) {
                    Response.Redirect("~/Account/NoAutorizado.aspx"); 
                }
            };

            RegisterHyperLink.NavigateUrl = "~/Account/Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
