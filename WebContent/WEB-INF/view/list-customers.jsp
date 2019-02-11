<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
<title>List Customers</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>

</head>
<body>
<div id="wrapper">
	<div id="header">
		<h2>CRM-Customer RelationShip Manger</h2>
	</div>
</div>
	<div  id="container">
			<div id="content">
		
		<!-- new button for add -->
		<table>
		<tr>
			<td>
				<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
			</td>
			<td>
			<!--  add a search box -->
            <form:form action="search" method="POST">
                Search customer: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>
			
			
			</td>
		</tr>
		</table>
				<table>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					<c:forEach var="tempCustomer" items="${customers}">
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
						<tr>
							<td>${tempCustomer.firstName}</td>
							<td>${tempCustomer.lastName}</td>
							<td>${tempCustomer.email}</td>
							<td><a href="${updateLink}">Update</a> | <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this Customer?'))) return false;">Delete</a></td>
						</tr>
					</c:forEach>			
				</table>
			</div>
	</div>
</body>
</html>