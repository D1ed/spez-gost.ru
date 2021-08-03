$(document).ready(function() {
    $('#tabs').addClass('sortable');
    $('#tabs li').attr({'toggle': 'tooltip', 'title': 'Потяните элемент мышью для перемещения'});
    $('#tabs li:lt(3)').addClass('no_sort').removeAttr('data-toggle').removeAttr('title');

    $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

    $('.sortable').sortable({
        revert: 250,
        cursor: 'move',
        dropOnEmpty: true,
        placeholder: 'placeholder-sortable',
        cancel: '.no_sort',
        stop: function(event, ui) {
            $(this).find('input[name*=\'sort_order\']').each(function(index) {
                $(this).val(index + 1);
            });
        }
    });
});
