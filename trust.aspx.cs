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

public partial class trust : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public static string CreateRandomPassword(int PasswordLength)
    {
        string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string s1 ="123";
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("insert into trust values('" + TextBox1.Text + "','" + TextBox2.Text + "','"+TextBox3.Text+"','"+TextBox4.Text+"','"+TextBox5.Text+"','"+DateTime.Now.ToString("dd/MM/yyyy")+"','"+s1+"','"+DropDownList1.SelectedValue+"')", con);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Trust Register Successfully!!!');</script>");
        //WebClient client = new WebClient();
        //string strmsg = "Trust Login OTP Password is" + s1 ;
        //string baseurl = "http://sms.f9cs.com/sendsms.jsp?user=f9demo&password=demo1234&mobiles=" + TextBox4.Text + "&senderid=FINECS&sms='" + strmsg + "'";
        //Stream data = client.OpenRead(baseurl);
        //StreamReader reader = new StreamReader(data);
        //string s = reader.ReadToEnd();
        //data.Close();
        //reader.Close();
       // ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Register Successfully');</script>");
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
}
