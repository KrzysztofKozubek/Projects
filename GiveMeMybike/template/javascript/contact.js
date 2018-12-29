$(function(){  
  $('#contactName').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : standardCheck($this),
    });
  });

  $('#contactEmail').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkEmail($this),
    });
  });  

  $('#contactText').blur(function(event) {
    var $this = $(this);
    errorHandler({
      'selector'       : $this,
      'func'           : checkDesc($this),
    });
  });  

  $('#contactForm').submit(function(event) {
    var $this = $(this);
    $this.find('input, textarea').each(function(index, el) {
      $(this).blur();
    });
    if ( $this.find('.show-error').length == 0 ){
      return true;
    }
    return false;
  });
});