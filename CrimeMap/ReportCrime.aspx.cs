using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimeMap
{
    public partial class ReportCrime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ReportSubmit_Click(object sender, EventArgs e)
        {
            DateTime? my_date;
            try { 
                my_date = DateTime.Parse(c_date.Value);
            }
            catch
            {
                my_date = null;
            }
            using (CrimeDBEntities CE = new CrimeDBEntities())
            {
                var ci = new CrimeInstance
                {
                    title = c_title.Value,
                    detail = c_detail.Value,
                    date = my_date
                };
                CE.CrimeInstances.Add(ci);
                CE.SaveChanges();
            }
        }
    }
}