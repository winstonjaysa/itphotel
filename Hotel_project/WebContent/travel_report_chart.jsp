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
</style>

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
		</section>
	</div>
	<div class="summary">
		<div class="container">
			<input type="number" id="confm" value="<%=dao.reportChart(1)%>" disabled hidden>
			<input type="number" id="pending" value="<%=dao.reportChart(0)%>" disabled hidden>
			<input type="number" id="deny" value="<%=dao.reportChart(2)%>" disabled hidden>
			
			
				<h4><span id="currentMonth">month</span> Taxi request status</h4>
				<canvas id="myChart" height="200px"></canvas>
		</div>
		<div class="container">
				<h4><span id="currentMonth">month</span> Taxi request status</h4>
				<canvas id="myChart" height="200px"></canvas>
		</div>
		
		
	</div>
	<!-- <section>
		<button onclick="my()">Tap</button>
		<p id="id1">fghj</p>
	</section>
	 -->
	
	<script>
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
	</script>

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
		
	</script>