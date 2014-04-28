/**
 * Created by pavel on 4/17/14.
 */

$(function () {

    $('.info_label').on('click', function () {
        $(this).siblings('.match_data').slideToggle();
        $(this).children('.arrow').toggleClass('up down');
    });

    // Showing
    $('.guess.btn').on('click', function () {
        var $this, match_id, pens, url;

        $this = $(this);
        match_id = $this.data('match');
        pens = $this.data('pens');
        url = 'guesses/new/' + match_id + '/' + pens

        $('.my_guess').load(url, function () {
            $(this).fadeToggle();
        });
    });


    $('.other.btn').on('click', function () {
        $('.user_guesses').fadeToggle();
    });

    //$('.button').on('click', clickFunction);

    $('.button.edit').click(function () {
        alert();
    });

});


function clickFunction() {

    var matchId, userId, guessId,
        $this = $(this),
        pens = false,
        $form = $this.parent('form'),

        $myGuess = $form.parent('.my_guess'),
        data = $form.serialize(),
        url = $form.attr('action');

    if ($form.children('#guess_pens_a').val() !== undefined)
        pens = 'true';

    $.post(url, data, function () {

        //console.log('Request has been sent.');

    }).done(function (res) {


        // New
        // <form accept-charset="UTF-8" action="/guesses" class="guess_form" id="guess_match_66" method="post" name="match_66">
        // <div class="button new">Submit</div>

        // Edited
        // <form accept-charset="UTF-8" action="/guesses/33" class="guess_form" id="guess_match_65" method="post" name="match_65">
        // <div class="button edit" onclick="clickFunction()">Edit</div>

        matchId = res.match.id;
        userId = res.user.id;
        guessId = res.id;

        $form.parent('.my_guess').slideUp(function () {
            var $scopeThis = $(this);
            $form.attr('action', '/guesses/' + matchId);
            $this.removeClass('new').addClass('edit').text('Edit');
            $('.match[data-match="' + matchId + '"]').find('.match_msg').removeClass('error maroon').addClass('ok').html('Your score has been submitted.');
            $scopeThis.children('h3').text('Edit your scores');
            $scopeThis.slideDown();
        });


    }).fail(function () {

        //console.log('Request Failed ');
        $myGuess.parent('.match_info').siblings('.match_msg').addClass('error').html('There\'s been an error.');
        //console.log($myGuess);


    }).always(function () {

        //console.log('Finishing');

    });
}