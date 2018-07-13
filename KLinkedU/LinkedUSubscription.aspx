<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LinkedUSubscription.aspx.cs" Inherits="KLinkedU.LinkedUSubscription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="border: double; padding-left: 3%; padding-top: 3%; width: 450px; height: auto">

                    <asp:Label ID="Label2" runat="server" Text="You are currently Subscribed to our LinkedU NewsLetter. Click on the UnSubscribe button to stop receiving recent updates from email." Font-Size="Large"></asp:Label>
                    <br /><br />
                    <asp:Button ID="Button2" runat="server" Text="UnSubscribe" OnClick="Button2_Click" />
                    <br /><br />
                    <asp:Label ID="Label4" runat="server" ></asp:Label>
                </div>
                
            </asp:View>


            <asp:View ID="View2" runat="server">
                
                <div style="border: double; padding-left: 3%; padding-top: 3%; width: 450px; height: auto">
                    <asp:Label ID="Label1" runat="server" Text="You have not Subscribed to our LinkedU NewsLetter. Click on the Subscribe button to get recent updates." Font-Size="Large"></asp:Label>
                                <br /><br />
                    <asp:Button ID="Button1" runat="server" Text="Subscribe" OnClick="Button1_Click" />
                                <br /><br />
                    <asp:Label ID="Label3" runat="server" ></asp:Label>
                </div>
            </asp:View>
                </asp:MultiView>
        </div>
    </div>
</asp:Content>
