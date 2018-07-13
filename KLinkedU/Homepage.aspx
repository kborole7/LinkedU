<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="KLinkedU.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Connect %>" SelectCommand="SELECT [ABOUTME] AS &quot;About me&quot;, [ACT_SCORE] AS &quot;ACT Score&quot;, [SAT_SCORE] AS &quot;SAT Score&quot;, [LAST_DEGREE_EARNED] AS &quot;Recent Degree&quot;, [MAJOR] AS &quot;Major&quot;, [MINOR] AS &quot;Minor&quot;, [HIGH_SCH_NAME] AS &quot;Highschool Name&quot;, [SKILLS] AS &quot;Skills&quot;, [COUNTRY] AS &quot;Country&quot;, [ZIPCODE] AS &quot;Zipcode&quot;, [number] AS &quot;Contact Number&quot; FROM [KUserinfo] WHERE ([Userid] = @Userid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Userid" SessionField="Userid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <strong>About me:</strong>
                            <asp:Label ID="About_meLabel" runat="server" Text='<%# Eval("[About me]") %>' />
                            <br />
                            <strong>ACT Score:</strong>
                            <asp:Label ID="ACT_ScoreLabel" runat="server" Text='<%# Eval("[ACT Score]") %>' />
                            <br />
                            <strong>SAT Score:</strong>
                            <asp:Label ID="SAT_ScoreLabel" runat="server" Text='<%# Eval("[SAT Score]") %>' />
                            <br />
                            <strong>Recent Degree:</strong>
                            <asp:Label ID="Recent_DegreeLabel" runat="server" Text='<%# Eval("[Recent Degree]") %>' />
                            <br />
                            <strong>Major:</strong>
                            <asp:Label ID="MajorLabel" runat="server" Text='<%# Eval("Major") %>' />
                            <br />
                            <strong>Minor:</strong>
                            <asp:Label ID="MinorLabel" runat="server" Text='<%# Eval("Minor") %>' />
                            <br />
                            <strong>Highschool Name:</strong>
                            <asp:Label ID="Highschool_NameLabel" runat="server" Text='<%# Eval("[Highschool Name]") %>' />
                            <br />
                            <strong>Skills:</strong>
                            <asp:Label ID="SkillsLabel" runat="server" Text='<%# Eval("Skills") %>' />
                            <br />
                            <strong>Country:</strong>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                            <br />
                            <strong>Zipcode:</strong>
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            <br />
                            <strong>Contact Number:</strong>
                            <asp:Label ID="Contact_NumberLabel" runat="server" Text='<%# Eval("[Contact Number]") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Connect %>" SelectCommand="SELECT [FName], [Genre] FROM [Student_Media] WHERE ([Userid] = @Userid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Userid" SessionField="Userid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                        <HeaderTemplate>
                            <asp:Label ID="lbl" Text="Videos uploaded by you:" runat="server"></asp:Label>
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
                                        <asp:Button ID="Button3" CssClass="allbutton" runat="server" Text="Show Similar Videos" CommandName="Similar_Genre" CommandArgument='<%#Eval("Genre")%>' /></a>
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
                </asp:View>
                <asp:View ID="View2" runat="server">

                    <asp:DataList ID="DataList3" runat="server">
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        <h1 class="auto-style3"><span class="newStyle1"><%#Eval("University_Name") %></span></h1>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 878px">
                                        <h3 class="auto-style4"><strong>About the University:</strong></h3>
                                        <p>
                                            <%#Eval("Descr") %>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <b>Minimum ACT Score required: </b><%#Eval("Minimum_ACT")%> / 36
                                <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <b>Minimum SAT Score required: </b><%#Eval("Minimum_SAT")%> / 1600
                                <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        Location: <%#Eval("State")%>, <%#Eval("Country")%> , <%#Eval("Zip_Code")%>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <i>Website URL: </i><a href="<%#Eval("Website")%>"><%#Eval("Website")%></a> </td>
                                </tr>
                                <tr>
                                    <br />
                                    <br />

                                    <br />

                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                     <br />
                                    <br />

                                    <br />

                </asp:View>
                <asp:View ID="View3" runat="server">
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Mark Universities" Width="23%" CssClass="allbutton" OnClick="Button1_Click"  />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Reports" Width="21%" CssClass="allbutton" OnClick="Button2_Click"  />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Report" runat="server" Text="View Reported Universities" Width="26%"  CssClass="allbutton" OnClick="Report_Click" />
                </asp:View>
            </asp:MultiView>

        </div>

    </div>

</asp:Content>
