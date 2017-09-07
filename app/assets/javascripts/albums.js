$(document).ready(function () {

  // Start of update_photos block
  if ($(".albums.update_photos").length > 0) {
    var options = {
      valueNames: [ 
        'name',
        { data: ['id'] },
        { attr: 'src', name:'image' },
        { attr: 'data-timestamp', name:'date_taken' } 
      ]
    };

    var photoList = new List('photos', options);
    photoList.filter();

    $("#submit").on('click', function(event) {
      photoList.filter();

      var photo_ids = []
        $(":checked.thumb-check").each(function (index, value) {
          photo_ids.push(value.id);
        });    

      var form = new FormData();
      form.append("photos", JSON.stringify(photo_ids));
      form.append("authenticity_token", $("input[name=authenticity_token]").val());

      var xhr = new XMLHttpRequest();
      xhr.open("POST", window.location);
      xhr.onload = function() {
        window.location.href = window.location.href.replace("update_photos", "");
      }
      xhr.send(form);

      event.preventDefault();
    }); 


    function toggleTransparency(event) {
      if (event.target === this) {
        var target = $(event.target);
        if (target.hasClass('opacity'))
          target.removeClass('opacity');
        else 
          target.addClass('opacity');
      }
    }
  } // End of update_photos block
});
