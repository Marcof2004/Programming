<!DOCTYPE html>
		
<html>
<head>
		<meta charset='utf-8'>
		<meta http-equiv='XUA-Compatible' content='IE=edge'>
		<meta name='viewport' content='width-device-width, initial-scale=1' 
		<title>Administrator</title>
		<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' integrity='sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u' crossorigin='anonymous'>

		<!--FontAwesome-->
		<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
		<!--Custom CSS--> 
		<link rel='stylesheet' href='css/style.css'>	
	</head>
	<body>
		<nav class = 'navbar navbar-inverse navbar-fixed-top'>
				<div class = 'container-fluid'>
					
					<div id = 'navbar' class = 'navbar-collapse collapse'>
						<ul class = 'nav navbar-nav'>
							<li><a href = 'Dynamic Page.php'>Beef Market Home</a></li>
							<li><a href = 'admin.php'>Administrator</a></li>
						</ul>
					</div>
				</div>
		</nav>	
		<form>
			<div class='displayd'>
			<label for='name'>Nombre del Producto</label>
			<input id="name" name="name" type="text">
			<label for='price'>Precio del Producto</label>
			<input id="price" name="price" type="text">
			<label for='price'>Descripcion del Producto</label>
			<input id="description" name="description" type="text">
			<button type='submit'>Añadir Producto</button>
			<div>
		</form>
		
			<!--Javascript-->
			
			<!--JQUERY-->
			<script src='https://code.jquery.com/jquery-3.1.0.min.js' integrity='sha256-cCueBR6CsyA4/9szpPfrX3s49M9vUU5BgtiJj06wt/s=' crossorigin='anonymous'></script>
			
			<!--Bootstrap Java-->
			<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' integrity='sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa' crossorigin='anonymous'></script>
			<!--My Java-->
		<style>
			html{
					overflow-y:scroll;
			}	
			.displayd{
					padding-top:4%;
			}	
		</style>	
		
		
	</body>
</html>
