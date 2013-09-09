
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

  var found = jQuery.inArray(tag, tags);
  if (found >= 0) {
    //if tag was already clicked, remove it from the list of tags
    tags.splice(found, 1);

    //show all rows
    $('table#applicants_table tr').show();

    //hide rows without each of the currently selected set of tags
    $.each(tags, function(index, tag) {
      hideRowsWithoutTag(tag);
    });
  } else {
    //If the tag is not currently selected,
    //add tag to the tags array
    tags.push(tag);
    //hide all rows that do not include the tag
    hideRowsWithoutTag(tag);

  }

  localStorage.setItem("tags", JSON.stringify(tags));
}

function hideRowsWithoutTag (tag) {
  //get all visible rows from the Applicants table
  var rows = $('table#applicants_table tr:visible');
  //select all rows with the tag and the table header and averages rows)
  var selected = $("table#applicants_table tr:visible[data-tag*='" + tag + ",'], .averages, .table_header");
  //hide all rows that were not selected
  rows.not( selected ).hide();
}

//get from local storage only once

//selected can just be what's different
//use has class instead of inArray

