<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Mark_University.aspx.cs" Inherits="KLinkedU.Mark_University" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
    
    <h1>Mark University</h1>
        <div>
            <h3>Universties in the Database:</h3>
        </div>

          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="441px" Height="168px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="uni" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField ItemStyle-Width="150px" DataField="University_Name" HeaderText="University Names">
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="Featured" HeaderText="Current Status">
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
        <asp:Button ID="Button1" runat="server" Text="Mark as Featured" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Remove from Feaured" OnClick="Button2_Click" />
        <br />
        <asp:Label ID="lblText" runat="server" Text=""></asp:Label>

            </div>
        </div>
    </asp:Content>