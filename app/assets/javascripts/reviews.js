
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

// get the tag that was clicked
// add to array of clicked/not clicked
// send ajax request with array
// update page when request returns

