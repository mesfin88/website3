using System.Web;
using System;
using System.Data;
using System.Data.Odbc;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class CourtList : Page
    {


        private void LoadTodaysAppointments()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["CCMSConnection"].ConnectionString;

            string query = @"
SELECT v.CaseNumber as 'መዝገብ ቁጥር',
 v.PlaintiffName as 'ከሳሽ', 
v.DefendantName as 'ተከሳሽ' ,
r.RoomName as 'ችሎት',
v.DateAppointedAmh as 'የቀጠሮ ቀን',
CASE 
        WHEN v.IsAfternoonAppoint = 1 THEN 'ከሰዓት'
        ELSE 'ጠዋት'
    END as 'ሰዐት',
a.AppointReasonName as 'የቀጠሮ ምክኒያት'  
FROM dbo.V_AppointList v LEFT OUTER JOIN  dbo.CourtRoomInfo  r on v.CurrentCourtRoomNumber=r.RoomNumber LEFT OUTER JOIN dbo.AppointReason a on v.AppointReasonId=a.AppointReasonId 
WHERE convert(varchar,cast(v.DateAppointed as datetime),112)= convert(varchar,getdate(),112) and r.RoomNumber=94";

            try
            {
                using (OdbcConnection conn = new OdbcConnection(connectionString))
                using (OdbcCommand cmd = new OdbcCommand(query, conn))
                {
                    cmd.CommandTimeout = 360; // 6 minutes timeout
                    conn.Open();

                    DataTable dt = new DataTable();
                    using (OdbcDataReader reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);
                    }

                    gvAppointments.DataSource = dt;
                    gvAppointments.DataBind();

                    lblRowCount.Text = "      ዛሬ " + dt.Rows.Count + " ቀጠሮዎች አሉ: ";
                }
            }
            catch (Exception ex)
            {
                string errorMessage = HttpUtility.JavaScriptStringEncode(
                 ex.InnerException != null ? ex.InnerException.Message : ex.Message);
                string script = "alert('Error loading appointments: {errorMessage}');";
                ClientScript.RegisterStartupScript(this.GetType(), "error", script, true);

            }
        }

        protected void gvAppointments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAppointments.PageIndex = e.NewPageIndex;
            LoadTodaysAppointments(); // Rebind data for the new page
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int nextPage = gvAppointments.PageIndex + 1;
            if (nextPage >= gvAppointments.PageCount)
                nextPage = 0;

            gvAppointments.PageIndex = nextPage;
            LoadTodaysAppointments();

        }

   
 
        protected void CourtLIst_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SearchAppointment.aspx"); // or your actual home page path
        }
    }
}

