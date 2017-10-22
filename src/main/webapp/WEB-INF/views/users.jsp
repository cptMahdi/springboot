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
		<table id="users">
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
					<td class="id"></td>
					<td class="firsName"></td>
					<td class="lastName"></td>
					<td class="login"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="width: 40%; float: right;">
		<form id="formAdd">
			<label>First name:</label><br> <input type="text"
				name="firstName"> <label>Last name:</label><br> <input
				type="text" name="lastName"> <label>Login:</label><br>
			<input type="text" name="login"> <label>Password</label><br>
			<input type="password" name="password">
			<button type="button" onclick="addUser()">Ajouter</button>
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
				// $("#users tbody").empty();
				
				var emptyTr = $("#users tbody tr"); 
				//console.log(emptyTr);  
				// console.log(result);   
				$.each(result,function(){ 
					
					var $row = emptyTr.clone();
					console.log($row.find("td.firsName"));  
					$row.find("td.firsName").text($(this)[0].firsName);
					$row.find("td.lastName").text($(this)[0].lastName);
					$row.find("td.login").text($(this)[0].login);
					$row.find("td.id").text($(this)[0].id);
					$("#users tbody").append( $row );
					
					 // console.log($(this)[0].firsName);  
					 //solution 2
					 var tr = $("<tr>");
					 
					 tr.append( $("<td>").append($(this)[0].id) ); 
					 
					 tr.append( $("<td>").append($(this)[0].firsName) );  
					 
					 tr.append( $("<td>").append($(this)[0].lastName) ); 
					 
					 tr.append( $("<td>").append($(this)[0].login) ); 
					 
					 tr.append( $("<td>").append($(this)[0].password) ); 
					  
					 $("#users tbody").append( tr );
				});
			}

		});
		
		$.fn.serializeObject = function()
		{
		   var o = {};
		   var a = this.serializeArray();
		   $.each(a, function() {
		       if (o[this.name]) {
		           if (!o[this.name].push) {
		               o[this.name] = [o[this.name]];
		           }
		           o[this.name].push(this.value || '');
		       } else {
		           o[this.name] = this.value || '';
		       }
		   });
		   return o;
		};
		
		function addUser() {  
			console.log($("#formAdd").serializeObject()) 
		    $.ajax({
		        type: "POST",
		        contentType: "application/json",
		        url: "/api/user/ajouter", 
		        data: JSON.stringify($("#formAdd").serializeObject()),
		        success: function (data) { 
		        	
		        },
		        error: function (e) { 

		        }
		    });
		}
	</script>
</body>
</html>