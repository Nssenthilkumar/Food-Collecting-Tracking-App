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

public partial class trusthome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            display();
        }
    }
    public void display()
    {
         Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from trust where personname='"+Session["personname"].ToString()+"'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                Session["phoneno"]=dr["phoneno"].ToString();
            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("insert into members values('" + TextBox1.Text + "','" + TextBox2.Text + "','"+DropDownList1.SelectedValue+"','"+DropDownList2.SelectedValue+"','" + TextBox3.Text + "','" + TextBox4.Text + "','"+Session["trustname"].ToString()+"')", con);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Members Added Successfully!!!');</script>");
    updatemem();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("updatemembers.aspx");
    }
    public void updatemem()
    {
      
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from counttrust where trustname='"+Session["trustname"].ToString()+"'", con1);
            int c = Convert.ToInt32(cmd1.ExecuteScalar());
            if (c > 0)
            {

                if(DropDownList2.SelectedValue=="Child")
                {
                display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("update counttrust set noofchild=noofchild+1,totalperson=totalperson+1 where trustname='"+Session["trustname"].ToString()+"' and personname='"+Session["personname"].ToString()+"'", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Updated Successfully!!!');</script>");
                }
                else if(DropDownList2.SelectedValue=="Adult")
                {
               display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("update counttrust set noofadult=noofadult+1,totalperson=totalperson+1 where trustname='"+Session["trustname"].ToString()+"' and personname='"+Session["personname"].ToString()+"'", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Updated Successfully!!!');</script>");
                }
                else if(DropDownList2.SelectedValue=="Old")
                {
                 display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("update counttrust set noofold=noofold+1,totalperson=totalperson+1 where trustname='"+Session["trustname"].ToString()+"' and personname='"+Session["personname"].ToString()+"'", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Updated Successfully!!!');</script>");
                }     
            }
            else
            {
                if(DropDownList2.SelectedValue=="Child")
                {
                display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("insert into counttrust values('" + Session["trustname"].ToString()+ "','" + Session["personname"].ToString() + "','" + Session["phoneno"].ToString() + "','1','0','0','1','"+DateTime.Now.ToString("dd/MM/yyyy")+"')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Saved Successfully!!!');</script>");
                }
                else if(DropDownList2.SelectedValue=="Adult")
                {
                display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("insert into counttrust values('" + Session["trustname"].ToString()+ "','" + Session["personname"].ToString() + "','" + Session["phoneno"].ToString() + "','0','1','0','1','"+DateTime.Now.ToString("dd/MM/yyyy")+"')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Saved Successfully!!!');</script>");
                }
                else if(DropDownList2.SelectedValue=="Old")
                {
                display();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("insert into counttrust values('" + Session["trustname"].ToString()+ "','" + Session["personname"].ToString() + "','" + Session["phoneno"].ToString() + "','0','0','1','1','"+DateTime.Now.ToString("dd/MM/yyyy")+"')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Saved Successfully!!!');</script>");
                }

            }
        }

}
