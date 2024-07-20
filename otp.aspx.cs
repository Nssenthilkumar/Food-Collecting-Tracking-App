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
public partial class otp : System.Web.UI.Page
{
    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["phoneno"].ToString() != null)
            {
                string s1 = CreateRandomPassword(5);
                Session["otp"] = s1;
                MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(Request.QueryString["phoneno"].ToString()));
                msg.Subject = "Your Login Otp";
                msg.IsBodyHtml = true;
                msg.Body = "Public Login OTP is " + s1;
                //  msg.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, aa));
                System.Net.NetworkCredential nwcred = new System.Net.NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
                SmtpClient smclient = new SmtpClient();
                smclient.EnableSsl = true;
                smclient.UseDefaultCredentials = false;
                smclient.Credentials = nwcred;
                smclient.Host = "smtp.gmail.com";
                smclient.Port = 587;
                smclient.Send(msg);
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Mail Send Successfully');</script>");

            }
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text == Session["otp"].ToString())
        {
            Response.Redirect("publichome.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid User')</script>");
        }
        //Class1 getcon = new Class1();
        //SqlConnection con = getcon.connect();
        //SqlCommand cmd = new SqlCommand("select * from publicdetails where publicphoneno='" + Session["publicphoneno"].ToString() + "' and onetimepass='" + TextBox1.Text + "'", con);
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    Session["phoneno"] = dr["publicphoneno"].ToString();
        //    // TextBox2.Text = dr["password"].ToString();
        //    Response.Redirect("publichome.aspx");
        //}
        //else
        //{
        //    Response.Write("<script>alert('Invalid User')</script>");
        //}
    }
}
