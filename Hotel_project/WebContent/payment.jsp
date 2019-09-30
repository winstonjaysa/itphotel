<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CSS Credit Card payment form</title>

  <meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/eventstyle.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>
</head>
<body>
<!-- partial:index.partial.html -->


<%@include file="naviBar-user.jsp" %>
<div class="main">
<div class="main">
	<form action="">
		
		<div class="card group">

				<div class="card-front">
					<input type="text" placeholder="Bank name" class="bank-name" />
					<div class="card-num">
						<input class="inputs" type="text" maxlength="4" placeholder="1234" pattern="[0-9]{4}" />
						<input class="inputs" type="text" placeholder="1234" maxlength="4" pattern="[0-9]{4}" />
						<input class="inputs" type="text" placeholder="1234" maxlength="4" pattern="[0-9]{4}" />
						<input class="inputs" type="text" placeholder="1234" maxlength="4" pattern="[0-9]{4}" />
					</div>
					<input type="text" placeholder="Card holder" class="holder-name" />
					<div class="exp-date">
						<input class="inputs" pattern="[0-9]{2}" placeholder="12" type="text" maxlength="2" />
						<input class="inputs" pattern="[0-9]{2}" placeholder="12" type="text" maxlength="2" />
					</div>
					<div class="sign"></div>
				</div>

				<div class="card-back">
					<div class="magnet"></div>
					<input class="inputs" placeholder="CVC" type="text" maxlength="3" pattern="[0-9]{3}" />
				</div>

		</div>
		<div class="submit">
			<input type="submit" value="Submit" />
		</div>

	</form>
</div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script  src="./script.js"></script>

</body>
</html>