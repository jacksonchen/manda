document.addEventListener("turbolinks:load", function() {
  if ($('#no_user_type').length && $('div.oauth_no_user_type').length) {
    $('div.oauth_no_user_type > a').attr('href', $('div.oauth_no_user_type > a').attr('href') +
                                                   "?user_type=" + $('select#user_user_type').find(":selected").attr('value'));

    $('select#user_user_type').on('change', function() {
      var base_url = $('div.oauth_no_user_type > a').attr('href').split('?')[0];
      $('div.oauth_no_user_type > a').attr('href', base_url + "?user_type=" + $('select#user_user_type').find(":selected").attr('value'));
    });
  }
});
