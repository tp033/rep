<%@ Page Title="" Language="C#" MasterPageFile="~/mae_Agent/agentMasterPage.Master" AutoEventWireup="true" CodeBehind="bookVessel.aspx.cs" Inherits="maersk.mae_Agent.bookVessel" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent" >
    <h2><%: Title %> Book Vessel</h2>
<div class="row">
        <div class="col-md-12">
                <div class="form-horizontal">
                    <h4>Select your vessel.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <h4>Schedule details</h4>
                    <%--<div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">Item name</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="name"
                                CssClass="text-danger" ErrorMessage="The item name field is required." />
                        </div>
                    </div>
                   <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email </asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="number" CssClass="col-md-2 control-label">Contact Number</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="number" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="number"
                                CssClass="text-danger" ErrorMessage="The Contact Number field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="country" CssClass="col-md-2 control-label">Country</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="country" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="country"
                                CssClass="text-danger" ErrorMessage="The container type field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="address" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                                CssClass="text-danger" ErrorMessage="The address field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="State" CssClass="col-md-2 control-label">State</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="State" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="State"
                                CssClass="text-danger" ErrorMessage="The state field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="City" CssClass="col-md-2 control-label">City</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="City" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="City"
                                CssClass="text-danger" ErrorMessage="The city field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="code" CssClass="col-md-2 control-label">Postal Code</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="code" CssClass="form-control" MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="code"
                                CssClass="text-danger" ErrorMessage="The Postal Code is required." />
                        </div>
                    </div>--%>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleId" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand" PageSize="5">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="scheduleId" HeaderText="Schedule ID" InsertVisible="False" ReadOnly="True" SortExpression="scheduleId" />
                            <asp:BoundField DataField="vessel" HeaderText="Vessel" SortExpression="vessel" />
                            <asp:BoundField DataField="fromLoc" HeaderText="From" SortExpression="fromLoc" />
                            <asp:BoundField DataField="frarr" HeaderText="From Location Arrival date/time" SortExpression="frarr" />
                            <asp:BoundField DataField="frdept" HeaderText="From Location Depature date/time " SortExpression="frdept" />
                            <asp:BoundField DataField="toLoc" HeaderText="To" SortExpression="toLoc" />
                            <asp:BoundField DataField="toarr" HeaderText="To Location Arrival date/time " SortExpression="toarr" />
                            <asp:BoundField DataField="todept" HeaderText="To Location Departure date/time " SortExpression="todept" />
                            <asp:BoundField DataField="space" HeaderText="Space Available" SortExpression="space" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT * FROM [schedule]"></asp:SqlDataSource>
                    <div class="form-group">
                        <br />
                        <asp:Label runat="server" AssociatedControlID="sID" CssClass="col-md-2 control-label">	Schedule ID	 </asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="sID" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="sID"
                                CssClass="text-danger" ErrorMessage="The Schedule ID field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Register Item" CssClass="btn btn-default" ID="regCus"  OnClick="regCus_Click" />
                        </div> 
                    </div>
                </div>
        </div>

        <div class="col-md-4">
                   
       </div>
    </div>
    <script>
        function regItem() {
            window.location.href = "./registerItem.aspx?sID=" + document.getElementById("<%=sID.ClientID %>").value;
        }
    </script>
</asp:Content>
