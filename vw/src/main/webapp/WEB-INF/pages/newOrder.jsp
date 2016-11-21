<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
    <title>Parts on command</title>
    <style>

/*     .ml10 { */
/*       margin-left: 10px; */
/*     } */
    
    .horizontal-line {
        width: 100%;
        border: 0.5px solid black;
        height: 0px;
        margin-top: 10px;
        margin-bottom: 10px
    }

    </style>
</head>

<body>
	
    <div class="container">

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<p>Fecha de pedido: <fmt:formatDate type="date" value="${now}" /></p>
 
	<div class="row">
			<div class="col-md-3">
	           <select class="selectpicker" title="Tipo de pedido" data-header="Seleccione un tipo">
	           	<option value="0">Pedido sotck</option>
	           	<option value="1">Pedido diario</option>
	           </select>
           </div>
 			<div class="col-md-3">
	           <select class="selectpicker" title="Direcciones de entrega" data-header="Selecciones una direccion">
	           	<option value="0">Direccion 1</option>
	           	<option value="1">Direccion 2</option>
	           </select>
           </div>
 			<div class="col-md-3">
	           <select class="selectpicker" title="Prioridad" data-header="Selecciones una prioridad" >
	           	<option value="0">Normal</option>
	           	<option value="1">Alta</option>
	           	<option value="1">Critica</option>
	           </select>
           </div>
			<div class="col-md-3">	
           		<input type="text" class="form-control" placeholder="Observaciones">
           </div>
	</div>
	
	
	<div class="horizontal-line"></div>
	
    <table id="order" class="display" width="100%"></table>
    
    <button id="addRow" type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Crear nuevo Pedido</button>

    <button id="modifyRow" type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Modificar Pedido</button>

    <button id="deleteRow" type="button" class="btn btn-warning">Eliminar Pedido</button>

      <div class="modal fade" id="exampleModal" tabindex="-1"	role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title" id="exampleModalLabel">Nuevo Pedido</h4>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="material-name" class="control-label">Material</label>
                  <input type="text" class="form-control" id="material-name">
                </div>
                <div class="form-group">
                  <label for="quantity" class="control-label">Cantidad</label>
                  <input type="text" class="form-control" id="quantity">
                </div>
                <div class="form-group">
                  <label for="message-text" class="control-label">Comentarios:</label>
                  <input type="text" class="form-control" id="message-text"></input>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default"
                data-dismiss="modal">Close</button>
              <button id="createRow" type="button" class="btn btn-warning">Crear</button>
              <button id="saveRow" type="button" class="btn btn-warning">Guardar</button>

            </div>
          </div>
        </div>
      </div>

  </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table-locale-all.js" integrity="" crossorigin="anonymous">
	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/bootstrap-select.min.js"></script> -->

<script>
var dataSet = [];

$(document).ready(function() {
    $('#order').DataTable( {
        data: dataSet,
        select: true,
        columns: [
            { title: "Material" },
            { title: "Cantidad" },
            { title: "Comentarios" }
        ]
    } );
} );

// $(document).ready(function() {
//     var table = $('#example').DataTable( {
//       lengthChange: false,
//         data: dataSet,
//         buttons: [ 'copy', 'excel', 'pdf', 'colvis' ],
//         columns: [
//             { title: "Material" },
//             { title: "Cantidad" },
//             { title: "Comentarios" }
//         ]
//     } );
//     table.buttons().container()
//         .appendTo( '#example_wrapper .col-sm-6:eq(0)' );
// } );

$(document).ready(function() {
    var table = $('#order').DataTable();

    $('#modifyRow').prop('disabled', true);
    $('#deleteRow').prop('disabled', true);

//Agregar Nueva Fila

    $('#createRow').on( 'click', function () {

      var material_value = $('#material-name').val();
      var quantity_value = $('#quantity').val();
      var message_value = $('#message-text').val();
      var row = [material_value, quantity_value, message_value];

      table.row.add(row).draw().node();
      $('#exampleModal').modal('hide')
    } );

//Guardar Fila Modificada

    $('#saveRow').on( 'click', function () {

      var material_value = $('#material-name').val();
      var quantity_value = $('#quantity').val();
      var message_value = $('#message-text').val();

      var row = [material_value, quantity_value, message_value];

      table.row('.selected').remove().draw( false );
      table.row.add(row).draw().node();

      $('#deleteRow').prop('disabled', true);
      $('#modifyRow').prop('disabled', true);
      $('#exampleModal').modal('hide')

    } );

//Seleccionar Filas

  $('#order tbody').on( 'click', 'tr', function () {
      if ( $(this).hasClass('selected') ) {
          $(this).removeClass('selected');
          $('#deleteRow').prop('disabled', true);
          $('#modifyRow').prop('disabled', true);


      }else {

        $('#deleteRow').prop('disabled', false);
        $('#modifyRow').prop('disabled', false);
        table.$('tr.selected').removeClass('selected');
        $(this).addClass('selected');
      }
  } );


  $('#addRow').click( function () {
    table.$('tr.selected').removeClass('selected');
    $('#saveRow').hide();
  } );

//Modificar Fila

  $('#modifyRow').click( function () {
    $('#createRow').hide();
    var data = table.row('.selected').data();

    $('#material-name').val(data[0]);
    $('#quantity').val(data[1]);
    $('#message-text').val(data[2]);

  } );

//Borrar Fila

  $('#deleteRow').click( function () {
      table.row('.selected').remove().draw( false );
  } );

  var dt = new Date();
  var currentTime = dt.get
} );

//Limpiar modal

  $('#exampleModal').on('hidden.bs.modal', function () {
      $(this).find("input,textarea,select").val('').end();
      $('#saveRow').show();
      $('#createRow').show();

  });

</script>



</body>
</html>
