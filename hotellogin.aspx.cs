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
public partial class hotellogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Class1 getcon1 = new Class1();
        SqlConnection con1 = getcon1.connect();
        SqlCommand cmd1 = new SqlCommand("select * from hoteldetails where hotelphoneno='" + TextBox1.Text + "'", con1);
        int c = Convert.ToInt32(cmd1.ExecuteScalar());
        if (c > 0)
        {
            Session["phoneno"] = TextBox1.Text;
            Response.Redirect("hotelloginotp.aspx?phoneno=" + Session["phoneno"].ToString());

        }
        else
        {
            string s1 = CreateRandomPassword(6);
            Class1 getcon = new Class1();
            SqlConnection con = getcon.connect();
            SqlCommand cmd = new SqlCommand("insert into hoteldetails values('" + TextBox1.Text + "','" + s1 + "','null','null','null','" + DateTime.Now.ToString("dd/MM/yyyy") + "')", con);
            cmd.ExecuteNonQuery();
           // ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('OTP Send Successfully!!!Check Ur Mobile');</script>");
           //WebClient client = new WebClient();
           // string strmsg = "Hotel Password OTP is" + s1;
           //string baseurl = "http://sms.f9cs.com/sendsms.jsp?user=f9demo&password=demo1234&mobiles=" + TextBox1.Text + "&senderid=FINECS&sms='" + strmsg + "'";
           // Stream data = client.OpenRead(baseurl);
           // StreamReader reader = new StreamReader(data);
           // string s = reader.ReadToEnd();
           // data.Close();
           // reader.Close();
            
            //ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('SMS Send Successfully');</script>");
          
            Session["phoneno"] = TextBox1.Text;
            Response.Redirect("hotelloginotp.aspx?phoneno=" + Session["phoneno"].ToString());
        }

    }
}
