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
using LeoShi.Soft.OpenSinaAPI;


namespace Oauth4Web
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var httpRequest = HttpRequestFactory.CreateHttpRequest(Method.GET) as HttpGet;
                if (Request["oauth_verifier"] != null)
                {
                    httpRequest.Token = Session["oauth_token"].ToString();
                    httpRequest.TokenSecret = Session["oauth_token_secret"].ToString();
                    httpRequest.Verifier = Request["oauth_verifier"];
                    httpRequest.GetAccessToken();
                    Session["oauth_token"] = httpRequest.Token;
                    Session["oauth_token_secret"] = httpRequest.TokenSecret;
                    Response.Redirect("/Sample.aspx");
                    
                }
                if (Session["oauth_token"]!=null)
                    this.sinaButton.Text = "连接成功";
            }         
        }

        protected void sinaButton_Click(object sender, EventArgs e)
        {
            var httpRequest = HttpRequestFactory.CreateHttpRequest(Method.GET) as HttpGet;
            httpRequest.GetRequestToken();
            string url = httpRequest.GetAuthorizationUrl();
            Session["oauth_token"] = httpRequest.Token;
            Session["oauth_token_secret"] = httpRequest.TokenSecret;
            Response.Redirect(url + "&oauth_callback=http://localhost:3668/Sample.aspx");
        }

        protected void invoke_Click(object sender, EventArgs e)
        {
            var httpRequest = HttpRequestFactory.CreateHttpRequest(Method.GET);
            httpRequest.Token = Session["oauth_token"].ToString();
            httpRequest.TokenSecret = Session["oauth_token_secret"].ToString();
            httpRequest.UserRemoteIP = Request.UserHostAddress;
            string basic = "http://api.t.sina.com.cn/";
            string url = "";
            switch (this.DropDownList.SelectedIndex)
            {
                case 0:
                    url = basic + "statuses/public_timeline.xml";
                    break;
                case 1:
                    url = basic + "statuses/friends_timeline.xml";
                    break;
                case 2:
                    url = basic + "statuses/user_timeline.xml";
                    break;
                case 3:
                    url = basic + "statuses/mentions.xml";
                    break;
                case 4:
                    url = basic + "statuses/comments_timeline.xml";
                    break;
                case 5:
                    url = basic + "statuses/comments_by_me.xml";
                    break;
                case 6:
                    url = basic + "statuses/followers.xml";
                    break;
                default:
                    break;
            }
            this.resultText.Text = httpRequest.Request(url, String.Empty);
        }

        protected void update_Click(object sender, EventArgs e)
        {
            var httpRequest = HttpRequestFactory.CreateHttpRequest(Method.POST);
            httpRequest.Token = Session["oauth_token"].ToString();
            httpRequest.TokenSecret = Session["oauth_token_secret"].ToString();
            httpRequest.UserRemoteIP = Request.UserHostAddress;
            var url = "http://api.t.sina.com.cn/statuses/update.xml?";
            resultTextBox2.Text = httpRequest.Request(url, "status=" + HttpUtility.UrlEncode(statusText.Text));
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            var httpRequest = HttpRequestFactory.CreateHttpRequest(Method.POST) as HttpPost;
            httpRequest.Token = Session["oauth_token"].ToString();
            httpRequest.TokenSecret = Session["oauth_token_secret"].ToString();
            httpRequest.UserRemoteIP = Request.UserHostAddress;
            string url = "http://api.t.sina.com.cn/statuses/upload.xml?";
            this.resultTextBox2.Text = httpRequest.RequestWithPicture(url, "status=" + HttpUtility.UrlEncode(statusText.Text), filepath.Text);
        }
    }
}
