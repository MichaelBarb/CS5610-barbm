var arm1speed;
var arm2speed;
var arm1angleNew;
var arm2angleNew;
var arm1angleLast = '0';
var arm2angleLast = '0';
var movToggle = 0;

// ********** Load **********
$(window).load(function () {

    // Get the css browser code (ie: -moz-)
    var pfx = $.keyframe.getVendorPrefix();

    //Note the variable notation to be able to add vendor specific prefix
    var transform = pfx + 'transform';

    // Setup the initial 'transform' style.
    $('.arm1').css(transform, 'translate(200px,200px)');
    $('.arm2').css(transform, 'translate(100px, -40px)');

    // Adding a new animation sequences (keyframe)
    $.keyframe.define([{
        name: 'rot1',
        '0%': { 'transform': 'translate(200px,200px) rotate(0deg)' },
        '50%': { 'transform': 'translate(200px,200px) rotate(180deg)' },
        '50.001%': { 'transform': 'translate(200px,200px) rotate(-179deg)' },
        '100%': { 'transform': 'translate(200px,200px) rotate(0deg)' }
    }, {
        name: 'rot2',
        '0%': { 'transform': 'translate(100px, -40px) rotate(0deg)' },
        '50%': { 'transform': 'translate(100px, -40px) rotate(180deg)' },
        '99.9999%': { 'transform': 'translate(100px, -40px) rotate(360deg)' },
        '100%': { 'transform': 'translate(100px, -40px) rotate(0deg)' }
    }]);

    moveArmsUpdateKeyframes();
});

function moveArmsUpdateKeyframes() {
    //Retreive New From Screen
    arm1angleNew = $("#arm1angleNewIn").val();
    arm2angleNew = $("#arm2angleNewIn").val();
    //Push Last to Screen
    $('#arm1angleLast').html(arm1angleLast);
    $('#arm2angleLast').html(arm2angleLast);

    if (Boolean(movToggle)) {
        // Set new animation sequences (keyframe)
        $.keyframe.define([{
            name: 'mov1a',
            'from': { 'transform': 'translate(200px,200px) rotate(' + arm1angleLast + 'deg)' },
            'to': { 'transform': 'translate(200px,200px) rotate(' + arm1angleNew + 'deg)' }
        }]);
        $.keyframe.define([{
            name: 'mov2a',
            'from': { 'transform': 'translate(100px, -40px) rotate(' + arm2angleLast + 'deg)' },
            'to': { 'transform': 'translate(100px, -40px) rotate(' + arm2angleNew + 'deg)' }
        }]);
    } else {
        // Set new animation sequences (keyframe)
        $.keyframe.define([{
            name: 'mov1b',
            'from': { 'transform': 'translate(200px,200px) rotate(' + arm1angleLast + 'deg)' },
            'to': { 'transform': 'translate(200px,200px) rotate(' + arm1angleNew + 'deg)' }
        }]);
        $.keyframe.define([{
            name: 'mov2b',
            'from': { 'transform': 'translate(100px, -40px) rotate(' + arm2angleLast + 'deg)' },
            'to': { 'transform': 'translate(100px, -40px) rotate(' + arm2angleNew + 'deg)' }
        }]);
    }
}

// ********** Play **********
function play(animation) {
    changeSpeed();
    $('.arm1').resetKeyframe(function () {
        $('.arm1').playKeyframe({
            name: 'rot1',
            duration: arm1speed,
            timingFunction: 'linear',
            delay: 0,
            iterationCount: 'infinite',
            direction: 'normal',
            fillMode: 'forwards',
            //complete: increment
        });
    });
    $('.arm2').resetKeyframe(function () {
        $('.arm2').playKeyframe({
            name: 'rot2',
            duration: arm2speed,
            timingFunction: 'linear',
            delay: 0,
            iterationCount: 'infinite',
            direction: 'normal',
            fillMode: 'forwards',
            //complete: increment
        });
    });
}

// ********** Basic Controlws **********
function pauseFrame() {
    // freeze keyframe animation and kill callback
    $('.arm1').pauseKeyframe();
    $('.arm2').pauseKeyframe();
}

function resumeFrame() {
    // resume keyframe animation
    $('.arm1').resumeKeyframe();
    $('.arm2').resumeKeyframe();
}

function resetFrame() {
    $('.arm1').resetKeyframe();
    $('.arm2').resetKeyframe();
    arm1angleLast = '0';
    arm2angleLast = '0';
    moveArmsUpdateKeyframes();
}

// example callback function

function increment() {
    $('#cb').html(parseInt($('#cb').html()) + 1);
}

// ********** Mine **********

function changeSpeed() {
    var newSpeed = $("#arm1speedIn").val();
    arm1speed = newSpeed + 's';
    newSpeed = $("#arm2speedIn").val();
    arm2speed = newSpeed + 's';
}

function moveArmsUpdate() {
    //pause();

    moveArmsUpdateKeyframes();
    //setTimeout(function () { moveArmsContinue(); }, 2000);
    //moveArmsContinue();

    //Save New in Last for Next time
    arm1angleLast = arm1angleNew;
    arm2angleLast = arm2angleNew;
}
function moveArms(animation) {
    changeSpeed();
    moveArmsUpdate();
    arm1angleLast = arm1angleNew;
    arm2angleLast = arm2angleNew;

    if (Boolean(movToggle)) {
        // Run Moves
        $('.arm1').resetKeyframe(function () {
            $('.arm1').playKeyframe({
                name: 'mov1a',
                duration: arm2speed,
                timingFunction: 'linear',
                delay: 0,
                iterationCount: '1',
                direction: 'normal',
                fillMode: 'forwards',
                complete: increment
            });
        });
        $('.arm2').resetKeyframe(function () {
            $('.arm2').playKeyframe({
                name: 'mov2a',
                duration: arm2speed,
                timingFunction: 'linear',
                delay: 0,
                iterationCount: '1',
                direction: 'normal',
                fillMode: 'forwards',
                //complete: increment
            });
        });
        movToggle = 0;
    } else {
        $('.arm1').resetKeyframe(function () {
            $('.arm1').playKeyframe({
                name: 'mov1b',
                duration: arm2speed,
                timingFunction: 'linear',
                delay: 0,
                iterationCount: '1',
                direction: 'normal',
                fillMode: 'forwards',
                complete: increment
            });
        });
        $('.arm2').resetKeyframe(function () {
            $('.arm2').playKeyframe({
                name: 'mov2b',
                duration: arm2speed,
                timingFunction: 'linear',
                delay: 0,
                iterationCount: '1',
                direction: 'normal',
                fillMode: 'forwards',
                //complete: increment
            });
        });
        movToggle = 1;
    }
}
