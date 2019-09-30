<%@ page import="com.lx.Dao.salaryDao"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
	width: 300px;
	height: 100px;
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
.card:nth-child(5){
	background: #00a65a;
}
.card h6{
	color:white;
	margin: 4px 10px;
}
.card p{
	margin: 10px 10px;
}
</style>
	<h3>Summary</h3>
			
	<div class="summary">
		<section>
			<div class="card">
			    <%
					salaryDao dao2 = new salaryDao();
				%>
	            
				<h6>Total salary</h6>
				<p><%=dao2.totsal()%></p>
			</div>
			<div class="card">
				<h6>Total employee</h6>
				<p><%=dao2.totemp()%></p>
			</div>
			<div class="card">
				<h6>Employee(maxsalary)</h6>
				<p><%=dao2.maxemp()%></p>
			</div>
			
		</section>
	</div>
	<div class="summary">
		<div class="container">
			<input type="number" id="hourly" value="<%=dao2.tothourly()%>" disabled hidden>
			<input type="number" id="fixed" value="<%=dao2.totfixed()%>" disabled hidden>
			<input type="number" id="male" value="<%=dao2.male()%>" disabled hidden>
			<input type="number" id="female" value="<%=dao2.female()%>" disabled hidden>
				<canvas id="myChart" width="300px;"></canvas>
				
				</div>
				<div class="container">
				
				<canvas id="myChart1" width="300px;"></canvas>
				</div>
				</div>
				<script type="text/javascript">
		
				
			
				var hourly = document.getElementById("hourly").value;
				var fixed = document.getElementById("fixed").value;
				var ctx = document.getElementById("myChart").getContext('2d');
				var myChart = new Chart(ctx, {
				  type: 'pie',
				  data: {
				    labels: ["Contract employee", "Permanant employee"],
				    datasets: [{
				      backgroundColor: [
				        "#2ecc71",
				        "#3498db",
				        
				      ],
				      data: [hourly,fixed]
				    }]
				  }
				});
				
				
				
				
				</script>
		
				
				<script type="text/javascript">
		
				
			
				var male = document.getElementById("male").value;
				var female = document.getElementById("female").value;
				var ctx = document.getElementById("myChart1").getContext('2d');
				var myChart = new Chart(ctx, {
				  type: 'pie',
				  data: {
				    labels: ["Male employee", "Female employee"],
				    datasets: [{
				      backgroundColor: [
				        "#e74c3c",
				        "#f39c12",
				        
				      ],
				      data: [male,female]
				    }]
				  }
				});
				
				
				
				
				</script>
				
				