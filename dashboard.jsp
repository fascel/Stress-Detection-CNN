<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Dark Admin</title>

    <link rel="stylesheet" type="text/css" href={{url_for('static', filename="bootstrap.min.css")}} />
    
    <link rel="stylesheet" type="text/css" href={{url_for('static', filename="bootstrap.css")}} />
    <link rel="stylesheet" type="text/css" href={{url_for('static', filename="font-awesome.min.css")}} />
    
    <link rel="stylesheet" type="text/css" href={{url_for('static', filename="font-awesome.css")}} />
    <link rel="stylesheet" type="text/css" href={{url_for('static', filename="local.css")}} />

    <script type="text/javascript" src={{url_for('static', filename="jquery-1.10.2.min.js")}}></script>
    <script type="text/javascript" src={{url_for('static', filename="bootstrap.min.js")}}></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <link id="gridcss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    <style type="text/css">
        p{
            color: 'white'
        }
    </style>
</head>
<body>
    <div id="wrapper">
          <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">FR. CRCE MENTORING</a>
                <ul class="nav navbar-nav side-bar myDIV">
                     <li class="side-bar btnd"><a href="last"><span class="fa fa-gear">&nbsp;</span>Back</a></li>
                    <li class="side-bar btnd"><a href="login"><span class="fa fa-gear">&nbsp;</span>Logout</a></li>
               
                  <li class="side-bar btnd"><a href="dashboard"><span class="fa fa-gear">&nbsp;</span>View Dashboard</a></li>
          
                  </ul>
            </div>
        </nav>

        <div>
            
            <div class="row">
                <div class="col-lg-12" >
                    <h1>Dashboard <small>Statistics and more</large></h1>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Pie Chart Readings </h3>
                        </div>
                        <div class="panel-body">
                            <div id="piechart_3d" style="width: 320px; height: 420px;background-color:black"></div>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Tweet Type', 'Number of tweets'],
          ['Positive',  {{ poscount }}],
          ['Negative',  {{ negcount }}]
        ]);
        var options = {
          title: '',
          is3D: true,
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Meter Gauge</h3>
                        </div>
                        <div class="panel-body">
                            <div>
                            <button class="btn btn-primary active" style="  background-color:black;border-color:black;"onclick="myFunction()">Stress Level:<h5 id="demo"></h5></button>
                            
                            </div>
                                
                            <canvas id="canvas" width=470 height=330 style="padding-left:15px;">
                                 </canvas>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gauge.js/1.3.6/gauge.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
                            <script type="text/javascript">
                            function myFunction() {
                            if ({{ negativity }} <= 30 && {{ negativity }} > 0) {
                            var str = "Low Stressed";
                              var result = str.fontcolor("white");
                              document.getElementById("demo").innerHTML = result;}
                                else if ({{ negativity }} <= 60 && {{ negativity }} >30) {
                            var str = "Moderately Stressed";
                              var result = str.fontcolor("white");
                              document.getElementById("demo").innerHTML = result;}
                                else
                                {
                                    var str = "Highly Stressed";
                              var result = str.fontcolor("white");
                              document.getElementById("demo").innerHTML = result;}
                            }
    var cont = $('#canvas');
var gauge = new Gauge(cont.get(0));
var opts = {
    
 	  
    angle: 0.0,
    lineWidth: 0.08,
    radiusScale: 0.8,
    pointer: {
      length: 0.35,
      strokeWidth: 0.03,
      color: '#ccc'
    },
    staticLabels:{
      font:"10px segoe ui",
      color: 'white',
      labels:[0, 30, 60, 100],
      fractionDigits:0
    },
    staticZones: [
       {strokeStyle: "#FFD700", min: 0, max: 30}, 
       {strokeStyle: "#FF8C00", min: 30, max: 60}, 
       {strokeStyle: "#FF0000", min: 60, max: 100} 
    ]
};
gauge.setOptions(opts);
gauge.maxValue = 100;
gauge.animationSpeed = 32;
gauge.set({{ negativity }});

</script>
<p id="result"></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-10">
                    
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Prediction Based on each Tweet data</h3>
                        </div>
                        <div class="panel-body">
                            <div id="chartContainer" style="height: 300px; width: 900px;"></div>
                            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                            <script>
window.onload = function () {
   
var chart = new CanvasJS.Chart("chartContainer", {
  animationEnabled: true,
  theme: "light2",
  title:{
    text: "Prediction value of each Tweet"
  },
  axisY:{
    includeZero: true
  },
  
  data: [{        
    type: "line",       
    dataPoints: [     
      {% for item in yvals %}
                {y:{{item}}},
      {% endfor %}
      { x: {{rows}}}
    ]
  }]
});
chart.render();
}
</script>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <!-- /#wrapper -->

    
</body>
</html>