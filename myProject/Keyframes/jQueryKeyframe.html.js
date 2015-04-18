var speed = "3s";
var angle = "90deg";

// ********** Load **********
$(window).load(function () {

    // Get the css browser code (ie: -moz-)
    var pfx = $.keyframe.getVendorPrefix();

    //Note the variable notation to be able to add vendor specific prefix
    var transform = pfx + 'transform';

    // Setup the initial transform style.
    $('.ball').css(transform, 'rotate(0deg)');

    // Adding a new animation sequences (keyframe)
    $.keyframe.define([{
        name: 'ball-roll',
        '0%': {
            'transform': 'rotate(0deg)',
            'margin-left': '0px'
        },
        '50%': {
            'transform': 'rotate(360deg)',
            'margin-left': '600px'
        },
        '100%': {
            'transform': 'rotate(0deg)',
            'margin-left': '0px'
        }
    }, {
        name: 'ball-spin',
        from: {
            'transform': 'rotate(0deg)'
        },
        to: {
            'transform': 'rotate(360deg)'
        }
    }, {
        name: 'ball-rotate',
        from: {
            'transform': 'rotate(0deg)'
        },
        to: {
            'transform': 'rotate(angle)'
        }
    }]);

});

// ********** Play **********
function play(animation) {
    $('.ball').resetKeyframe(function () {
        switch (animation) {
            case 'normal':

                // roll with easing
                $('.ball').playKeyframe({
                    name: 'ball-roll',
                    duration: speed,
                    timingFunction: 'ease',
                    delay: 0,
                    iterationCount: 'infinite',
                    direction: 'normal',
                    fillMode: 'forwards',
                    complete: increment
                });

                break;
            case 'spin':

                // run spin keyframes using the shorthand method.
                $('.ball').playKeyframe('ball-spin 500ms linear 0 3 normal forwards', increment);

                break;
            case 'linear':

                // roll with linear timing
                $('.ball').playKeyframe({
                    name: 'ball-roll',
                    duration: speed,
                    timingFunction: 'linear',
                    iterationCount: 'infinite',
                    complete: increment
                });

                break;
            case 'delay':

                // set a 2 second delay before starting
                $('.ball').playKeyframe({
                    name: 'ball-roll',
                    duration: speed,
                    timingFunction: 'linear',
                    delay: "3s",
                    iterationCount: 'infinite',
                    complete: increment
                });

                break;
            case 'once':

                // only play the animation once
                $('.ball').playKeyframe({
                    name: 'ball-roll',
                    duration: speed,
                    timingFunction: 'ease',
                    complete: increment
                });

                break;
            case 'multi':
                // play multiple animations
                $('.ball').playKeyframe([
                  'ball-spin 500ms linear 0 6',
                  {
                      name: 'ball-roll',
                      duration: speed,
                      timingFunction: 'ease',
                      iterationCount: 1
                  }
                ],
                increment);
        }
    });

}

// ********** Basic Controlws **********
function pause() {
    // freeze keyframe animation and kill callback
    $('.ball').pauseKeyframe();
}

function resume() {
    // resume keyframe animation
    $('.ball').resumeKeyframe();
}

function reset() {
    $('.ball').resetKeyframe();
}

// example callback function

function increment() {
    $('#cb').html(parseInt($('#cb').html()) + 1);
}


// ********** Mine **********

$(document).ready(function () {
    $("#changeSpeed").click(function () {
        var newSpeed = $("#speedIn").val();
        speed = newSpeed;
    });
});

$(document).ready(function () {
    $("#moveAngle").click(function () {
        var newAngle = $("#angleIn").val();
        angle = newAngle;
        // roll with linear timing
        $('.ball').playKeyframe({
            name: 'ball-rotate',
            duration: speed,
            timingFunction: 'ease',
            complete: increment
        });


    });
});

