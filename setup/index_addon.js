document.addEventListener('DOMContentLoaded', function() {
    $.ajax({
        url: 'https://raw.githubusercontent.com/GetGoodGames/slack-theme/master/custom.css',
        success: function(css) {
            $("<style></style>").appendTo('head').html(css);
        }
    });
});
