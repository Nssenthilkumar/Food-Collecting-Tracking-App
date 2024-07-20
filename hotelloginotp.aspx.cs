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
using System.Net;
using System.Net.Mime;
using System.IO;

using System.Net.Mail;
public partial class hotelloginotp : System.Web.UI.Page
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
                string s2 = CreateRandomPassword(5);
                Session["otp2"] = s2;
                MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(Request.QueryString["phoneno"].ToString()));
                msg.Subject = "Your Login Otp";
                msg.IsBodyHtml = true;
                msg.Body = "Hotel Password OTP is" + s2;
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

        if (TextBox1.Text == Session["otp2"].ToString())
        {
            Response.Redirect("hotelhome.aspx");
        }
        //Class1 getcon = new Class1();
        //SqlConnection con = getcon.connect();
        //SqlCommand cmd = new SqlCommand("select * from hoteldetails where hotelphoneno='" + Session["hotelphoneno"].ToString() + "' and onetimepass='" + TextBox1.Text + "'", con);
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    Session["phoneno"] = dr["hotelphoneno"].ToString();
        //    // TextBox2.Text = dr["password"].ToString();
        //    Response.Redirect("hotelhome.aspx");
        //}
        else
        {
            Response.Write("<script>alert('Invalid User')</script>");
        }
    }
}
