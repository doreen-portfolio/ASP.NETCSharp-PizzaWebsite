<%@ Application Language="C#" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        //Jquery
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
        new ScriptResourceDefinition
        {
            Path = "~/scripts/jquery-2.1.0.min.js",
            DebugPath = "~/scripts/jquery-2.1.0.js",
            CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-2.1.0.min.js",
            CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-2.1.0.js"
        });
        
        // Faking adding users if they don't exist
        MembershipCreateStatus status;

        if (!Roles.RoleExists("admin"))
        {
            Roles.CreateRole("admin");
            Membership.CreateUser("admin1", "P@$$w0rd", "admin@maryspizzeria.ca", "Question", "Answer", true, out status);
            Roles.AddUsersToRoles(new string[] { "admin1" }, new string[] { "admin" });
        }
        if (!Roles.RoleExists("sales"))
        {
            Roles.CreateRole("sales");
            Membership.CreateUser("sales1", "P@$$w0rd", "sales@maryspizzeria.ca", "Question", "Answer", true, out status);
            Roles.AddUsersToRoles(new string[] { "sales1" }, new string[] { "sales" });
        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
