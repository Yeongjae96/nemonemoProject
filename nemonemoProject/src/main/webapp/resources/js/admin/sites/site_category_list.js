/**
 * 
 */

$(function(){
    $('#categoryModalRegistryBtn').on('click', function() {
        const $lgCategory = $('lg-category--select').prop('selected').val();
        const $mdCategory = $('md-category--select').prop('selected').val();
        const $smCategory = $('sm-category--select').prop('selected').val();

        console.log($lgCategory);
        console.log($mdCategory);
        console.log($smCategory);
    });
});