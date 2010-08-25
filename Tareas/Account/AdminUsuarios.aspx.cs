using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace AppBase.Admin
{
    public partial class AdminUsuarios : System.Web.UI.Page
    {
        private string UsernameToMatch
        {
            get
            {
                object o = ViewState["UsernameToMatch"];
                if (o == null)
                    return string.Empty;
                else
                    return (string)o;
            }
            set
            {
                ViewState["UsernameToMatch"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindUserAccounts();
                BindFilteringUI();
            }
        }

        private void BindUserAccounts()
        {
            UserAccounts.DataSource = Membership.FindUsersByName(this.UsernameToMatch + "%");
            UserAccounts.DataBind();
        }

        private void BindFilteringUI()
        {
            string[] filterOptions = { "All", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
            FilteringUI.DataSource = filterOptions;
            FilteringUI.DataBind();
        }

        protected void FilteringUI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "All")
            {
                this.UsernameToMatch = string.Empty;
            }
            else
            {
                this.UsernameToMatch = e.CommandName;
            }
            BindUserAccounts();
        }
    }
}