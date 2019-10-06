<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>


<style>

body, html {
/*	font-family: 'Montserrat', sans-serif;*/
}

a {
	text-decoration: none;
}

h4 {
	text-align: center;
	margin-top: 0px;
	margin-bottom: 5px;
	cursor: default;
}
.summary section {
	display: flex;
	flex-wrap: wrap;
}
.ui-tabs-anchor {
	outline: none;
	width: 1200px;
	height: 800px;
	s
}

.container canvas {
	height: 500px;
}

.container {
	width: 420PX;
	height: 330px !important;
	padding: 15px;
	background: #f2f5fb;
	margin: 10px 10px;
}
.summary{
	position:relative;
	display:flex;
	flex-wrap:wrap;
	width:100%;
	top:10px;
	left:50px;
	margin-bottom: 50px;
}

.card{
	display:block;
	width: 200px;
	height: 70px;
	min-height: 70px;
	padding: 5px 10px;
	margin: 10px;
}
.card:nth-child(1){
	background: #f39c12;
}
.card:nth-child(2){
	background: #00a65a;
}
.card:nth-child(3){
	background: #dd4b39;
}
.card:nth-child(4){
	background: #00c0ef;
}
.card h6{
	color:white;
	margin: 4px 10px;
}
.card p{
	margin: 10px 10px;
}

button.print-button {
  width: 60px;
  height: 60px;
}
span.print-icon, span.print-icon::before, span.print-icon::after, button.print-button:hover .print-icon::after {
  border: solid 4px #333;
}
span.print-icon::after {
  border-width: 2px;
}

button.print-button {
  position: relative;
  padding: 0;
  border: 0;
  
  border: none;
  background: transparent;
}

span.print-icon, span.print-icon::before, span.print-icon::after, button.print-button:hover .print-icon::after {
  box-sizing: border-box;
  background-color: #fff;
}

span.print-icon {
  position: relative;
  display: inline-block;  
  padding: 0;
  margin-top: 20%;

  width: 60%;
  height: 35%;
  background: #fff;
  border-radius: 20% 20% 0 0;
}

span.print-icon::before {
  content: " ";
  position: absolute;
  bottom: 100%;
  left: 12%;
  right: 12%;
  height: 110%;

  transition: height .2s .15s;
}

span.print-icon::after {
  content: " ";
  position: absolute;
  top: 55%;
  left: 12%;
  right: 12%;
  height: 0%;
  background: #fff;
  background-repeat: no-repeat;
  background-size: 70% 90%;
  background-position: center;
  background-image: linear-gradient(
    to top,
    #fff 0, #fff 14%,
    #333 14%, #333 28%,
    #fff 28%, #fff 42%,
    #333 42%, #333 56%,
    #fff 56%, #fff 70%,
    #333 70%, #333 84%,
    #fff 84%, #fff 100%
  );

  transition: height .2s, border-width 0s .2s, width 0s .2s;
}

button.print-button:hover {
  cursor: pointer;
}

button.print-button:hover .print-icon::before {
  height:0px;
  transition: height .2s;
}
button.print-button:hover .print-icon::after {
  height:120%;
  transition: height .2s .15s, border-width 0s .16s;
}

.print-button,h3{

 display: inline-block;
 margin-left:270px;
padding-left:160px;
}

</style>
<div id="reportmain" >
	<div class="summary">
		<section>
			<div class="card">
				<h6>Gross profit </h6>
				<p><%=dao.costSum() %></p>
			</div>
			<div class="card">
				<h6>Total visitors </h6>
				<p><%=dao.totUsers() %></p>
			</div>
			<div class="card">
				<h6>Total Requests </h6>
				<p><%=dao.totReq() %></p>
			</div>
			<div class="card">
				<h6>Unread messages </h6>
				<p><%=dao.reportChartTidCount("unread") %></p>
			</div>
			
			<button onclick="print()" class="print-button"><span class="print-icon"></span></button>
		</section>
	</div>
	<div class="summary" >
		<div class="container">
			<input type="number" id="confm" value="<%=dao.reportChart(1)%>" disabled hidden>
			<input type="number" id="pending" value="<%=dao.reportChart(0)%>" disabled hidden>
			<input type="number" id="deny" value="<%=dao.reportChart(2)%>" disabled hidden>
			
			
				<h4><span id="currentMonth">month</span> Taxi request status</h4>
				<canvas id="myChart" height="200px"></canvas>
		</div>
		<div class="container">
			<input type="number" id="y_confm" value="<%=dao.reportChart_yearly(1)%>" disabled hidden>
			<input type="number" id="y_pending" value="<%=dao.reportChart_yearly(0)%>" disabled hidden>
			<input type="number" id="y_deny" value="<%=dao.reportChart_yearly(2)%>" disabled hidden>
			
			<h4><span >2019</span> Taxi request status</h4>
				<canvas id="y_myChart" height="200px"></canvas>
		</div>
		
		
	</div>
</div>
	<!-- <section>
		<button onclick="my()">Tap</button>
		<p id="id1">fghj</p>
	</section>
	 -->
	
	<script>
		//mothly
		var conf = document.getElementById("confm").value;
		var pending = document.getElementById("pending").value;
		var deny = document.getElementById("deny").value;
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ 'Confirm', 'Pending', 'Deny' ],
						datasets : [ {
							label : '# of Votes',
							data : [ conf, pending, deny ],
							backgroundColor : [
							//'rgba(255, 99, 132, 0.2)',
							'rgba(204, 246, 228, 0.3)',
							//'rgba(54, 162, 235, 0.2)',
							'rgba(253, 230, 216, 0.3)',
							//'rgba(255, 206, 86, 0.2)',
							'rgba(253, 216, 239, 0.3)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [
							//'rgba(255, 99, 132, 1)',
							'rgba(38, 134, 78, 1)',
							//'rgba(54, 162, 235, 1)',
							'rgba(201, 102, 50, 1)',
							//'rgba(255, 206, 86, 1)',
							'rgba(222, 11, 142, 1)', 'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
		
		//year
		var y_conf = document.getElementById("y_confm").value;
		var y_pending = document.getElementById("y_pending").value;
		var y_deny = document.getElementById("y_deny").value;
		var y_ctx = document.getElementById('y_myChart').getContext('2d');
		var y_myChart = new Chart(y_ctx,
				{
					type : 'bar',
					data : {
						labels : [ 'Confirm', 'Pending', 'Deny' ],
						datasets : [ {
							label : '# of Votes',
							data : [ y_conf, y_pending, y_deny ],
							backgroundColor : [
							//'rgba(255, 99, 132, 0.2)',
							'rgba(204, 246, 228, 0.3)',
							//'rgba(54, 162, 235, 0.2)',
							'rgba(253, 230, 216, 0.3)',
							//'rgba(255, 206, 86, 0.2)',
							'rgba(253, 216, 239, 0.3)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [
							//'rgba(255, 99, 132, 1)',
							'rgba(38, 134, 78, 1)',
							//'rgba(54, 162, 235, 1)',
							'rgba(201, 102, 50, 1)',
							//'rgba(255, 206, 86, 1)',
							'rgba(222, 11, 142, 1)', 'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
		
	</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		document.getElementById("ggg").innerHTML = document
				.getElementById("confm").value;
		var x = 0;
		document.getElementById("dem").innerHTML = x;
		
		function my(){
			
			document.getElementById("id1").innerHTML=12;
		}
		
		//get Current month
		//window.onload=getMonth;
		 function getmonth() {
			  var month = new Array();
			  month[0] = "January";
			  month[1] = "February";
			  month[2] = "March";
			  month[3] = "April";
			  month[4] = "May";
			  month[5] = "June";
			  month[6] = "July";
			  month[7] = "August";
			  month[8] = "September";
			  month[9] = "October";
			  month[10] = "November";
			  month[11] = "December";

			  var d = new Date();
			  var n = month[d.getMonth()];
			  document.getElementById("currentMonth").innerHTML = n;
			}
		//**************
		
		
		
		function print(){
					//  alert("nfjn");
					  var data = document.getElementById("reportmain");  
					  html2canvas(data).then(canvas => {  
					    // Few necessary setting options  
					    var imgWidth = 208;   
					    var pageHeight = 295;    
					    var imgHeight = canvas.height * imgWidth / canvas.width;  
					    var heightLeft = imgHeight;  

					    const contentDataURL = canvas.toDataURL('image/png')  
					    let pdf = new jsPDF('p', 'mm', 'a4'); // A4 size page of PDF  
					    var position = 0;  
					    pdf.addImage(contentDataURL, 'PNG', 0, position, imgWidth, imgHeight)  
					    pdf.save('suppliers.pdf'); // Generated PDF   
					  });  
					}
				
	</script>