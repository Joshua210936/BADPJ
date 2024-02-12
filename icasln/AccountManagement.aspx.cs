using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class AccountManagement : System.Web.UI.Page
    {
        User customer = new User();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        private void Bind()
        {
            List<User> listOfUsers = customer.GetAllUsers();
            gvCustomer.DataSource = listOfUsers;
            gvCustomer.DataBind();
        }

        protected void gvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCustomer.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void gvCustomer_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvCustomer.Rows[e.RowIndex];
            string userId = gvCustomer.DataKeys[e.RowIndex].Value.ToString();
            string newFirstName = (row.FindControl("txtFirstName") as TextBox).Text;
            string newLastName = (row.FindControl("txtLastName") as TextBox).Text;
            string newEmail = (row.FindControl("txtEmail") as TextBox).Text;
            string newPhoneNumber = (row.FindControl("txtPhoneNumber") as TextBox).Text;

            // Determine the selected gender from the RadioButtonList
            RadioButtonList rblGenderEdit = (RadioButtonList)row.FindControl("rblGenderEdit");
            string newGender = rblGenderEdit.SelectedValue;


            // Update user data in the database
            customer.UpdateUserData(userId, newFirstName , newLastName, newEmail, newPhoneNumber, newGender);

            gvCustomer.EditIndex = -1;
            Bind();
        }

        protected void gvCustomer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomer.EditIndex = -1;
            Bind();
        }

        protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string userId = gvCustomer.DataKeys[e.RowIndex].Value.ToString();

            // Delete user data from the database
            customer.DeleteUser(userId);

            Bind();
        }

        protected void gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add JavaScript confirmation for delete button
                LinkButton lnkDelete = (LinkButton)e.Row.FindControl("lnkDelete");
                if (lnkDelete != null)
                {
                    lnkDelete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this user?');");
                }
            }
        }
    }
}