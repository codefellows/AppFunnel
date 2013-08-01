
$(document).ready(function() {
  placeReviewForm();
  $("#add_tags").on('click', handleTags );
});

function handleTags () {
  var tags = document.getElementById("review_tag_list");

}

function placeReviewForm () {
  var p = $('#reviewForm').position();
  $('#reviewForm').affix({ offset: { top: 130} });
}


