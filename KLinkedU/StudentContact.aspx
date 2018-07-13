<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentContact.aspx.cs" Inherits="KLinkedU.StudentContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <h1 class="auto-style3"><span class="newStyle1"><%#Eval("Fname") %> &nbsp <%#Eval("Lname") %></span></h1>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl='<%# "./images/" + Eval("PROFILE_PICTURE") %>' Width="250px" alt="generic-user.png" />
                            </td>
                        </tr>

                        
                        
                        
                        
                         <tr>
                            <td><b>Email address: </b><%#Eval("Email")%> </td>
                        </tr>
                         <tr>
                            <td><b>Contact Number: </b><%#Eval("number")%> </td>
                        </tr>
                         <tr>
                            <td><b>Address: </b><%#Eval("COUNTRY")%> , <%#Eval("ZIPCODE")%>   </td>
                        </tr>
                         
                        <tr>
                            <td><b>Name of Highschool: </b><%#Eval("HIGH_SCH_NAME")%> </td>
                        </tr>

                         <tr>
                            <td><b>ACT Score: </b><%#Eval("ACT_SCORE")%> </td>
                        </tr>
                         <tr>
                            <td><b>SAT Score: </b><%#Eval("SAT_SCORE")%> </td>
                        </tr>
                        
                        <br />
                        <br />
                        <td>
                            <br />
                            
                        </td>
                        <br />
                        </div>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <br />
        </div>
    </div>


</asp:Content>
