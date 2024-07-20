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
using System.Net.Mail;
public partial class trustviewhotelrequest1 : System.Web.UI.Page
{

 SqlDataAdapter dadapter;
    DataSet dset;
    DataSet DS = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id1"].ToString() != "")
        {
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from hotelfoodrequest where id='" + Request.QueryString["id1"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                TextBox7.Text = dr["hotelname"].ToString();
                TextBox9.Text = dr["hoteladdress"].ToString();
                TextBox11.Text = dr["hotelphoneno"].ToString();
                Session["phoneno"] = dr["hotelphoneno"].ToString();
            }

        }
        display();
    }
    public void display()
    {
        
        if (!IsPostBack)
        {

            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            string sql1 = "select distinct hotelname from hotelfoodrequest";

            if (!this.IsPostBack)
            {
                dadapter = new SqlDataAdapter(sql1, con1);
                dset = new DataSet();
                dadapter.Fill(dset);
                DropDownList2.DataSource = dset.Tables[0];
                DropDownList2.DataTextField = "hotelname";
                DropDownList2.DataValueField = "hotelname";
                DropDownList2.DataBind();
            }
            DropDownList2.Items.Add("Select");
            DropDownList2.Items.FindByValue("Select").Selected = true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("update hotelfoodrequest set forwarddate='" + DateTime.Now.ToString("dd/MM/yyyy") + "',status='Accept',anothertrust='Nil' where id='" + Session["id"].ToString() + "'", con);
        cmd.ExecuteNonQuery();
        MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(Session["phoneno"].ToString()));
        msg.Subject = "Status Of Request";
        msg.IsBodyHtml = true;
        msg.Body = "Your Food Request Is Accepted...Thank Your";
        //  msg.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, aa));
        System.Net.NetworkCredential nwcred = new System.Net.NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
        SmtpClient smclient = new SmtpClient();
        smclient.EnableSsl = true;
        smclient.UseDefaultCredentials = false;
        smclient.Credentials = nwcred;
        smclient.Host = "smtp.gmail.com";
        smclient.Port = 587;
        smclient.Send(msg);
              
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Accepted!!');</script>");
            
    }
}
