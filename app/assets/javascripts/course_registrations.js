$(document).ready(function() {
    $(".course_registration_decision").on('change', saveDecision );
})

function saveDecision () {

  console.log(this);
  console.log($(this).parent());
  var form = $(this).parent();
  form.submit();

}
