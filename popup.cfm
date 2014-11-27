<!doctype html>
<html lang="en">
<head>

<style>
table {
    width:50%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
	
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
	
    background-color: gray;
    color: white;
}

#t01 {
	margin-left:115px;
    width:350px;
    float:left;
    padding:10px;
	margin-top: 62px;
}

#t02 {
	margin-top: 80px;
	margin-left:258px;
    width:350px;
    float:left;
    padding:10px;	      
}

</style>


  <meta charset="utf-8">
  <title>Fail attempts</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
 <style type="text/css">
#container {
  text-align:center;
  padding:5px;
  
}
#containerLeft {
  line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px; 
  }
  
#containerRight {
	width:350px;
    float:left;
    padding:10px;
  }  
  
 </style>





<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<div id="container">
</div>



</head>
<body>


 
<table id="t02">
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Attempts</th>
  </tr>
  <tr>
     <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>36</td>
  </tr>
  <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>32</td>
  </tr>
  <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>30</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>28</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>28</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>24</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>20</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>17</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>6</td>
  </tr>
</table>

<br>

<table id="t01">
  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Attempts</th>
  </tr>
  <tr>
     <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>36</td>
  </tr>
  <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>32</td>
  </tr>
  <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>30</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>28</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>28</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>24</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>20</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>17</td>
  </tr>
   <tr>
    <td>Nikolaos Hadjis</td>
        <td>hadjis.doe@example.com</td>
        <td>6</td>
  </tr>
</table>
</div>



<!-- <button id="create-user">Next Page</button> -->



 <script>
var chart1;

$(document).ready(function () {
    $('#container').highcharts({
        chart: {
            type: 'spline'
        },
        title: {
            text: 'User detail for the last 24 hours'
        },
       
        xAxis: {
            title: {
        enabled: true,
        text: 'Hours of the Day'
    },
    type: 'datetime',

    dateTimeLabelFormats : {
        hour: '%I %p',
        minute: '%I:%M %p'
    }
        },
        yAxis: {
            title: {
                text: 'Number of attempts'
            },
            min: 0
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br>',
            pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'
        },

        series: [{
            name: 'Fail attempts',
            // Define the data points. All series have a dummy year
            // of 1970/71 in order to be compared on the same x axis. Note
            // that in JavaScript, months start at 0 for January, 1 for February etc.
            data: [
                [Date.UTC(1970,  9, 27), 0   ],
                [Date.UTC(1970, 10, 10), 0.6 ],
                [Date.UTC(1970, 10, 18), 0.7 ],
                [Date.UTC(1970, 11,  2), 0.8 ],
                [Date.UTC(1970, 11,  9), 0.6 ],
                [Date.UTC(1970, 11, 16), 0.6 ],
                [Date.UTC(1970, 11, 28), 0.67],
                [Date.UTC(1971,  0,  1), 0.81],
                [Date.UTC(1971,  0,  8), 0.78],
                [Date.UTC(1971,  0, 12), 0.98],
                [Date.UTC(1971,  0, 27), 1.84],
                [Date.UTC(1971,  1, 10), 1.80],
                [Date.UTC(1971,  1, 18), 1.80],
                [Date.UTC(1971,  1, 24), 1.92],
                [Date.UTC(1971,  2,  4), 2.49],
                [Date.UTC(1971,  2, 11), 2.79],
                [Date.UTC(1971,  2, 15), 2.73],
                [Date.UTC(1971,  2, 25), 2.61],
                [Date.UTC(1971,  3,  2), 2.76],
                [Date.UTC(1971,  3,  6), 2.82],
                [Date.UTC(1971,  3, 13), 2.8 ],
                [Date.UTC(1971,  4,  3), 2.1 ],
                [Date.UTC(1971,  4, 26), 1.1 ],
                [Date.UTC(1971,  5,  9), 0.25],
                [Date.UTC(1971,  5, 12), 0   ]
            ]
        }, {
            name: 'Forgotten',
            data: [
                [Date.UTC(1970,  9, 18), 0   ],
                [Date.UTC(1970,  9, 26), 0.2 ],
                [Date.UTC(1970, 11,  1), 0.47],
                [Date.UTC(1970, 11, 11), 0.55],
                [Date.UTC(1970, 11, 25), 1.38],
                [Date.UTC(1971,  0,  8), 1.38],
                [Date.UTC(1971,  0, 15), 1.38],
                [Date.UTC(1971,  1,  1), 1.38],
                [Date.UTC(1971,  1,  8), 1.48],
                [Date.UTC(1971,  1, 21), 1.5 ],
                [Date.UTC(1971,  2, 12), 1.89],
                [Date.UTC(1971,  2, 25), 2.0 ],
                [Date.UTC(1971,  3,  4), 1.94],
                [Date.UTC(1971,  3,  9), 1.91],
                [Date.UTC(1971,  3, 13), 1.75],
                [Date.UTC(1971,  3, 19), 1.6 ],
                [Date.UTC(1971,  4, 25), 0.6 ],
                [Date.UTC(1971,  4, 31), 0.35],
                [Date.UTC(1971,  5,  7), 0   ]
            ]
        }, {
            name: 'Changed',
            data: [
                [Date.UTC(1970,  9,  9), 0   ],
                [Date.UTC(1970,  9, 14), 0.15],
                [Date.UTC(1970, 10, 28), 0.35],
                [Date.UTC(1970, 11, 12), 0.46],
                [Date.UTC(1971,  0,  1), 0.59],
                [Date.UTC(1971,  0, 24), 0.58],
                [Date.UTC(1971,  1,  1), 0.62],
                [Date.UTC(1971,  1,  7), 0.65],
                [Date.UTC(1971,  1, 23), 0.77],
                [Date.UTC(1971,  2,  8), 0.77],
                [Date.UTC(1971,  2, 14), 0.79],
                [Date.UTC(1971,  2, 24), 0.86],
                [Date.UTC(1971,  3,  4), 0.8 ],
                [Date.UTC(1971,  3, 18), 0.94],
                [Date.UTC(1971,  3, 24), 0.9 ],
                [Date.UTC(1971,  4, 16), 0.39],
                [Date.UTC(1971,  4, 21), 0   ]
            ]
        }]
    }).setOptions(Highcharts.theme);
});
</script>



</body>
</html>