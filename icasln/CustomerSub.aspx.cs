using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class CustomerSub : System.Web.UI.Page
    {
        Subbed aSubbed = new Subbed();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }

        protected void bind()
        {
            List<Subbed> subList = new List<Subbed>();
            subList = aSubbed.GetSubbedAll();
            gvSubbed.DataSource = subList;
            gvSubbed.DataBind();
        }
    }
}