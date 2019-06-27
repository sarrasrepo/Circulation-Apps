using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;


public partial class _Default : System.Web.UI.Page
{

    
    bll_CreateUser bllCreateUser = new bll_CreateUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int i = 0;

            i = bllCreateUser.ValidateUser(txtUserName.Text, txtPassword.Text);

            if (i != 0)
            {                                  
                Session["IsLoggedIn"] = "yes";
                Session["UserName"] = this.txtUserName.Text;
                Response.Redirect("Home.aspx");
            }

            else
            {
               // divError.Visible = true;

            }
        }
    }

    
}