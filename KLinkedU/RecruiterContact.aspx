<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="RecruiterContact.aspx.cs" Inherits="KLinkedU.RecruiterContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle" style="padding-left: 3%; font-size:large; padding-top: 3%;">



            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <h2>You are not a Premium account member</h2>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <h2>Contact Information:</h2>
                    <br />
                    
                    <b>University Name:</b>&nbsp;
                    <asp:Label ID="uname" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <b>Address:</b>
                    <asp:Label ID="addr" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <b>Recruiter Name:</b>
                    <asp:Label ID="recru_name" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <b>Email:</b>
                    <asp:Label ID="email" runat="server" Text=""></asp:Label>
                </asp:View>
            </asp:MultiView>
            <br />
        </div>
    </div>


</asp:Content>
