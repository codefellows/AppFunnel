
$(document).ready(function() {
  //event handler for tag sorting
  $(".tag").on('click', activateTag );

  //If there are tags stored in local storage, press the button
  if (localStorage.getItem("tags") !== null) {

    var tags = JSON.parse(localStorage["tags"]);

    $.each(tags, function(index, value) {
      $( "button:contains('" + value.replace(/_/g," ") + "')" ).addClass('active');
        //replace space with underscore

        //for each tag, select from the rows that have not already been hidden
        var rows = $('table#applicants_table tr:visible');
        //select all rows with either the tag or the select_row class(header and averages rows)
        var selected = $("table#applicants_table tr:visible[data-tag*='" + value + " '], .selected_row");
        //hide all rows that were not selected
        rows.not( selected ).hide();
    });
  }
})

function activateTag () {
  //If there are tags in local storage, get them
  if (localStorage.getItem("tags") === null) {
    var tags = [];
  } else {
    var tags = JSON.parse(localStorage["tags"]);
  }

  //Add tag to selected tags array and save in local storage, replace spaces with underscore
  var value = $(this).text().replace(/\s+/g, '_');

  var found = jQuery.inArray(value, tags);
  if (found >= 0) {
    tags.splice(found, 1);

    //if tag was already clicked, go through tag list again and show all without it
    $('table#applicants_table tr').show();

    $.each(tags, function(index, value) {
      //for each tag, select from the rows that have not already been hidden
      var rows = $('table#applicants_table tr:visible');
      //select all rows with either the tag or the select_row class(header and averages rows)
      var selected = $("table#applicants_table tr:visible[data-tag*='" + value + " '], .selected_row");
      //hide all rows that were not selected
      rows.not( selected ).hide();
    });
  } else {
    tags.push(value);
    //if tag was not already clicked, hide all rows that do not include it

    var rows = $('table#applicants_table tr:visible');
    //select all rows with either the tag or the select_row class(header and averages rows)
    var selected = $("table#applicants_table tr:visible[data-tag*='" + value + " '], .selected_row");
    //hide all rows that were not selected
    rows.not( selected ).hide();
  }

  localStorage["tags"] = JSON.stringify(tags);
}

//click on on click
//get from local storage only once
//change join in _filter_applicants to join with commas or each tag
//in seperate data attributes or data-tag_name (instead of using whitespace)
//selected can just be what's different
//use has class instead of inArray
//add data tag to button with underscored tag name
