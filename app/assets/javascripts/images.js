$(function(){
  $(".thumbnails").sortable({
    dropOnEmpty:false, 
    cursor: 'pointer',
    opacity: 0.4,
    scroll: true,
    tolerance: 'pointer',
    update: function() {
      var order =  $(".thumbnails").sortable("serialize");
      $.post('/admin/works/' + work_id + '/sort_images', $(this).sortable('serialize'));
    }
  });

  $(".delete_image").click(function(e) {
    e.preventDefault();
    $.ajax({ 
        url: "/admin/images/" + $(this).data("pk"), 
        type: "delete",
        success: function(response) {
          $('.thumbnails').html(response).sortable('refresh');
        }
      });
    });
});
