$(function(){

  $('#profileName, #profileSurname, #profileAddress, #profileZipCity').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : standardCheck($this),
    });
  });

  $('#profilePassword').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkPassword($this),
    });
  });

  $('#profileEmail').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkEmail($this),
    });
    if($this.val().length > 0)
      $.ajax({
        url: '/client/check_email/'+$this.val(),
        type: 'POST',
        data: {UserEmail: $('#profileEmail_hidden').val()}
      })
      .done(function(data) {
        console.log(data);
        if(data == 1){
          $this.next('.form-error').find('.email-error').addClass('show-error');
        } else{
          $this.next('.form-error').find('.email-error').removeClass('show-error');
        }
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
    
  });

  $('#profilePhone').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkPhone($this),
    });
    $.ajax({
      url: '/client/check_phone/'+$this.val(),
      type: 'POST',
      data: {UserPhone: $('#profilePhone_hidden').val()}
    })
    .done(function(data) {
      console.log(data);
      if(data == 1){
        $this.next('.form-error').find('.phone-error').addClass('show-error');
      } else{
        $this.next('.form-error').find('.phone-error').removeClass('show-error');
      }
      console.log("success");
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  });


  $('#editProfileForm, #editPasswordForm').submit(function(event) {
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