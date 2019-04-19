<%-- 
    Document   : graph
    Created on : 8 Jan, 2018, 10:37:09 AM
    Author     : Admin
--%>

<%@page import="model.MyDB"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        
             
        <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Style the buttons */


/* Style the active class, and buttons on mouse-over */
.active, .btnd:hover {
    background-color: #0BA61C;
    color: green;
}
</style>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <link rel="stylesheet" href="newcss.css">

      
          
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
          
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
              <link href="asset/css/bootstrap.min.css" rel="stylesheet">
              <link href="css/bootstrap.css" rel="stylesheet">
      

        <title>JSP Page</title>
        
        
        
      
        
                <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
                <SCRIPT type="text/javascript">
   /* window.history.forward();
    function noBack() { window.history.forward(); }
    
    function placeOrder(form) {
               
                        form.submit();
                      
                  
                } 
            */
</SCRIPT>
           <style>
               
                    body {
               
                height: 100%;
  background-size: cover;
  background-image: url("mentor.jpg");
   margin: 0;
  background-repeat: no-repeat;
  background-attachment: fixed;
 
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
                      .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 9px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
.container3 {
        margin: 20px auto 100px ;
	width:auto;
        padding-top: 0px;
        
}
           
            .button5 {
    background-color: white;
    color: black;
    border: 2px solid #555555;
}

.button5:hover {
    background-color: #555555;
    color: white;
}
</style> 


  <script>
// Add active class to the current button (highlight it)
var header = document.getElementById("sidebar");
var btns = header.getElementsByClassName("side-bar");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>



    </head>
  <BODY onload="noBack();"
      onpageshow="if (event.persisted) noBack();">
            
       
             <%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
             
             
              <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand page-scroll" href="#page-top">FR. CRCE MENTORING</a>
    </div>
  <!-- <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span>Hello Admin</a></li>
        <li class="active"><a title="View Website" href="#"><span class="glyphicon glyphicon-globe"></span></a></li>
        <li><a href="#">Logout</a></li>
      </ul>
    </div>-->
  </div>
            
            
            <div class="collapse navbar-collapse">
      
      
    <div id="sidebar">
      <div class="container-fluid tmargin">
        <div class="input-group">
          
          <span class="input-group-btn">
              
          </span>
        </div>
      </div>

         
        
      <ul class="nav navbar-nav side-bar myDIV">
       <!-- <li class="side-bar tmargin btnd"><a href="register.jsp"><span class="glyphicon glyphicon-list">&nbsp;</span>Register</a></li>
        <li class="side-bar btnd"><a href="addmarks.jsp"><span class="glyphicon glyphicon-flag">&nbsp;</span>Add Marks</a></li>
   -->     <li class="side-bar btnd active"><a href="first.jsp"><span class="glyphicon glyphicon-star">&nbsp;</span>View Students</a></li>
    <!--     <li class="side-bar btnd"><a href="addadmin.jsp"><span class="glyphicon glyphicon-certificate">&nbsp;</span>Add Admin</a></li>
        <li class="side-bar btnd"><a href="del.jsp"><span class="glyphicon glyphicon-signal">&nbsp;</span>Delete Student</a></li>
     -->   <li class="side-bar btnd"><a href="LogoutServlet.do"><span class="glyphicon glyphicon-cog">&nbsp;</span>Logout</a></li>

      </ul>         
    </div>
             
    </div>
            
            
</nav>
             
             
             
             
             <%
           /*   if(session.getAttribute("email")==null){
                     response.sendRedirect("loginn.jsp");
                }*/
%> 
      
        <%
            String email = request.getParameter("email");
            //String email= "nigel@gmail.com";
            out.println(email);
            String session1 = (String)session.getAttribute("session");
             if(session1=="TRUE")
            {  
            %>
             
        
        
            
          
            <%}if(session1=="TRUEE")
            {  
            %>
                    
            
              
            
             
      
        
   
            
             
       
     
    
      

            <%}%>
            
            <div class="container-fluid">
                
                            
                    <div class="col-md-3">

      
       
  </div>
                <div class="col-md-9 animated bounce">
        <form role="form"  method="post" action=" ">
        <center><input type="submit" class="button button5" value="View Progress"></center>
        </form>
         <form role="form"  method="post" action="/last">
        <center><input type="submit" class="button button5" value="Analyze Stress"></center>
        </form>
        <br>
        <br>
        <table border="2" class="table table table-responsive">
    <thead class="thead-default">
   <tr>
        <td>Date</td>
        <td>Physics</td>
        <td>Chemistry</td>
        <td>Maths</td>
        <td>Biology</td>
   </tr>
    </thead>
    <tbody>
    <%
   String date="";
   String physics = "";
   String chemistry = "";
    String biology = "";
    String maths = "";
    String name="";
    String contact="";
    String address="";
    String dob="";
    String course="";
    String grade="";
    String subjects="";
    boolean phys,chem,bio,math;
        java.sql.Connection con = null;
   try {
        
           MyDB db = new MyDB();
           con =db.getCon();
     
        Statement smt = con.createStatement(); //Create Statement to interact
                Statement smt1 = con.createStatement(); //Create Statement to interact
        ResultSet r1 = smt1.executeQuery("select * from `STUDENT` where EMAIL like '%"+email+"%'" );
        while (r1.next()) {
            name = r1.getString(1);
            contact= r1.getString(2);
            address= r1.getString(3);
            dob= r1.getString(5);
            course= r1.getString(6);
            grade= r1.getString(7);
            phys= r1.getBoolean(8);
            chem= r1.getBoolean(9);
            math= r1.getBoolean(10);
            bio= r1.getBoolean(11);

            if(phys)
                subjects= (new StringBuilder()).append("Physics"+"  ").toString();
            if(bio)
                subjects= (new StringBuilder()).append("Biology"+"  ").toString();
            if(math)
                subjects= (new StringBuilder()).append("Mathematics"+"  ").toString();
            if(chem)
                subjects= (new StringBuilder()).append("Chemistry"+"  ").toString();

        }
        %>
    <h4><b>Name:</b><%out.println(name);%></h4> 
    <h4><b>Contact:</b><%out.println(contact);%></h4> 
    <h4><b>Address:</b><%out.println(address);%></h4> 
    <h4><b>Date of Birth:</b><%out.println(dob);%></h4> 
    <h4><b>Course:</b><%out.println("Computer Engineering");%></h4> 
    <h4><b>Grade:</b><%out.println("Third Year");%></h4> 
    <!--<h4><b>Subjects:</b><% /* out.println(subjects); */ %></h4> -->
    <br>
        <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

     <%   ResultSet r = smt.executeQuery("select * from `TABLESSS` where EMAIL_ID like '%"+email+"%'" );
        
        
        while (r.next()) {
          date = r.getString(2);
          physics=r.getString(3);
          chemistry= r.getString(4);   
          maths= r.getString(5);   
           biology= r.getString(6);
         
       
%>
    
<tr><td><%out.println(date); %></td>
                 <td><%out.println(physics); %></td>  <td><%out.println(chemistry); %></td><td><%out.println(maths); %></td>  <td><%out.println(biology); %></td></tr>
       <%
          
        }
        %>
    </tbody>   </table>
        
    <%    con.close();
   } catch (Exception e) {
        e.printStackTrace();
   }
%>
   </ul>
            
            </div>
   
   </div>
            

 <script src="asset/js/bootstrap.min.js"></script>
        </body>
</html>
