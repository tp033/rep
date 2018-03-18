<%@ Page Title="Create Schedule" Language="C#" MasterPageFile="adminMasterPage.Master" AutoEventWireup="true" CodeBehind="createSchedule.aspx.cs" Inherits="maersk.mae_Admin.createSchedule" %>
    

<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent">
     
    
        <link rel="Stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />  
<%--  <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.23/jquery-ui.js"></script>
  
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> 
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

   <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


     <script type="text/javascript">  
         $(document).ready(function () {
        
             $("[id$=vessel]").autocomplete({
                 source: function (request, response) {

                     var param = { ves: $("[id$=vessel]").val() };
                     console.log(request.term)
                     $.ajax({
                         url: "createSchedule.aspx/getVessels",
                         data: "{ 'ves': '" + request.term + "'}",
                         //data: JSON.stringify(param),
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         dataFilter: function (data) { return data },
                         success: function (data) {
                             console.log(data)
                             response($.map(data.d, function (item) {
                                 return {
                                     value: item
                                 }
                             }))
                         },
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                             alert(errorThrown);
                         }
                     });
                 },
                 minLength: 1 //minLength as 2, it means when ever user enter 2 character in TextBox the AutoComplete method will fire and get its source data. 
             });

         });
    </script>  

         <script type="text/javascript">  
         $(document).ready(function () {
        
             $("[id$=from]").autocomplete({
                 source: function (request, response) {

                     var param = { ves: $("[id$=from]").val() };
                     console.log(request.term)
                     $.ajax({
                         url: "createSchedule.aspx/getLocations",
                         data: "{ 'loc': '" + request.term + "'}",
                         //data: JSON.stringify(param),
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         dataFilter: function (data) { return data; },
                         success: function (data) {
                             
                                 response($.map(data.d, function (item) {

                                 return {
                                     value: item
                                 }
                             }))
                         },
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                             alert(errorThrown);
                         }
                     });
                 },
                 minLength: 1 //minLength as 2, it means when ever user enter 2 character in TextBox the AutoComplete method will fire and get its source data. 
             });
             $("[id$=to]").autocomplete({
                 source: function (request, response) {

                     var param = { ves: $("[id$=to]").val() };
                     console.log(request.term)
                     $.ajax({
                         url: "createSchedule.aspx/getLocations",
                         data: "{ 'loc': '" + request.term + "'}",
                         //data: JSON.stringify(param),
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         dataFilter: function (data) { return data; },
                         success: function (data) {

                             response($.map(data.d, function (item) {

                                 return {
                                     value: item
                                 }
                             }))
                         },
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                             alert(errorThrown);
                         }
                     });
                 },
                 minLength: 1 //minLength as 2, it means when ever user enter 2 character in TextBox the AutoComplete method will fire and get its source data. 
             });

         });
    </script>  
      
     <h2><%: Title %>.</h2>
    <div class="row">
        <div class="col-md-12">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Create schedule by completing this form.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="vessel" CssClass="col-md-2 control-label">Vessel</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="vessel" CssClass="form-control" />
                            
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="vessel"
                                CssClass="text-danger" ErrorMessage="The vessel field is required." />
                        </div>
                        </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="from" CssClass="col-md-2 control-label">Sailing route [From]</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="from" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="from"
                                CssClass="text-danger" ErrorMessage="The sailing route from field is required." />
                        </div>
                        </div>
                        <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="frArrdateTime" CssClass="col-md-2 control-label">Route [From] arrival date/time</asp:Label>
                        &nbsp;<div class="col-md-10">
                            <asp:TextBox runat="server" ID="frArrdateTime" CssClass="form-control" EnableTheming="True" TextMode="DateTimeLocal" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="frArrdateTime"
                                CssClass="text-danger" ErrorMessage="The Route [From] arrival date/time field is required." />
                        </div>

                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="frDeptdateTime" CssClass="col-md-2 control-label">Route [From] Depature date/time</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="frDeptdateTime" CssClass="form-control" EnableTheming="True" TextMode="DateTimeLocal"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="frDeptdateTime"
                                CssClass="text-danger" ErrorMessage="The Route [From] depature date/time field is required." />
                             </br>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Arrival date/time must be earlier than departure date/time" 
                               CssClass="text-danger" ControlToCompare="frArrdateTime" ControlToValidate="frDeptdateTime" Operator="GreaterThanEqual"></asp:CompareValidator>
                             </br>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="invalid data: the date/time is later than destination arrival date/time" 
                               CssClass="text-danger" Operator="GreaterThan" ControlToCompare="frDeptdateTime" ControlToValidate="ArrdateTime"></asp:CompareValidator>
                               
                        </div>
                    </div>
                          <div class="form-group">
                         <asp:Label runat="server" AssociatedControlID="to" CssClass="col-md-2 control-label">Sailing route [To]</asp:Label>

                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="to" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="to"
                                CssClass="text-danger" ErrorMessage="The sailing route to field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ArrdateTime" CssClass="col-md-2 control-label">Arrival date/time</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ArrdateTime" CssClass="form-control" EnableTheming="True" TextMode="DateTimeLocal" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ArrdateTime"
                                CssClass="text-danger" ErrorMessage="The arrival date/time field is required." />
                        </div>

                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DeptdateTime" CssClass="col-md-2 control-label">Depature date/time</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="DeptdateTime" CssClass="form-control" EnableTheming="True" TextMode="DateTimeLocal"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DeptdateTime"
                                CssClass="text-danger" ErrorMessage="The depature date/time field is required." />
                            
                            <p>
                            <asp:CompareValidator ID="ArrDeptCompare" runat="server" ErrorMessage="Arrival date/time must be earlier than departure date/time" 
                               CssClass="text-danger" ControlToCompare="ArrdateTime" ControlToValidate="DeptdateTime" Operator="GreaterThanEqual"></asp:CompareValidator>
                                </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="space" CssClass="col-md-2 control-label">Space available</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList runat="server" ID="space" CssClass="form-control" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>10 days</asp:ListItem>
                                <asp:ListItem>20 days</asp:ListItem>
                                <asp:ListItem>30 days</asp:ListItem>
                                <asp:ListItem>40 days</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="space"
                                CssClass="text-danger" ErrorMessage="The space available field is required." />
                        </div>
                    </div>
                      <%--<div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="container" CssClass="col-md-2 control-label">Container Type</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList runat="server" ID="container" CssClass="form-control" >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>20&#39; Dry Standard</asp:ListItem>
                                <asp:ListItem>40&#39; Dry High</asp:ListItem>
                                <asp:ListItem Value="40' Dry Standard"></asp:ListItem>
                                <asp:ListItem>20&#39; Reefer Standard</asp:ListItem>
                                <asp:ListItem>40&#39; Reefer High</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="container"
                                CssClass="text-danger" ErrorMessage="The container type field is required." />
                        </div>
                    </div>--%>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Create" CssClass="btn btn-default" ID="btnCreate" OnClick="btnCreate_Click" />
                        </div>
                    </div>
                </div>
             </section>
        </div>

        <div class="col-md-4">
       </div>
    </div>
</asp:Content>
