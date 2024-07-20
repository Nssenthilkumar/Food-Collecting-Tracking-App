using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class hotellogin1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    { 
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from hoteldetails where hotelphoneno='" + TextBox1.Text + "' and onetimepass='" + TextBox2.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["phoneno"] = TextBox1.Text;
            TextBox2.Text = dr["onetimepass"].ToString();
            Response.Redirect("hotelhome.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid User')</script>");
        }
    }
}
