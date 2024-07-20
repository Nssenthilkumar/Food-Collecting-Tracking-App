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
public partial class publicforward : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bin();
            view();
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from publicdetails where publicphoneno='" + Session["phoneno"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                TextBox11.Text = dr["publicphoneno"].ToString();
            }
        }
    }
    public void bin()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();
        SqlCommand cmd2 = new SqlCommand("select * from counttrust", con1);
        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Not found');</script>");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bin();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
    }
    public void view()
    {
        if (Request.QueryString["id"] != null)
        {
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from counttrust where id='" + Request.QueryString["id"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = dr["id"].ToString();
                TextBox2.Text = dr["trustname"].ToString();
                TextBox3.Text = dr["personname"].ToString();
                TextBox4.Text = dr["phoneno"].ToString();
                TextBox6.Text = dr["totalperson"].ToString();
            }
            trustdet();
        }
    }
    public void trustdet()
    {
         Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from trust where trustname='"+TextBox2.Text+"'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                TextBox5.Text = dr["address"].ToString();
            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        view();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
          Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from publicdetails where publicphoneno='"+TextBox11.Text+"'", con1);
            int a = Convert.ToInt32(cmd1.ExecuteScalar());
            if (a>0)
            {
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("insert into publicfoodrequest values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + DropDownList1.SelectedValue + "','" + TextBox9.Text + "','" + TextBox11.Text + "','send','"+DateTime.Now.ToString("dd/MM/yyyy")+"','null','null','"+TextBox8.Text+"')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Forward Successfully!!!');</script>");
                updateitem();
            }
    }
    public void updateitem()
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("update publicdetails set publicname='"+TextBox7.Text+"',type='"+DropDownList1.SelectedValue+"',organizationself='"+TextBox9.Text+"' where publicphoneno='"+TextBox11.Text+"'", con);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Updated!!');</script>");
              
    }
}
