 $(function(){

  // Client Orders
  // --------------------

  $('a[id ^= orderDetails]').click(function(e){
    var orderID = $(this).attr('id').substr(13);
    $.ajax({
    	url: '/client/orders/'+orderID,
    	type: 'GET',
    	datatype: 'html'
    	
    })
    .done(function(result) {
    	$('#orderDetail').find('.modal-body').html(result);
    	console.log("success");
    })
    .fail(function(err) {
    	console.log(err.responseText);
    	console.log("error");
    })
    .always(function() {
    	console.log("complete");
    });
  });

  $('button[id ^= ratePlace]').click(function(e){
    var placeID = $(this).attr('id').substr(10);
    $.ajax({
        url: '/client/orders/rate_place/'+placeID,
        type: 'GET',
        datatype: 'html'
        
    })
    .done(function(result) {
        $('#placeInfo').html(result);
        console.log("success");
    })
    .fail(function(err) {
        console.log(err.responseText);
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });
  });

  $('#ratePlaceForm').on('submit',function(event) {
    var $this = $(this);
    $this.find('input').each(function(index, el) {
      $(this).blur();
    });
    if ( $this.find('.show-error').length == 0 ){
      return true;
    }
    return false;
  });  
  $('#rateSubmit').on('click', function(){
    $('#ratePlaceForm').trigger('submit');
  });

  
});