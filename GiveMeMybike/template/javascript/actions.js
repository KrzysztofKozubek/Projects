$(function() {
  var $headerNavigation = $("#headerNavigation").find('ul')
  $("#menu-small").find("a").click(function(e){
    e.preventDefault();
    $headerNavigation.toggleClass("navi-open");
  });

  $('.table.table-styled').each(function(){
  	var $this = $(this);
  	var tableCols = $this.find('th').length;
  	if(!$this.find('tbody').children().is('tr')){
  		$this.find('tbody').append('<tr><td colspan="'+tableCols+'" class="text-center">Pusta tabela</tr>');
  	}
  });

  $('#subscriptionEmail').blur(function(){
      var $this = $(this);
      var error = checkEmail($this);
      console.log(error);
      if(!error){
        $this.addClass('show-error');
        $this.prop('value', 'niepoprawny mail');
      }else{
        $this.removeClass('show-error');
      }
  });
  
  $('#subscriptionForm').submit(function(event) {
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