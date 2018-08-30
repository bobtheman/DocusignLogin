<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DocusignLogin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div>
                    <table style="width: 500px;">
                        <tr>
                            <td>Email Address</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtemail" TextMode="Email" Width="99%" ValidationGroup="ValLogin"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator runat="server" ID="valemail" ControlToValidate="txtemail" SetFocusOnError="true" ErrorMessage="*" ForeColor="Red" ValidationGroup="ValLogin"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" Width="99%" ValidationGroup="ValLogin"></asp:TextBox>
                            </td>
                            <td><asp:RequiredFieldValidator runat="server" ID="valpassword" ControlToValidate="txtpassword" SetFocusOnError="true" ErrorMessage="*" ForeColor="Red" ValidationGroup="ValLogin"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button runat="server" ID="btnproceed" OnClick="btnproceed_Click" Text="Proceed" Width="100%" ValidationGroup="ValLogin" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label runat="server" ID="lblSuccess" Text="Login Success" Visible="false" BackColor="Green" Width="100%"></asp:Label>
                                <asp:Label runat="server" ID="lblfailure" Visible="false" BackColor="Red" Width="100%"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
