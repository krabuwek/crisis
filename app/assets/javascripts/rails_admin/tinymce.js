function tinymce_load(){
  tinymce.init({
    selector: "textarea",
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
  tinymce_load();
  $("#new_article").attr("novalidate", "true")
})
$(document).on('pjax:complete', tinymce_load );