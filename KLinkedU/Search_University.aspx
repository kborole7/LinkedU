<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search_University.aspx.cs" Inherits="KLinkedU.Search_University" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <div style="border: double; padding-left: 3%; padding-top: 3%; width: 500px; height: auto">

                <h3 style="font-weight: bold; font-size: large; color: darkblue; text-align: center">Enter criteria for University Search:</h3>
                <strong>University Name: </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="university" runat="server" Width="132px"></asp:TextBox>
                <br />
                <br />
               <strong> State:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:DropDownList ID="state" runat="server"  Width="132px">
            <asp:ListItem Text="ALL" Value="all" Selected="True"></asp:ListItem>
        </asp:DropDownList>
                <br />
                <br />
                <strong>Minimum ACT Score :</strong>&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ACT" runat="server" Width="132px">
                    <asp:ListItem>ANY</asp:ListItem>
                    <asp:ListItem>1-10</asp:ListItem>
                    <asp:ListItem>11-20</asp:ListItem>
                    <asp:ListItem>21-30</asp:ListItem>
                    <asp:ListItem>31-36</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
               <strong> Minimum SAT Score :</strong>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="SAT" runat="server"  Width="132px">
            <asp:ListItem>ANY</asp:ListItem>
            <asp:ListItem>400-700</asp:ListItem>
            <asp:ListItem>701-1000</asp:ListItem>
            <asp:ListItem>1001-1300</asp:ListItem>
            <asp:ListItem>1301-1600</asp:ListItem>
        </asp:DropDownList>
                <br /><br />
                <br />
                <asp:Button align="center" ID="srch" runat="server" Text="Search" CssClass="allbutton" OnClick="srch_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button align="center" ID="compare" runat="server" Text="Compare 2 Universities" CssClass="allbutton" OnClick="compare_Click" />
                <br />
                <br />
                <br />
                <br />
            </div>
       <br /><br /><br />
        <div class="results">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemDataBound="datalist_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
                        <HeaderTemplate>
                            <asp:Label ID="lbl" Text="header" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <img src="./Images/<%# Eval("Images")%>" height="200" width="300" />
                                    </td>
                                    <td style="width: 300px">
                                        <a href="<%#Eval("Website")%>"><%#Eval("University_Name") %></a>
                                        <br />
                                        <br />
                                        <%#Eval("State") %>,<%#Eval("Country") %>,<%#Eval("Zip_Code") %><br /><br /><b>Minimum ACT Score Required: </b><%#Eval("Minimum_ACT") %> / 36
                            <br />
                                        <br />
                                        <b>Minimum SAT Score Required: </b><%#Eval("Minimum_SAT") %> / 1600
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" CssClass="allbutton" runat="server" Text="Visit Profile" CommandName="Uni_Info" CommandArgument='<%#Eval("University_Name")%>' /></a>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="srch" />
                </Triggers>
            </asp:UpdatePanel>





        </div>
    </div>
    <br />
    <br />
    </div>
    <br /><br />
</asp:Content>
