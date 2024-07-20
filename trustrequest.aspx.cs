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
using wastagefood;
public partial class trustrequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bin();
            view();
        }
    }
    public void bin()
    {
        Class1 getcon = new Class1();
        SqlConnection con1 = getcon.connect();
        SqlCommand cmd2 = new SqlCommand("select * from hoteldetails", con1);
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
            SqlCommand cmd1 = new SqlCommand("select * from hoteldetails where id='" + Request.QueryString["id"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = dr["id"].ToString();
                Session["hotelname"] = dr["hotelname"].ToString();
                Session["address"] = dr["address"].ToString();
                Session["hotelphoneno"] = dr["hotelphoneno"].ToString();
                trustdet();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("insert into trustfoodrequest values('" + Session["hotelname"].ToString() + "','" + Session["address"].ToString() + "','" + Session["hotelphoneno"].ToString() + "','" + Session["trustname"].ToString() + "','" + Session["personname"].ToString() + "','" + Session["trustaddress"].ToString() + "','" + Session["trustphoneno"].ToString() + "','"+DateTime.Now.ToString("dd/MM/yyyy")+"','null','request')", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Forward Successfully!!!');</script>");
                
            }
          
        }
    }
    public void trustdet()
    {
        Class1 getcon1 = new Class1();
        SqlConnection con1 = getcon1.connect();
        SqlCommand cmd1 = new SqlCommand("select * from trust where trustname='" + Session["trustname"].ToString() + "'", con1);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            Session["personname"] = dr["personname"].ToString();
            Session["trustaddress"] = dr["address"].ToString();
            Session["trustphoneno"] = dr["phoneno"].ToString();
        }
    }
  
}
