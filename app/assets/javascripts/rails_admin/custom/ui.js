
//= require 'tinymce-jquery'
function tinymce_load(){
  tinymce.init({
    selector: "#new_article textarea, #edit_article textarea",
    plugins: [
     "advlist autolink lists link image charmap print preview anchor",
     "searchreplace visualblocks code fullscreen autoresize",
     "insertdatetime media table contextmenu paste"
    ],
    menu : "core",
    toolbar: "undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link"
  });
}
$(window).load(function() {

})
$(document).on('pjax:complete', tinymce_load );

document.addEventListener("DOMContentLoaded", function() {
  tinymce_load();
  $("#new_article").attr("novalidate", "true")
})