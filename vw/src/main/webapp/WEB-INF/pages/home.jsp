<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.ibm.poc.vw.languages.text" />

<!DOCTYPE html>
<html lang="${language}">
  <head>
    <title>Parts On Command</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/css/bootstrap-select.min.css">
	
	<link href="resources/css/navbar-static-top.css" rel="stylesheet" media="screen">
  </head>


  <body>
    <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Parts on Command</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#"><fmt:message key="header.home"/></a></li>

            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="header.information"/><span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a data-toggle="tab" href="#concesionarias"><fmt:message key="header.information.dealer"/></a></li>
                <li><a data-toggle="tab" href="#material"><fmt:message key="header.information.materials"/></a></li>
                <li><a data-toggle="tab" href="#promotions"><fmt:message key="header.information.promotions"/></a></li>
                <li><a data-toggle="tab" href="#serviciosClientes"><fmt:message key="header.information.customer"/></a></li>
              </ul>
            </li>

            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="header.orders"/><span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a data-toggle="tab" href="#newOrder"><fmt:message key="header.orders.daily"/></a></li>
                <li><a data-toggle="tab" href="#stock"><fmt:message key="header.orders.stock"/></a></li>
                <li><a data-toggle="tab" href="#promo"><fmt:message key="header.orders.promo"/></a></li>
                <li><a data-toggle="tab" href="#premium"><fmt:message key="header.orders.premium"/></a></li>
                <li><a data-toggle="tab" href="#garantes"><fmt:message key="header.orders.guarantor"/></a></li>
                <li><a data-toggle="tab" href="#recomendado"><fmt:message key="header.orders.recommended"/></a></li>
                <li><a data-toggle="tab" href="#cargaMasiva"><fmt:message key="header.orders.masive"/></a></li>
                <li><a data-toggle="tab" href="#listaPedidos"><fmt:message key="header.orders.orderlist"/></a></li>
                <li><a data-toggle="tab" href="#listaPedidos"><fmt:message key="header.orders.openorderlist"/></a></li>
                <li><a data-toggle="tab" href="#"><fmt:message key="header.orders.backorder"/></a></li>
                <li><a data-toggle="tab" href="#"><fmt:message key="header.orders.bymaterials"/></a></li>
                <li><a data-toggle="tab" href="#flujoDocumentos"><fmt:message key="header.orders.documents"/></a></li>
                <li><a data-toggle="tab" href="#entregas"><fmt:message key="header.orders.delivybyorder"/></a></li>
              </ul>
            </li>

            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="header.complain"/><span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a data-toggle="tab" href="#reclamos"><fmt:message key="header.complain.complain"/></a></li>
                <li><a data-toggle="tab" href="#listaReclamos"><fmt:message key="header.complain.complainlist"/></a></li>
                <li><a data-toggle="tab" href="#"><fmt:message key="header.complain.documentsflow"/></a></li>
                <li><a data-toggle="tab" href="#listaEntregas"><fmt:message key="header.complain.deliveylist"/></a></li>
              </ul>
            </li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li>
            <form>
            <select class="btn btn-default btn-xs" style="margin-top: 17px;" id="language" name="language" onchange="submit()">
            	<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
            	<option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
            </select>
            </form>
          </li>
            <!-- <li><a href="../navbar/">Default</a></li>
            <li class="active"><a href="./">Static top <span class="sr-only">(current)</span></a></li> -->
            <li><a href="../navbar-fixed-top/"><fmt:message key="header.logout"/></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <div class="container">
	    <div id="promotions" class="content" style="margin-top:60px;display:none"><jsp:include page="promotions.jsp" /></div>  
		<div id="newOrder" class="content" style="margin-top:60px"><jsp:include page="newOrder.jsp" /></div>  
	</div>

<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- 	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script> -->
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table-locale-all.js" integrity="" crossorigin="anonymous"> -->
<!-- 	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
<!-- 	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/bootstrap-select.min.js"></script> -->
	
	
	<script type="text/javascript">
// 	$(document).ready(function(){
// 		$(".dropdown-menu a").on( "click", function() {
// 			alert("AAA");
// 			$('#promotions').show(); //muestro mediante id
// 			$('#newOrder').hide();
// 		 });
// 		$("#ocultar").on( "click", function() {
// 			$('#target').hide(); //oculto mediante id
// 			$('.target').hide(); //muestro mediante clase
// 		});
// 	});
	$(".dropdown-menu a").on('click',function(e) {
	   e.preventDefault(); // stops link form loading
	   $('.content').hide(); // hides all content divs
	   $($(this).attr('href')).show(); //get the href and use it find which div to show
	});
	</script>
</body>
</html>
