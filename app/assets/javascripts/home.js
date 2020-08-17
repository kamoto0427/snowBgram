$(function() {
  let $children = $('#children');
  let original = $children.html();

  $('#parent').change(function() {
    let val1 = $(this).val();

    $children.html(original).find('option').each(function() {
      let val2 = $(this).data('val');
      if (val1 != val2) {
        $(this).not('.msg').remove();
      }
    });

    if ($(this).val() === '') {
      $children.attr('disabled', 'disabled');
    } else {
      $children.removeAttr('disabled');
    }

  });
});