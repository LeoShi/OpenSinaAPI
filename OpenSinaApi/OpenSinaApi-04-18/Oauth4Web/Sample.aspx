<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="Oauth4Web._Default" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        #Select1
        {
            width: 126px;
        }
        #MethodsSelector
        {
            width: 119px;
        }
        #Text1
        {
            height: 233px;
            width: 1216px;
        }
        #resultText
        {
            height: 186px;
            width: 1215px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="sinaButton" runat="server" onclick="sinaButton_Click" 
        Text="连接sina" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Methods:"></asp:Label>
&nbsp;
    <asp:DropDownList ID="DropDownList" runat="server" Height="20px" Width="142px">
        <asp:ListItem Value="0">public_timeline</asp:ListItem>
        <asp:ListItem Value="1">friends_timeline</asp:ListItem>
        <asp:ListItem Value="2">user_timeline</asp:ListItem>
        <asp:ListItem Value="3">mentions</asp:ListItem>
        <asp:ListItem Value="4">comments_timeline</asp:ListItem>
        <asp:ListItem Value="5">comments_by_me</asp:ListItem>
        <asp:ListItem Value="6">statuses/followers</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="invoke" runat="server" onclick="invoke_Click" Text="Invoke" />
    <br />
    <p>
        <asp:TextBox ID="resultText" runat="server" Height="247px" TextMode="MultiLine" 
            Width="1205px"></asp:TextBox>
    </p>
    <br />
    <asp:Label ID="Label2" runat="server" Text="status:"></asp:Label>
    <asp:TextBox ID="statusText" runat="server" Width="210px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="update" runat="server" onclick="update_Click" Text="Update" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="filepath:"></asp:Label>
&nbsp;<asp:TextBox ID="filepath" runat="server" Width="202px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="upload" runat="server" onclick="upload_Click" Text="Upload" />
    <br />
    <br />
    <asp:TextBox ID="resultTextBox2" runat="server" Height="276px" 
        TextMode="MultiLine" Width="1207px"></asp:TextBox>
    </form>
</body>
</html>
