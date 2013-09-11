$(document).ready(function() {
  var tags = JSON.parse(localStorage.getItem("tags"));

  //event handler for tag sorting
  $(".tag").click( activateTag );

  //If there are tags stored in local storage, press the button for each tag
  if (tags !== null) {
    $.each(tags, function(index, tag) {
      $( "button:contains('" + tag + "')" ).addClass('active');
      hideRowsWithoutTag(tag);
    });
  }
})

function activateTag () {
  //If there are tags in local storage, get them
  var tags = JSON.parse(localStorage.getItem("tags"));
  if (tags === null) {
    var tags = [];
  }

  //Get tag text from selected tag
  var tag = $(this).text();

  if ($(this).hasClass('active')) {
    //if the tag is already selected,
    deselectTag(tag, tags);

  } else {
    //If the tag is not currently selected,
    selectTag(tag, tags);
  }

  localStorage.setItem("tags", JSON.stringify(tags));
}

function deselectTag (tag, tags) {
  //find the tag in the tags array and remove it
  tags.splice($.inArray(tag, tags), 1);

  //show all rows
  $('table#applicants_table tr').show();

  //hide rows without each of the currently selected set of tags
  $.each(tags, function(index, tag) {
    hideRowsWithoutTag(tag);
  });

}

function selectTag (tag, tags) {
  //add tag to the tags array
  tags.push(tag);
  //hide all rows that do not include the tag
  hideRowsWithoutTag(tag);
}

function hideRowsWithoutTag (tag) {
  //get all visible rows from the Applicants table
  var rows = $('table#applicants_table tr:visible');

  //hide all rows except the rows with the tag and average and header rows
  rows.not( "[data-tag*='" + tag + ",'], .averages, .table_header" ).hide();
}
