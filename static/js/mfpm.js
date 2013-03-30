$(function () {
    $('.reviewLink').click(function () {
        var container = $(this).parent();
        var reviewContainer = $(container).find('.reviewContainer');
        reviewContainer.show();
        return false;
    });
});
