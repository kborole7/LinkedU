<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="KLinkedU.Reports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">

            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="438px" Width="966px" BackColor="WhiteSmoke" Palette="Chocolate">
            <Titles><asp:Title Text="Top 5 most Viewed Universities" Font="Microsoft Sans Serif, 8pt, style=Bold"></asp:Title> </Titles>
            <Series>
                <asp:Series Name="Series1" XValueMember="University_Name" YValueMembers="Most_Viewed">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title ="Universities" TitleFont="Microsoft Sans Serif, 8pt, style=Bold"></AxisX>
                    <AxisY Title ="No of Views" TitleFont="Microsoft Sans Serif, 8pt, style=Bold"></AxisY>
                    <Area3DStyle Enable3D="True" />
                </asp:ChartArea>
                
            </ChartAreas>
            <Titles>
                
            </Titles>
        </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_Connect %>" SelectCommand="select top 5 University_name, Most_Viewed
from University_Info
order by Most_Viewed desc;"></asp:SqlDataSource>
 </div>
        <br /><br />
    <//div>
     <br /><br />
    
</asp:Content>
