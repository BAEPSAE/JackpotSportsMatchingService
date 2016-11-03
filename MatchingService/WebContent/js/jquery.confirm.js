(function($) {

    $.confirm = function(params) {

        // Check if there is a confirmation in progress
        if ($('.confirmBox').length) {
            return false;
        }
        
        // Build the HTML structure
        var content = [
            '<div class="confirmBox"><div class="confirmDialog"><div class="confirmContent">',
            '<div class="confirmTitle">', params.title, '</div>',
            '<div class="confirmButtons">',
            '<a class="button accept">', params.acceptTitle, '</a>',
            '<a class="button reject">', params.rejectTitle, '</a>',
            '</div>',
            '</div></div></div>',
            '<div class="confirmModal"></div>'
        ].join('');

        // Show confirm modal
        $(content).hide().appendTo('body').fadeIn();
        
        // Function YES
        $(".accept").click(function() {
            params.acceptAction();
            $.confirm.hide();
            return false;
        });
        
        // Function NO
        $(".reject").click(function() {
            $.confirm.hide();
            return false;
        });
        
    }

    // Hide modal
    $.confirm.hide = function() {
        $('.confirmModal, .confirmBox').fadeOut(function() {
            $(this).remove();
        });
    }

})(jQuery);