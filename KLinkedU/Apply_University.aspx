<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Apply_University.aspx.cs" Inherits="KLinkedU.Apply_University" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">   
        <div class="column middle" style="padding-left:13%; padding-top:3% ;">
            <div style="border:double; padding-left:3%; padding-top:3% ; width:70%; height:auto">
           <h3 style="font-weight:bold; font-size:large; color:darkblue; text-align:center" >Application Form:</h3>   
           
            &nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Upload your Statement of Purpose here:
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpload" runat="server" Text="Upload File"
                OnClick="btnUpload_Click" />
            &nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only PDF files accepted. Maximum file size 2MB.
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" Font-Bold="true" runat="server">
            </asp:Label>

            <p>
                &nbsp;
            </p>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Upload your Transcripts here:
                <asp:FileUpload ID="FileUpload2" runat="server" />
                &nbsp;<br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpload2" runat="server" Text="Upload File"
                    OnClick="btnUpload2_Click" />
                &nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only PDF files accepted. Maximum file size 2MB.
                <br />
            </div>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage0" Font-Bold="true" runat="server">
            </asp:Label>
                <br /><br />
                </div>
</div>
        </div>



      </asp:Content>



