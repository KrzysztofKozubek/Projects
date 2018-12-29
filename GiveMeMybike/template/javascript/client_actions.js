$(function(){

  // Client Rent
  // -------------------

  $('#rentPlace').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkSelect($this),
    });
  });

  $('#rentOtherUserTrue, #rentOtherUserFalse').click(function(e){
    e.preventDefault();
    $(this).addClass('tag-hidden').next().removeClass('tag-hidden');
    if($(e.target).attr('id') == 'rentOtherUserTrue'){
      $('#rentOtherUserFalse').removeClass('tag-hidden').next().addClass('tag-hidden');
      $('#otherUserForm').find('input').each(function(index, el) {
        $(this).prop('disabled', false);
      });
      $('#rentOtherUser').prop('value', 1);
    }
    else if($(e.target).attr('id') == 'rentOtherUserFalse'){
      $('#rentOtherUserTrue').removeClass('tag-hidden').next().addClass('tag-hidden');
      $('#otherUserForm').find('input').each(function(index, el) {
        $(this).prop('disabled', true);
      });
      $('#rentOtherUser').prop('value', 0);
    }
  });

  $('#rentType2').click(function(e){
    $('#endDate').closest('div.form-group').removeClass('tag-hidden');
  });
  $('#rentType1').click(function(e){
    $('#endDate').closest('div.form-group').addClass('tag-hidden');
  });

  $('#rentBikeForm').submit(function(e){
    var $this = $(this);
    var rentAdditional = '';
    $this.find('.rentAdditional').each(function(){
      console.log($(this).prop('checked'));
      if( $(this).prop('checked') ){
        rentAdditional += $(this).val()+',';
      }
    });
    $('#rentAdditional').prop('value', rentAdditional.substr(0, rentAdditional.length - 1));
    $this.find('input, select').each(function(index, el) {
       $(this).blur();
    });
    if ( $this.find('.show-error').length == 0 ){
      return true;
    }
    return false;
  });

  // Client Payments
  // --------------------

  $('#paySubmit').click(function(e){
  	e.preventDefault();
  	$('#clientPayForm').trigger('submit');
  });


  //validation
  $('#clientPayment').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkNumber($this),
    });
  });

  $('#clientPayForm').submit(function(event){
    var $this = $(this);
    $this.find('input').each(function(index, el) {
    	 $(this).blur();
    });
    if ( $this.find('.show-error').length == 0 ){
      return true;
    }
    return false;
  });
});