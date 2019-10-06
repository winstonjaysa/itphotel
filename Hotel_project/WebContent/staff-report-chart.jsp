<%@ page import="com.lx.Dao.salaryDao"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

h5{

margin-left:100px;

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
<div id="reportmain">
    <br>

	<h3>Summary Report</h3>
	
	<button onclick="print()" class="print-button"><span class="print-icon"></span></button>
    
	<br>
	
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
			<h5>Types of Employee</h5>
			<br>
				<canvas id="myChart" width="300px;"></canvas>
				
				</div>
				<div class="container">
				<h5>Employee Gender</h5>
			    <br>
				<canvas id="myChart1" width="300px;"></canvas>
				
				</div>
				
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
				
				<script>
				
				
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
	
				