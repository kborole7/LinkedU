<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="University_Profile.aspx.cs" Inherits="KLinkedU.University_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-right: 1%">
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <h1 class="auto-style3"><span class="newStyle1"><%#Eval("University_Name") %></span></h1>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="190px" ImageUrl='<%# "./Images/" + Eval("Images") %>' Width="879px" />
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
                            <td class="auto-style3">
                                <br />
                                <asp:Button align="center" ID="report" Visible='<%# Session["status"].ToString() == "S"%>' runat="server" Text="Report this posting" CssClass="allbutton" Font-Size="large" CommandArgument='<%#Eval("University_Name")%>' OnClick="report_Click" />

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:Button ID="Button1" align="center" runat="server" Text="Apply" Visible='<%# Session["status"].ToString() == "S"%>' CssClass="allbutton" Font-Size="large" CommandName="apply" CommandArgument='<%#Eval("University_Name")%>' OnClick="Button1_Click" />

                                <br />
                                <br />

                            </td>

                        </tr>
                        <caption>
                            <br />
                            <tr>
                                <td>
                                    <asp:Button ID="appoint" runat="server" align="center" CommandArgument='<%#Eval("University_Name")%>' CssClass="allbutton" Font-Size="large" OnClick="appoint_Click" Text="Schedule Appointment" Visible='<%# Session["status"].ToString() == "S"%>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:Button ID="Contact" runat="server" align="center" CommandArgument='<%#Eval("University_Name")%>' CommandName="contact" CssClass="allbutton" Font-Size="Large" OnClick="Contact_Click" Text="Contact Information" />
                                </td>
                                <caption>
                                    <br />
                                    <br />
                                    <br />
                                </caption>
                            </tr>
                        </caption>

                    </table>
                </ItemTemplate>
            </asp:DataList>

            <br />
            <br />

            <div>

                <script type="text/javascript">

                    //lat = "40.5124";
                    //lng = "-88.9883";

                    //description = "hello";
                  <%--   var lat = '<%=latt%>';
                    var lng = '<%=lngg%>';
                    var desc = <%=description%>;--%>
                    var description = "<%#Eval("University_Name") %>";
                </script>

                <%--                <script>
                    function GetMyValue() {
                        var lat = <%=this.latt%>;
                        var lng = <%=this.lngg%>;
                        var desc = <%=this.description%>;
                    
                        //Do something
                    }
</script>
                --%>
                <script type="text/javascript">



                    window.onload = function () {
                        var mapOptions = {
                            center: new google.maps.LatLng('<%=latt%>','<%=lngg%>'),
                            zoom: 10,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };

                        var data;
                        var infoWindow = new google.maps.InfoWindow();
                        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                        var title = "ISU";

                        {

                            var myLatlng = new google.maps.LatLng('<%=latt%>','<%=lngg%>');
                            var marker = new google.maps.Marker({
                                position: myLatlng,
                                map: map,
                                title: title
                            });
                            (function (marker, data) {
                                google.maps.event.addListener(marker, "click", function (e) {
                                    infoWindow.setContent(description);
                                    infoWindow.open(map, marker);
                                });
                            })(marker, data);
                        }
                    }
                </script>
                <%-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-eBBkyPizty7RWObaPVaGGEC0JX1XPWo &callback=initMap"
  type="text/javascript"></script>--%>
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA-eBBkyPizty7RWObaPVaGGEC0JX1XPWo&libraries=places&sensor=false"></script>
            </div>
            <div style="padding-left: 3%; padding-top: 3%; height: auto">
                <asp:Label ID="Label1" runat="server" Text="Campus Location" Font-Size="Large" Font-Bold="true"></asp:Label>
                <br />

                <div id="dvMap" style="width: 500px; height: 500px">
                </div>
            </div>
            <br />
            <br />
        </div>
        <br />
        <br />
    </div>
    <br />
    <br />
</asp:Content>

