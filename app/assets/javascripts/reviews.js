var tags = []
$(document).ready(function() {
  //on button press change button to active state
  $(".tag").on('click', activateTag );
  //hide table
  //show new table results
  // $('.nav-tabs').button()
  // $('.nav-tabs').on('click', 'button', function(){

  //   var selected = $(this).attr('value');

  //   console.log(selected);
  // });
})

function activateTag () {
  var value = $(this).children("a").text();
  tags.push(value)
  console.log(tags);
  //css("background-color", "#e6e6e6" );
}

  // event.stopPropagation();

// $(document).ready(function() {
//   placeReviewForm();
//   $("#add_tags").on('click', handleTags );
// });

// function handleTags () {
//   var tags = document.getElementById("review_tag_list");

// }

// function placeReviewForm () {
//   var p = $('#reviewForm').position();
//   $('#reviewForm').affix({ offset: { top: 130} });
// }

// get the tag that was clicked
// add to array of clicked/not clicked
// send ajax request with array
// update page when request returns

