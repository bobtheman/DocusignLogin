using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;

namespace DocusignLogin
{
    public partial class Default : System.Web.UI.Page
    {
        public const string IntegratorKey = "YourIntegratorKey";
        public const string PostmanKey = "YourPostmanKey";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnproceed_Click(object sender, EventArgs e)
        {
            string username = txtemail.Text.Trim();
            string password = txtpassword.Text.Trim();
            var client = new RestClient("https://www.docusign.net/restapi/v2/login_information?api_password=true");
            var request = new RestRequest(Method.GET);
            //PostMan Key//
            //This is primarily used to bypass a bug in Chrome. If an XMLHttpRequest is pending and another request is sent with the//
            //same parameters then Chrome returns the same response for both of them. Sending a random token avoids this issue.//
            //This can also help you distinguish between request on the server side.//
            request.AddHeader("postman-token", PostmanKey); 
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/json");
            request.AddHeader("x-docusign-authentication", "{\"Username\":\"" + username  + "\",\"Password\":\"" + password + "\",\"IntegratorKey\": \"" + IntegratorKey + "\"}");
            IRestResponse response = client.Execute(request);

            RootObject root = JsonConvert.DeserializeObject<RootObject>(response.Content);

            if (string.IsNullOrEmpty(root.errorCode))
            {
                lblSuccess.Visible = true;
                lblfailure.Visible = false;
                return;
            }

            lblfailure.Text = root.message;
            lblfailure.Visible = true;
            lblSuccess.Visible = false;
        }

        public class LoginAccount
        {
            public string name { get; set; }
            public string accountId { get; set; }
            public string baseUrl { get; set; }
            public string isDefault { get; set; }
            public string userName { get; set; }
            public string userId { get; set; }
            public string email { get; set; }
            public string siteDescription { get; set; }
        }

        public class RootObject
        {
            public List<LoginAccount> loginAccounts { get; set; }
            public string apiPassword { get; set; }
            public string errorCode { get; set; }
            public string message { get; set; }
        }
    }
}