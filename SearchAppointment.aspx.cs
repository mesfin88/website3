using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Odbc;


namespace YourNamespace

{
   
    public partial class SearchAppointment : Page
    {
       

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string caseNumber = txtCaseNumber.Text.Trim();
            if (!string.IsNullOrEmpty(caseNumber))
            {
                SearchCaseByNumber(caseNumber);
            }
        }

        private void SearchCaseByNumber(string caseNumber)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CCMSConnection"].ConnectionString;
            string query = @"SELECT v.CaseNumber as 'መዝገብ ቁጥር',
 v.PlaintiffName as 'ከሳሽ', 
v.DefendantName as 'ተከሳሽ' ,
r.RoomName as 'ችሎት',
v.DateAppointedAmh as 'የቀጠሮ ቀን',
a.AppointReasonName as 'የቀጠሮ ምክኒያት',
s.CaseStatusName as 'ጉዳዩ ያልበት ሁኔታ'
FROM dbo.V_AppointList v LEFT OUTER JOIN  dbo.CourtRoomInfo  r on v.CurrentCourtRoomNumber=r.RoomNumber LEFT OUTER JOIN dbo.AppointReason a on v.AppointReasonId=a.AppointReasonId LEFT OUTER JOIN dbo.CaseStatus s on v.CaseStatusId=s.CaseStatusId
WHERE SUBSTRING(v.CaseNumber,7,len(v.CaseNumber)) = ? order by v.DateAppointed DESC";

            try
            {
                using (OdbcConnection conn = new OdbcConnection(connectionString))
                using (OdbcCommand cmd = new OdbcCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue( "?", caseNumber);
                    conn.Open();
                    DataTable dt = new DataTable();
                    dt.Load(cmd.ExecuteReader());

                    // Set label values from first row
                    
                        string cnumber = dt.Rows[0]["መዝገብ ቁጥር"].ToString();
                    string pname = dt.Rows[0]["ከሳሽ"].ToString();
                    string dname = dt.Rows[0]["ተከሳሽ"].ToString();
                    string cstatus = dt.Rows[0]["ጉዳዩ ያልበት ሁኔታ"].ToString();
                    lblCaseNumber.Text="<strong> መዝገብ ቁጥር:</strong>" + cnumber;
                    lblPlaintiff.Text="<strong > ከሳሽ / ይግባኝ ባይ:</ strong > " + pname;
                    lblDefendant.Text="<strong > ተከሳሽ / መልስ ሰጪ:</ strong >" + dname;
                    lblStatus.Text ="<strong > ጉዳዩ ያልበት ሁኔታ:</ strong > " + cstatus;
                    lblCaseNumber.Visible = true;
                    lblPlaintiff.Visible = true;
                    lblDefendant.Visible = true;
                    lblStatus.Visible = true;
                    gvAppointments.DataSource = dt;
                    gvAppointments.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(Error searching case: {ex.Message});</script>");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCaseNumber.Attributes["placeholder"] = "የመዝብ ቁጥር ያስገቡ";
            }
        }

        protected void btnClearAll_Click(object sender, EventArgs e)
        {
            txtCaseNumber.Text = string.Empty;
            gvAppointments.DataSource =null;
            gvAppointments.DataBind();
        }
        protected void Number_Click(object sender, EventArgs e)
        {
            Button clicked = (Button)sender;
            txtCaseNumber.Text += clicked.Text;
        }
        protected void btnClearOneByOne_Click(object sender, EventArgs e)
        {
            string currentText = txtCaseNumber.Text;

            if (!string.IsNullOrEmpty(currentText))
            {
                // Remove last character
                txtCaseNumber.Text = currentText.Substring(0, currentText.Length - 1);
            }
           
        }

    }
}
