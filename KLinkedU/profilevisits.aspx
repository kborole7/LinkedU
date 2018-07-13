<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profilevisits.aspx.cs" Inherits="KLinkedU.profilevisits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Signinstyle.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:DataList ID="DataList5" runat="server" >
                <ItemTemplate>
                    <td><%#Eval("Fname")%> &nbsp <%#Eval("Lname")%> &nbsp viewed your profile
                                <br />
                    </td>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div>
            <asp:DataList ID="DataList6" runat="server" >
                <ItemTemplate>
                    <td><%#Eval("Count")%> &nbsp people viewed your profile
                                <br />
                    </td>
                </ItemTemplate>
            </asp:DataList>

        </div>
        <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
        
    </form>
</body>
</html>
