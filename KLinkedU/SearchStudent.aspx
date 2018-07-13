<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchStudent.aspx.cs" Inherits="KLinkedU.SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <div class="search" style="padding-left: 5%; font-size: large; border: double; padding-top: 2%; height: 350px; width: 500px">
                <h3 style="font-weight: bold; font-size: large; color: darkblue; text-align: center">Enter criteria for Student Search:</h3>
                <strong>Student Name:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="student" runat="server" Width="160px"></asp:TextBox>
                <br />
                <br />
                <strong>Skills:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:TextBox ID="skills" runat="server" Style="margin-left: 0px" Width="160px"></asp:TextBox>
                <br />
                <br />
                <strong>Minimum ACT Score:</strong>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="ACTScore" runat="server" Width="160px"></asp:TextBox>
                &nbsp;/ 36<br />
                <br />
                <strong>Minimum SAT Score:</strong>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="SATScore" runat="server" Width="162px"></asp:TextBox>
                &nbsp;/ 1600<br />
                <br />
                <br />

                <div>
                    <asp:Button align="center" ID="srch" class="allbutton" runat="server" Text="Search"  OnClick="srch_Click" />
                </div>
                <br />
                <br />

            </div>
        
        <br />
        <br />
        <br />
        <div class="results" style="padding-left: 3% ; padding-top:3%">

            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemDataBound="datalist_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand">
                <HeaderTemplate>
                    <asp:Label ID="lbl" Text="header" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <img src="./images/<%#Eval("PROFILE_PICTURE")%>" width="90" />
                            </td>
                            <td style="width: 400px">
                                <b><%#Eval("Fname") %> <%#Eval("Lname") %></b>
                                <br />

                                <b>ACT Score: </b><%#Eval("ACT_Score") %><br />
                                <b>SAT Score: </b><%#Eval("SAT_Score") %><br />
                                <b>Recent Degree: </b><%#Eval("LAST_DEGREE_EARNED") %><br />
                                <b>Skills: </b><%#Eval("SKILLS") %>
                            </td>
                            <td>
                                <asp:Button ID="Button1" CssClass="allbutton" runat="server" Text="More Information" CommandName="Student_Info" CommandArgument='<%#Eval("Userid")%>' /></a>
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
            <br />
            <br />
        </div>
            </div>
    </div>
</asp:Content>
