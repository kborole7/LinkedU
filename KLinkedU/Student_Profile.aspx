<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Student_Profile.aspx.cs" Inherits="KLinkedU.Student_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <h1 class="auto-style3"><span class="newStyle1"><%#Eval("Fname") %> &nbsp <%#Eval("Lname") %></span></h1>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl='<%# "./images/" + Eval("PROFILE_PICTURE") %>' Width="250px"  />
                            </td>
                        </tr>

                        <tr>
                            <div>
                            <td>
                                <h3 class="auto-style4"><strong>About the Student:</strong></h3>
                                <p>

                                    <%#Eval("ABOUTME") %>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Skills: </b><%#Eval("SKILLS")%>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td><b>Recent Degree Earned: </b><%#Eval("LAST_DEGREE_EARNED")%>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td><b>Name of Highschool: </b><%#Eval("HIGH_SCH_NAME")%> </td>
                        </tr>
                         <tr>
                            <td><b>Major: </b><%#Eval("MAJOR")%> </td>
                        </tr>
                         <tr>
                            <td><b>Minor: </b><%#Eval("MINOR")%> </td>
                        </tr>
                         <tr>
                            <td><b>ACT Score: </b><%#Eval("ACT_SCORE")%> </td>
                        </tr>
                         <tr>
                            <td><b>SAT Score: </b><%#Eval("SAT_SCORE")%> </td>
                        </tr>
                         <tr>
                            <td><b>Country: </b><%#Eval("COUNTRY")%> </td>
                        </tr>
                         <tr>
                            <td><b>Zipcode: </b><%#Eval("ZIPCODE")%> </td>
                        </tr>
                        <br />
                        <br />
                        <td>
                            <br />
                            <asp:Button align="center" ID="Contact" runat="server" Text="Contact Information" CssClass="allbutton" CommandArgument=<%#Eval("Userid")%> BorderStyle="Double" Font-Size="Larger" OnClick="Contact_Click" />
                        </td>
                        <br />
                        </div>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <br />
        
     <br /> <br />
     <div style="padding-left:3%">
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Connect %>" SelectCommand="SELECT [FName], [Genre] FROM [Student_Media] WHERE ([Userid] = @stud_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="stud_id" SessionField="stud_id" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                        <HeaderTemplate>
                            <asp:Label ID="lbl" Text="Videos uploaded:" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <video src="./Mixtapes/<%#Eval("FName")%>" width="300" height="300" controls="controls" />
                                        </video>
                                    </td>
                                    <td style="width: 400px">
                                        <b>Genre: <%#Eval("Genre") %></b>
                                        <br />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button3" CssClass="allbutton" runat="server" Text="Show Similar Videos"  CommandName="Similar_Genre" CommandArgument='<%#Eval("Genre")%>' /></a>
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
         <br /><br />
     </div>
    </div>
    <//div>
    
</asp:Content>


