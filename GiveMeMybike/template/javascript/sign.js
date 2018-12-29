$(function(){

  $('#registerName, #registerSurname, #registerAddress, #registerZipCity').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : standardCheck($this),
    });
  });

  $('#registerPassword').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkPassword($this),
    });
  });

  $('#registerEmail').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkEmail($this),
    });
    if($this.val().length > 0)
      $.ajax({
        url: '/sign/check_email/'+$this.val(),
        type: 'POST'
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

  $('#registerPhone').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkPhone($this),
    });
    $.ajax({
      url: '/sign/check_phone/'+$this.val(),
      type: 'POST'
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


  $('#SignUpForm').submit(function(event) {
    var $this = $(this);
    $this.find('input, select').each(function(index, el) {
      $(this).blur();
    });
    if ( $this.find('.show-error').length == 0 ){
      return true;
    }
    return false;
  });
});