function ajaxSearch() {
    var input_data = $('#searchs').val();
    if (input_data.length === 0) {
        $('#suggestions').hide();
    } else {

        var post_data = {
            'searchs': input_data,
            '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
        };

        $.ajax({
            type: "POST",
            url: "<?php echo base_url(); ?>searchs",
            data: post_data,
            success: function(data) {
                // return success
                if (data.length > 0) {
                    $('#suggestions').show();
                    $('#mainz').addClass('auto_list');
                    $('#mainz').html(data);
                }
            }
        });

    }
}