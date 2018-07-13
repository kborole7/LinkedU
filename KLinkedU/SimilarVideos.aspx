<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SimilarVideos.aspx.cs" Inherits="KLinkedU.SimilarVideos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">   
        <div class="column middle" style="padding-left:13%; padding-top:3% ;">
            <asp:DataList ID="DataList3" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemDataBound="datalist_ItemDataBound">
                    <HeaderTemplate>
                        <asp:Label ID="lbl" Text="header" runat="server"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                   <video src="./Mixtapes/<%#Eval("FName")%>" width="300" height="300" controls="controls" /></video>
                                </td>
                                <td style="width: 400px">
                                    <b>Genre: <%#Eval("Genre") %></b>
                                    <br />
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
        </div>
       </div>
</asp:Content>

