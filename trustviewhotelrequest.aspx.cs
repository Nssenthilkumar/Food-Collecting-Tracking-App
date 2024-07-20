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

public partial class trustviewhotelrequest : System.Web.UI.Page
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
        SqlCommand cmd2 = new SqlCommand("select * from hotelfoodrequest where trustname='" + Session["trustname"].ToString() + "' and status='send'", con1);
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
            SqlCommand cmd1 = new SqlCommand("select * from hotelfoodrequest where id='" + Request.QueryString["id"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = dr["id"].ToString();
                Session["phoneno"] = dr["hotelphoneno"].ToString();
                Class1 getcon = new Class1();
                SqlConnection con = getcon.connect();
                SqlCommand cmd = new SqlCommand("update hotelfoodrequest set forwarddate='" + DateTime.Now.ToString("dd/MM/yyyy") + "',status='Accept',anothertrust='Nil',trustpersonname='Nil' where id='" + Session["id"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Accepted!!');</script>");
              
            }
        }
    }
}
