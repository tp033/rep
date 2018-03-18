<%@ Page Title="Register Agent" Language="C#" MasterPageFile="adminMasterPage.Master" AutoEventWireup="true" CodeBehind="registerAgent.aspx.cs" Inherits="maersk.mae_Admin.registerAgent" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent" >
    <h2><%: Title %>.</h2>
<div class="row">
        <div class="col-md-8">
                <div class="form-horizontal">
                    <h4>Register agent by completing this form.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <h4>Agent details</h4>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">Agent name</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="name"
                                CssClass="text-danger" ErrorMessage="The agent name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 control-label">Desired username </asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="Username" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                CssClass="text-danger" ErrorMessage="The Username field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password </asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="password" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                CssClass="text-danger" ErrorMessage="The password field is required."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Confirmpassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="Confirmpassword" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Confirmpassword"
                                CssClass="text-danger" ErrorMessage="The Confirm password field is required." />
                            <p><asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ErrorMessage="Password and confirm password mismatched" ControlToCompare="password" ControlToValidate="Confirmpassword" CssClass="text-danger"></asp:CompareValidator></p>
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
                    <h4>Company Details</h4>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="company" CssClass="col-md-2 control-label">Company</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="company" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="company"
                                CssClass="text-danger" ErrorMessage="The company field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="dept" CssClass="col-md-2 control-label">Department</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="dept" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="dept"
                                CssClass="text-danger" ErrorMessage="The department field is required." />
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
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Create" CssClass="btn btn-default" ID="regAgent" OnClick="regAgent_Click"/>
                        </div> 
                    </div>
                </div>
        </div>

        <div class="col-md-4">
                   
       </div>
    </div>
</asp:Content>