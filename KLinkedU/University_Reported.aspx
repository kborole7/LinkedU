<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="University_Reported.aspx.cs" Inherits="KLinkedU.University_Reported" %>

<asp:content id="Content1" contentplaceholderid="head" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
  
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <h1>Update Reported University</h1>
            <div>
                <h3 >Reported Universities:</h3>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="657px" Height="168px" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete_record" Text="Delete from Database" CommandArgument='<%# Eval("University_Name") + ";" + Eval("Userid")%>'
                                OnClientClick="return confirm('This will delete the University Information from the database. Are you certain you want to do this?');" >Delete from Database</asp:LinkButton>
                            
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="unreport"  CommandArgument='<%# Eval("University_Name") %>'
                                OnClientClick="return confirm('This will remove the University from the Reported list. Are you certain you want to do this?');">Remove from Reported list</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="150px" DataField="University_Name" HeaderText="University Names">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ItemStyle-Width="150px" DataField="Reported" HeaderText="Current Status">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>

                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

            </asp:GridView>

            <br />
            
            <asp:Label ID="lblText" runat="server" Text=""></asp:Label>

        
            </div>
        </div>
    </asp:content>
