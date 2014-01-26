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
            float? c_lat, c_long;
            try { 
                my_date = DateTime.Parse(c_date.Value);
            }
            catch
            {
                my_date = null;
            }
            try
            {
                c_lat = float.Parse(latMap.Value);
                c_long = float.Parse(lngMap.Value);
            }
            catch
            {

            }

            using (CrimeDBEntities CE = new CrimeDBEntities())
            {
                var ci = new CrimeInstance
                {
                    detail = c_detail.Value,
                    date = my_date,
                    category = Int32.Parse(c_category.Value)
                };
                CE.CrimeInstances.Add(ci);
                CE.SaveChanges();
            }
        }
    }
}