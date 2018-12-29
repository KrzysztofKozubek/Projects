 $(function(){

  // Travels
  // --------------------

  $('a[id ^= travelDetail]').click(function(e){
    var tripID = $(this).attr('id').substr(13);
    $.ajax({
        url: '/client/travels/details/'+tripID,
        type: 'GET',
        datatype: 'html'
        
    })
    .done(function(result) {
        $('#travelDetails').find('.modal-body').html(result);
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
  $('button[id ^=trip]').click(function(e){
    var tripID = $(this).attr('id').substr(5);
    $.ajax({
    	url: '/client/travels/members/'+tripID,
    	type: 'GET',
    	datatype: 'html'
    	
    })
    .done(function(result) {
    	$('#tripMemberList').find('.modal-body').html(result);
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

  $('button[id ^=joinTravel]').click(function(e){
    var $this = $(this);
    var tID = $this.attr('id').substr(11);
    if($this.prop('disabled', false)){
        $this.prop('disabled', true);
        $.ajax({
            url: '/client/travels/join',
            type: 'POST',
            data: {travelID: tID}
        })
        .done(function() {
            console.log("success");
        })
        .fail(function(data) {
            console.log("error");
            console.log(data.responseText);
        })
        .always(function() {
            console.log("complete");
        });
        $this.text('Dołączono!');

    }   
  });

  $('button[id ^=unsubscribeTravel]').click(function(e){
    var $this = $(this);
    var tID = $this.attr('id').substr(18);
    if($this.prop('disabled', false)){
        $this.prop('disabled', true);
        $.ajax({
            url: '/client/travels/unsubscribe',
            type: 'POST',
            data: {travelID: tID}
        })
        .done(function() {

            console.log("success");
        })
        .fail(function(data) {
            console.log("error");
            console.log(data.responseText);
        })
        .always(function() {
            console.log("complete");
        });
        $this.text('Wypisano!');        
    }   
  });

});