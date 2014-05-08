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


    $('#loadForm, #new_match').on('click', '.submitBtn', function () {

        var $this = $(this),
            $form = $this.parents('form'),
            data = $form.serialize(),
            sId = $this.parents('.popUp').data('id'),
            url = $form.attr('action'),
            controller = $this.data('controller');

        console.log(url, data);
        $.post(url, data, function () {

            //console.log('Request has been sent.');

        }).done(function (res, req) {
            $('#' + sId + ' > option').removeAttr('selected');
            $('#' + sId).append('<option value="' + res.id + '" selected>' + res.name + '</option>');

            $this.parents('.popUp').remove();
        });
    });


    $('#matchSection').on('click', '.form-icon', function LoadForm() {

        var $this = $(this),
            $formGroup = $this.parents('.form-group'),
            action = $formGroup.data('action'),
            $select = $formGroup.find('select'),
            sId = $select.attr('id'),
            id = $select.val(),
            $loadForm = $('#loadForm'),
            $div,
            path = '/' + action;

        $div = '<div class="popUp" data-id="' + sId + '"></div>';

        if ($this.data('action') === 'collide') {
            $this.parent().siblings('.load').html('');
            $loadForm.html('');
        }
        else if ($this.data('action') === 'add') {

            path += '/new';
            $loadForm.prepend($div);
            $('[data-id=' + sId + ']').load(path);
        }
        else if ($this.data('action') === 'edit') {
            path += '/' + id + '/edit';
            $loadForm.prepend($div);
            $('[data-id=' + sId + ']').load(path);
        }

        $this.siblings('.form-icon').show();
        $this.hide();

    });


    $('.approveBtn').on('click', function ApproveUser() {

        var $this = $(this),
            uid = $this.data('uid'),
            sid = $this.data('sid'),

            $form = $this.parent('form'),
            data = $form.serialize(),
            url = $form.attr('action'),
            controller = $this.data('controller');

        console.log(url, data);


        // /cities utf8=%E2%9C%93&authenticity_token=xjypsCFu%2FdZ5tqZiopzA3pcecg1XpZzaHNZmg0Sr4Gs%3D&city%5Bname%5D=Cardiff&city%5Btimezone_id%5D=39&city%5Bcountry_id%5D=218


        //console.log(url, data);
        $.post(url, data, function () {

            //console.log('Request has been sent.');

        }).done(function (res, req) {
            //    $('#' + sId + ' > option').removeAttr('selected');
            //     $('#' + sId).append('<option value="' + res.id + '" selected>' + res.name + '</option>');

            //    $this.parents('.popUp').remove();

            console.log('res: ', res);
            console.log('req: ', req);

        }).fail(function (res, req) {
            console.log('res: ', res);
            console.log('req: ', req);
        });
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