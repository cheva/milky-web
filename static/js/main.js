$(document).ready(function () {
    $("body").on("click", "#styleSwitch", function () {
        $('#styleSheet').attr('href', staticCss + $(this).attr('title').toLowerCase() + '.min.css');
        //alert(staticCss + $(this).attr('title').toLowerCase() + '.min.css');
    });
});