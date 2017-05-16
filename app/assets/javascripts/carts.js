$(window).load(function() {
  $(".remove").click(function() {
    $(this).parent().remove();
    setTimeout(function() {
      $.ajax({
        url: '/cart/total',
        type: 'get',
        success: function(data) {
          $('.total').text(data.total);
          $('.nav_total').text(data.total);
        }
      });
    }, 2000);
  });
});
