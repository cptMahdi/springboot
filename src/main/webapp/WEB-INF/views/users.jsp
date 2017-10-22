<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>

	<div>
		<table >
			<thead>
				<tr>
					<th>Id</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Login</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>January</td>
					<td>$100</td>
					<td>January</td>
					<td>$100</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="width: 40%; float: right;">
		<form>
			<label>First name:</label><br> <input type="text"
				name="firstName"> <label>Last name:</label><br> <input
				type="text" name="lastName"> <label>Login:</label><br>
			<input type="text" name="login"> <label>Password</label><br>
			<input type="password" name="password">
			<button>Ajouter</button>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous">		
	</script>
	<script type="text/javascript">
		$.ajax({
			url : "/api/user/",
			type : "GET",
			success : function(result) {
				//alert(result);
				console.log(result);
				//effacer le contenu
				$("#users tbody").empty();
				result.each(function(){
				
				});
			}

		});
	</script>
</body>
</html>