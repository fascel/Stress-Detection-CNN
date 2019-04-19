

<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form role="form" action="NewServlet.do"  method="post">
           <div class="form-group">
            <label for="course">Course</label>                     
            
            <select name="course" id="course">
            <option>IB</option>
            <option>IGCSE</option>
            <option>ICSE</option>
            <option>CBSE</option>
            </select>
            </div>
            <div class="form-group">
            <label for="grade">Grade</label>                     
            
            <select name="grade" id="grade">
            <option>7th</option>
            <option>8th</option>
            <option>9th</option>
            <option>10th</option>
            </select>
            </div>
        
        <input type="submit" value="Submit" />
        </form>
    </body>
</html>

<!--
<!DOCTYPE html>
<html>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
<body>

<h1>The XMLHttpRequest Object</h1>

<form action=""> 

     <label for="course">Course</label>                     
            <div class="form-group">
            <select name="course" id="course" onchange="showCustomer(this.value)">
                <option value="">Select a course:</option>
            <option value="IB">IB</option>
            <option VALUE="IGCSE">IGCSE</option>
            <option VALUE="ICSE">ICSE</option>
            <option VALUE="CBSE">CBSE</option>
            </select>
            </div>
         <!--   <div class="form-group">
            <label for="grade">Grade</label>                     
            
            <select name="grade" id="grade"  onchange="showCustomer(this.value)">
            <option VALUE="7">7th</option>
            <option VALUE="8">8th</option>
            <option VALUE="9">9th</option>
            <option VALUE="10">10th</option>
            </select>
            </div>
</form>
<br>
<div id="txtHint">Customer info will be listed here...
 
</div>

<script>
function showCustomer(str) {
  var xhttp;    
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "NewServlet.do", true);
  xhttp.send();
}
</script>

</body>
</html>
-->


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
body{
    background-color: #FFF
}
html{
       padding-top: 100px;
}
</style>
        
        <title>FRCRCE MENTORING</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

          <link rel="stylesheet" href="newcss.css"> 
                  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

          
          
          
          <link href="asset/css/bootstrap.min.css" rel="stylesheet">
          <link href="css/bootstrap.css" rel="stylesheet">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
       <!-- <script>
            $(document).ready(function(){
                $('#submit').on("click",function() {
                 //$("#course").change(function(){
                     var value = $('#course').val();
                      var value1 = $('#grade').val();
                     $.get("data.jsp",{course:value,grade:value1},function(data){
                      $("#javaquery").html(data);
                     });
                 });
             });
        </script> -->
          

        
        <style>
            
            
            body {
                 height: 100%;
                
  
   margin: 0;
  background-repeat: no-repeat;
  background-attachment: fixed;
                
 background-size: cover;
  background-image: url("mentor.jpg");
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
            .form-group{
                
                color: black;
            }
            
            .text{
                color: black;
            }
            #submit{
                color: black;
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
        
        
        
    </head>
    <body>
       <!-- <%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
             <%/*
                if(session.getAttribute("email")==null){
                     response.sendRedirect("loginn.jsp");
                }*/
%> -->
        <div class="wrapper">
        
        
        
        
         <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">FR. CRCE MENTORING</a>
      <ul class="nav navbar-nav side-bar myDIV">
        <!--  <li class="side-bar tmargin btnd"><a href="register.jsp"><span class="glyphicon glyphicon-list">&nbsp;</span>Register</a></li>
      -->    <!-- <li class="side-bar btnd"><a href="addmarks.jsp"><span class="glyphicon glyphicon-flag">&nbsp;</span>V Marks</a></li>--> 
         <!--<li class="side-bar btnd active"><a href="first.jsp"><span class="glyphicon glyphicon-star">&nbsp;</span>View Students</a></li>-->
     <!--     <li class="side-bar btnd"><a href="addadmin.jsp"><span class="glyphicon glyphicon-certificate">&nbsp;</span>Add Admin</a></li>
          <li class="side-bar btnd"><a href="del.jsp"><span class="glyphicon glyphicon-signal">&nbsp;</span>Delete Student</a></li>
          
     -->     <li class="side-bar btnd"><a href="first"><span class="glyphicon glyphicon-cog">&nbsp;</span>Back</a></li>
     -->     <li class="side-bar btnd"><a href="login"><span class="glyphicon glyphicon-cog">&nbsp;</span>Logout</a></li>
	
		 
        </ul>
    </div>
  <!-- <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span>Hello Admin</a></li>
        <li class="active"><a title="View Website" href="#"><span class="glyphicon glyphicon-globe"></span></a></li>
        <li><a href="#">Logout</a></li>
      </ul>
    </div>-->
  </div>
		<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
		<script> zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];</script></head>
    <style>
            html, body {
  height:100%;
  width:100%;
}
 
#myChart {
  height:100%;
  width:100%;
  min-height:150px;
}
.zc-ref {
  display: none;
}
        </style>
        <body>
		<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/">Charts by ZingChart</a></div>
	</body>
        <script>
           window.feed = function(callback) {
  var tick = {};
  tick.plot0 = {{ negativity }} ;
  callback(JSON.stringify(tick));
};
 
var myConfig = {
 	type: "gauge",
 	globals: {
 	  fontSize: 25
 	},
 	plotarea:{
 	  marginTop:60
 	},
 	plot:{
 	  size:'100%',
 	  valueBox: {
 	    placement: 'center',
 	    text:'%v', //default
 	    fontSize:35,
 	    rules:[
 	      {
 	        rule: '%v >= 60',
 	        text: '%v<br>Highly Stressed'
 	      },
 	      {
 	        rule: '%v < 60 && %v > 30',
 	        text: '%v<br>Moderately Stressed'
 	      },
 	      {
 	        rule: '%v <= 30 && %v > 0',
 	        text: '%v<br>Low Stressed'
 	      } 
 	    ]
 	  }
 	},
  tooltip:{
    borderRadius:5
  },
 	scaleR:{
	  aperture:180,
	  minValue:0,
	  maxValue:100,
	  step:50,
	  center:{
	    visible:false
	  },
	  tick:{
	    visible:false
	  },
	  item:{
	    offsetR:0,
	    rules:[
	      {
	        rule:'%i == 9',
	        offsetX:15
	      }
	    ]
	  },
	  labels:['0','50','100'],
	  ring:{
	    size:75,
	    rules:[
                {
	        rule:'%v <= 30 && %v > 0',
	        backgroundColor:'#FFFF00'
	      },
              {
	        rule:'%v < 60 && %v > 30',
	        backgroundColor:'#FF4500'
	      },
	      {
	        rule:'%v >= 60',
	        backgroundColor:'#FF0000'
	      }
	      
	           
	    ]
	  }
 	},
  refresh:{  
      type:"feed",
      transport:"js",
      url:"feed()",
      interval:1500,
  
  },
	series : [
		{
			values : [0], // starting value
			backgroundColor:'black',
	    indicator:[10,10,10,10,0.1],
	    animation:{  
        effect:2,
        method:1,
        sequence:4,
        speed: 900
     },
		}
	]
};
 
zingchart.render({ 
	id : 'myChart', 
	data : myConfig, 
	height: 1000, 
	width: '100%'
});
</script>

</html>
