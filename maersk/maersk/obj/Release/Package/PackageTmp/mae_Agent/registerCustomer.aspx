<%@ Page Title="Register Customer" Language="C#" MasterPageFile="~/mae_Agent/agentMasterPage.Master" AutoEventWireup="true" CodeBehind="registerCustomer.aspx.cs" Inherits="maersk.mae_Agent.registerCustomer" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent" >
    <h2><%: Title %>.</h2>
<div class="row">
        <div class="col-md-8">
                <div class="form-horizontal">
                    <h4>Register customer by completing this form.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <h4>Customer details</h4>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">Customer name</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="name"
                                CssClass="text-danger" ErrorMessage="The customer name field is required." />
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
                        <asp:Label runat="server" AssociatedControlID="custID" CssClass="col-md-2 control-label">NRIC/Passport Number</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="custID" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="custID"
                                CssClass="text-danger" ErrorMessage="The NRIC/Passport Number field is required." />
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
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Create" CssClass="btn btn-default" ID="regCus" OnClick="regCus_Click"  />
                        </div> 
                    </div>
                </div>
        </div>

        <div class="col-md-4">
                   
       </div>
    </div>
</asp:Content>