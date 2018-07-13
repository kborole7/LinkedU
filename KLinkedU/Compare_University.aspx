<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Compare_University.aspx.cs" Inherits="KLinkedU.Compare_University" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%; padding-right:0%">
            <div class="search" style="padding-left: 5%; font-size: large; border: double; padding-top: 2%; padding-left:1%; width:70% ">


                <h3 align="center">Compare Universities</h3>


                <h3 align="center">Select Universities</h3>
                University 1:&nbsp;&nbsp;&nbsp;&nbsp;
            
        <asp:DropDownList ID="University_1" runat="server"></asp:DropDownList>

              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                University 2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="University_2" runat="server"></asp:DropDownList>
                <br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button align="center" ID="srch" runat="server" Text="Search" CssClass="allbutton" OnClick="srch_Click"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="back_button" runat="server" Text="Back to Search University" CssClass="allbutton" OnClick="back_button_Click" />
                <br />
                <br />
            </div>

            <table id="table" runat="server" style="height: 100%; width: 100%;">
                <tr>
                    <td style="border: solid; width: 50%">




                        <asp:DataList ID="DataList2" runat="server">
                            <ItemTemplate>


                                <div style="height: 100%">

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "./Images/" + Eval("Images") %>' Height="50%" Width="80%" />
                                    <br />
                                    <b style="font-size: 30px"><%#Eval("University_Name") %></b>
                                    <br />
                                    <br />
                                    <strong>Minimum ACT Score: </strong><%#Eval("Minimum_ACT")%> / 36
                                <br />
                                    <br />
                                    <strong>Minimum SAT Score: </strong><%#Eval("Minimum_SAT")%> / 1600
                                <br />
                                    <br />
                                    <strong>Location :</strong> <%#Eval("State")%>, <%#Eval("Country")%>, <%#Eval("Zip_Code")%>
                                    <br />
                                    <br />
                                    <strong>URL :</strong> <a href="<%#Eval("Website")%>"><%#Eval("Website")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td style="border: solid; width: 50%">
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>

                                <div style="height: 100%">

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "./Images/" + Eval("Images") %>' Height="50%" Width="80%" />
                                    <br />
                                    <b style="font-size: 30px"><%#Eval("University_Name") %></b>
                                    <br />
                                    <br />
                                    <strong>Minimum ACT Score required: </strong><%#Eval("Minimum_ACT")%> / 36
                                <br />
                                    <br />
                                    <strong>Minimum SAT Score required: </strong><%#Eval("Minimum_SAT")%> / 1600
                                <br />
                                    <br />
                                    <strong>Location :</strong> <%#Eval("State")%>, <%#Eval("Country")%>, <%#Eval("Zip_Code")%>
                                    <br />
                                    <br />
                                    <strong>URL :</strong> <a href="<%#Eval("Website")%>"><%#Eval("Website")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
            </table>
            <br />

            <br />
            <br />

        </div>
    </div>
</asp:Content>





