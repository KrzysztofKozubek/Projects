  function errorHandler(prefOptions){
    var defaultOptions = {
      'selector'       : false,
      'func'           : false,
      'errorContainer' : 'form-error',
      'errorClass'     : 'default-error',
      'errorShowClass' : 'show-error'
    }
    var options = {};
    $.extend(true, options, defaultOptions, prefOptions);
    
    options.errorClass = '.'+options.errorClass;
    options.errorContainer = '.'+options.errorContainer;
    if(!options.func){
      errors = true;
      options.selector.next(options.errorContainer).find(options.errorClass).addClass(options.errorShowClass);
    }else{
      errors = false;
      options.selector.next(options.errorContainer).find(options.errorClass).removeClass(options.errorShowClass);
    }
    return errors;
  }
  function checkSectionName($selector, $section, callback){
    $.post('/validation/checkSectionName',{name: $selector.val(), section: $section}).done(function(data){
      callback(data);
    });
  }
  function checkSectionByIdName($selector, $section, $id, callback){
    $.post('/validation/checkSectionName',{name: $selector.val(), section: $section, id: $id}).done(function(data){
      callback(data);
    }).fail(function(data){
      console.log(data.responseText);
    });
  }
  function checkDesc($selector){
    return $selector.val().length > 3 && $selector.val().length < 2147483646;
  }
  function standardCheck($selector){
    return $selector.val().length > 3 && $selector.val().length < 255;
  }
  function progressCheck($selector){
    return ($selector.val() % 1 === 0) && $selector.val() >= 0 && $selector.val() <= 100;
  }
  function checkDate($start, $end){
    var start = $.datepicker.parseDate("dd/mm/yy", $start.val());
    var end = $.datepicker.parseDate("dd/mm/yy", $end.val());
    if(start <= end){
      return true;
    } else{
      return false;
    }
  }
  function checkNick($selector){
    return /[a-z_\-[\]\\^{}|`][a-z0-9_\-[\]\\^{}|`]{2,31}/.test($selector.val());
  }
  function checkPassword($selector){
    return /(?=[#$-/:-?{-~!"^_`\[\]a-zA-Z]*([0-9#$-/:-?{-~!"^_`\[\]]))(?=[#$-/:-?{-~!"^_`\[\]a-zA-Z0-9]*[a-zA-Z])[#$-/:-?{-~!"^_`\[\]a-zA-Z0-9]{4,}/.test($selector.val());
  }
  function checkSelect($selector){
    return !$selector.find('option:first').is(':selected');
  }
  function checkEmail($selector){
    return /^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Za-z|0-9]){1}\.[a-z]{2,3}$/.test($selector.val());
  }
  function checkNumber($selector){
    return /^(((\d{1,3},?)(\d{3},?)+|\d{1,3})|\d+)(\.\d{1,2})?$/.test($selector.val());
  }
  function checkPhone($selector){
    return /^(\+[\d]{1,3})?[0-9]{9}$/.test($selector.val());
  }