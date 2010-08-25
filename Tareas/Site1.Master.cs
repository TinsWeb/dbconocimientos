using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tareas
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private int childNode = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuContent.Controls.Add(new LiteralControl("<ul class='art-menu'>"));
            foreach (SiteMapNode nodo in SiteMap.RootNode.ChildNodes) 
            { 
                //MenuContent.Controls.Add(new LiteralControl("<ul>"));

                MenuContent.Controls.Add(new LiteralControl("<li><a href='" + nodo.Url.ToString() + "'> \n <span class='l'></span><span class='r'>kk</span><span class='t'>" + nodo.Title.ToString() + "</span> </a> \n "));

                foreach (SiteMapNode ChildNode in nodo.ChildNodes)
                {
                    if ((ChildNode.Url.Length > 0) && (ChildNode.Title.Length > 0))
                    {
                        if (childNode == 1)
                        {
                            MenuContent.Controls.Add(new LiteralControl("<ul> \n"));
                            childNode = 2;
                        }

                        if (ChildNode.Title.ToString() == SiteMap.CurrentNode.Title.ToString())
                        {
                            MenuContent.Controls.Add(new LiteralControl("<li> \n <a href='" + ChildNode.Url.ToString() + "' title='" + ChildNode.Description.ToString() + "'><span class='l'></span><span class='r'></span><span class='t'>" + ChildNode.Title.ToString() + "</span></a> \n </li> \n"));
                        }
                        else
                        {
                            MenuContent.Controls.Add(new LiteralControl("<li> \n <a href='" + ChildNode.Url.ToString() + "' title='" + ChildNode.Description.ToString() + "'><span class='l'></span><span class='r'></span><span class='t'>" + ChildNode.Title.ToString() + "</span></a> \n </li> \n"));
                        }


                    }
                }

                
                if (childNode == 2)
                {
                    MenuContent.Controls.Add(new LiteralControl("</ul> \n"));
                    childNode = 1;
                }

                MenuContent.Controls.Add(new LiteralControl("</li> \n"));
                //MenuContent.Controls.Add(new LiteralControl("</ul>"));
            }

            MenuContent.Controls.Add(new LiteralControl("</ul> \n"));


            
        }
    }
}