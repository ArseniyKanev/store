$(window).load(function() {
  $('a[data-action]').click(function(e) {
    e.preventDefault();
    var $this = $(this);
    if ($this.data('action') === 'Add to cart') {
      var url = $this.data('addurl');
      var new_action = "Remove from cart";
    } else {
      var url = $this.data('removeurl');
      var new_action = "Add to cart";
    }
    $.ajax({
      url: url,
      type: 'put',
      success: function(data) {
        $('.action').html(new_action);
        $this.data('action', new_action);
        $.ajax({
          url: '/cart/total',
          type: 'get',
          success: function(data) {
            $('.nav_total').text(data.total);
          }
        });
      }
    });
  });
});
