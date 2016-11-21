<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
    <title>Parts on command</title>
<!--     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"> -->


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
	<h3>Lista de promociones</h3>
	<div class="horizontal-line"></div>
	
    <table id="promotion" class="display" width="100%"></table>

      <div class="modal fade" id="promotionModal" tabindex="-1"	role="dialog" aria-labelledby="promotionModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title" id="promotionModalLabel">Nuevo Pedido</h4>
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
          </div>
        </div>
      </div>

  </div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table-locale-all.js" integrity="" crossorigin="anonymous">
	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/bootstrap-select.min.js"></script>

<script>
var promotionSet = [
    [ "000071200", "CAJA TECHO", "1", "2,148.65", "ARS(*)", "11/08/2016 - 30/09/2016" ],
    [ "000087011D APG", "COLGADOR L", "1", "229.07", "ARS(*)", "11/08/2016 - 30/09/2016" ],
    [ "000091387AC", "CADENAS", "1", "1,180.48", "ARS(*)", "11/08/2016 - 30/09/2016" ],
    [ "000091387K", "CADENAS", "1", "1,879.83", "ARS(*)", "11/08/2016 - 30/09/2016" ],
    [ "013300041L", "CAMBIO", "1", "9,056.88", "ARS(*)", "11/08/2016 - 30/09/2016" ],
];

$(document).ready(function() {
    $('#promotion').DataTable( {
        data: promotionSet,
        select: true,
        columns: [
            { title: "Material" },
            { title: "Descripción del material" },
            { title: "Cant. Min." },
            { title: "Precio Unit." },
            { title: "Moneda" },
            { title: "Periodo válido" }
        ]
    } );
} );

$(document).ready(function() {
    var table = $('#promotion').DataTable();

    $('#modifyRow').prop('disabled', true);
    $('#deleteRow').prop('disabled', true);

//Seleccionar Filas

  $('#promotion tbody').on( 'click', 'tr', function () {
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


});

//Limpiar modal

  $('#promotionModal').on('hidden.bs.modal', function () {
      $(this).find("input,textarea,select").val('').end();
      $('#saveRow').show();
      $('#createRow').show();

  });

</script>

</body>
</html>
