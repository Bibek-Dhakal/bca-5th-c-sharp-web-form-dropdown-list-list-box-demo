<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Home Page</title>
    <style>
        .styled-input {
            width: 200px;
            padding: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label>
        <br />
        <asp:TextBox ID="txtName" runat="server" CssClass="styled-input"></asp:TextBox>
        <br /><br />
        <asp:Label runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
        <br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="styled-input"></asp:TextBox>
        <br /><br />
        <asp:Label runat="server" Text="Gender:" AssociatedControlID="ddlOptions"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlOptions" runat="server" CssClass="styled-input">
            <asp:ListItem Text="M" Value="Male"></asp:ListItem>
            <asp:ListItem Text="F" Value="Female"></asp:ListItem>
            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <asp:Label runat="server" Text="City:" AssociatedControlID="lstItems"></asp:Label>
        <br />
        <asp:ListBox ID="lstItems" runat="server" CssClass="styled-input" SelectionMode="Single">
            <asp:ListItem Text="BRT" Value="Biratnagar"></asp:ListItem>
            <asp:ListItem Text="KTM" Value="Kathmandu"></asp:ListItem>
            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
        </asp:ListBox>
        <br /><br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
        <br /><br />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </form>

    <script runat="server">
        protected new void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Click += btnSubmit_Click;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var name = txtName.Text;
            var email = txtEmail.Text;
            var selectedOption = ddlOptions.SelectedItem != null
                ? ddlOptions.SelectedItem.Text
                : "No option selected";
            var selectedItems = lstItems.SelectedItem != null
                ? lstItems.SelectedItem.Text
                : "No item selected";

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email))
            {
                lblResult.Text = "Please fill in all fields";
                return;
            }

            lblResult.Text = $"Submitted Data: Name - {name}, Email - {email}, " +
                             $"Gender - {selectedOption}, City - {selectedItems}";
        }
    </script>
</body>
</html>