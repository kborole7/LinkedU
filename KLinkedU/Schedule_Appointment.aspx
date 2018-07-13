<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Schedule_Appointment.aspx.cs" Inherits="KLinkedU.calander_test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle" style="padding-left: 3%; font-size: large; padding-top: 3%;">



            <cc1:ToolkitScriptManager ID="toolScriptManageer1" runat="server"></cc1:ToolkitScriptManager>
            <div>
                <strong>University Name:</strong>
                <asp:Label ID="Univ_name" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <strong>Your Name:</strong>
                <asp:Label ID="Stu_name" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <strong>Date of Appointment:  </strong>
                <asp:TextBox ID="appt_date" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="appt_date" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                <br />
                <br />
                <strong>Time (24-Hour format) : </strong>
                <br />
                <cc2:TimeSelector ID="TimeSelector" runat="server" SelectedTimeFormat="TwentyFour" Width="100px" Height="26px">
                </cc2:TimeSelector>
                <br />
                <br />
                <asp:Button ID="schd" runat="server" Text="Schedule" CssClass="allbutton" OnClick="schd_Click" />
                <br />
                <br />

                <asp:Label ID="conf" runat="server" Text=""></asp:Label>

            </div>
        </div>
</asp:Content>
