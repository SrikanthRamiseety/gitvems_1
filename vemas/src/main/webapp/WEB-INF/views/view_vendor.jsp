
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>table</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/control_2.3.0.js"></script>
<script type="text/javascript">
	$(function() {
		var page = $("#previous").val();
		if (page == 0) {
			$("#previous").addClass("disabled");

		}
		var size1 = $("#hidden").val();
		if (size1 <= 10) {
			$("#previous").hide();
			$("#next").hide();

		}
		var size = $("#hidden").val();
		var number = $("#next").val();

		if (number == Math.round(size / 9)+1) {
			$("#next").addClass("disabled");
		}
		$(".page").click(
				function() {
					var pagenumber = $(this).val();

					$.post("allvendors?pagenumber=" + $(this).val()
							+ "&page=notfirst", show);

					function show(data) {
						$("#show").html(data);
					}
					$(".pa").css("color", "#303030");
				});
	});
</script>
<script type="text/javascript">
$(function(){
	$("#doc").change(function(){
	var type=	$("#doc").val();
	alert("YOUR DATE IS CONVERT TO "+type)
		$.get("excel");		
	});
	
});



</script>
<style type="text/css">
#pagination {
	color: #337AB7;
	background-color: transparent;
	box-sizing: border-box;
	font-family: "Open Sans", sans-serif;
	font-size: 14px;
	text-align: center;
}

.clickable {
	border: 1px;
}

#view {
	overflow: auto;
}

th {
	background-color: silver;
}

.no-line, #no-line {
	border-bottom-style: hidden;
	border-bottom-width: 0em;
	background-color: white;
}

table.collapse.in {
	display: table-row;
}

.btn {
	border-radius: 74px;
}

.active {
	color: aqua;
}

h2 {
	color: red;
}
fieldset {
  border: aqua;
  border-bottom-color: ;
  margin-left: 25%;
  margin-top: -7%;
   
  color: red;
}
</style>

<script type="text/javascript">
	$(function() {
		//	$(".tbl-row").hide();
	});
</script>
</head>
<body>
	<c:if test="${  (fn:length(vlist) eq 0) }">
	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
		<center>
			<h2>Sorry! No Data Found..</h2>
		</center>
	</c:if>
	<c:if test="${  (fn:length(vlist) ne 0) }">
		<input type="hidden" id="hidden" name="hidden"
			value="${vlist.size() }">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>Vendor</h4>

			</div>
			<div class="panel-body" id="vendor-table">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>S.No</th>
							<th>VendorCode</th>
							<th>CompanyName</th>
							<th>Type</th>
							<th>Category</th>
							<th>Address</th>
							<th>Contact #</th>
							<th>Web Site</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach begin="${(param.pagenumber-1) *  10 }" items="${vlist}"
							end="${(param.pagenumber * 10 )-1 }" var="i">
							<tr class="clickable">
								<td><c:out value="${i.getId()}"></c:out></td>
								<td><c:out value="${i.getVendorCode()}"></c:out></td>
								<td><c:out value="${i.getVendorName() }"></c:out></td>
								<td><c:out value="${i.getVendorType()}"></c:out></td>
								<td><c:out value="${i.getVendorCategory() }"></c:out></td>
								<td><c:out value="${i.getVendorAddress()}"></c:out></td>
								<td><c:out
										value="${i.getVendorMobileNumber()}, ${i.getVendorMobileNumber1()},  ${i.getVendorMobileNumber2()}"></c:out></td>
								<td><c:out value="${i.getVendorWebsite()}"></c:out></td>


							</tr>




						</c:forEach>

					</tbody>


				</table>
			</div>
			<div class="row"> 
			<div class="col-md-3"></div>
			<div class="col-md-5">
			<div id="pagination">


				<ul class="pager">

					<li><button class="btn btn-primary btn-sm page "
							value="${(param.pagenumber)-1 }" name="previous" id="previous">Previous</button></li>

					<li><button class="btn btn-primary btn-sm page"
							value="${(param.pagenumber)+1 }" name="next" id="next">next</button></li>

				</ul>
				
				
			</div>
			
			</div>
			 
				 
				<div class="col-md-4">
				Export To
				<fieldset>
				
				<a href="excel">Excel</a>&nbsp;&nbsp;OR 
			   <a href="csv">CSV</a>&nbsp;&nbsp;OR 
			   <a href="pdf" target="_blank">PDF</a>
                </fieldset>            
			 </div>
			 
			 </div>
		 
	</c:if>

</body>
</html>