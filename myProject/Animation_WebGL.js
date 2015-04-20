var arm1PivotPoint;
var arm2PivotPoint;
var arm1speed;
var arm2speed;
var arm1angleNew = 0;
var arm2angleNew = 0;
var arm1angleNewRad = 0;
var arm2angleNewRad = 0;
var arm1angleCurrent = '0';
var arm2angleCurrent = '0';
var arm1angleCurrentRad = '0';
var arm2angleCurrentRad = '0';
var arm1Direction = true;  //bool positive direction = ture
var arm2Direction = true;
var arm1moveComplete = false;
var arm2moveComplete = false;

var boolRunContinous = false;
var boolRunMove = false;
var boolPause = false;

var renderer;
var scene;
var camera;

// ********** Initil Load **********
$(window).load(function () {

    // ***** Render and Set Scene
    renderer = new THREE.WebGLRenderer();
    var myFrame = $("#myFrame");
    var frameHeight = myFrame.height();
    var frameWidth = myFrame.width();
    renderer.setSize(frameHeight, frameHeight);

    // select the position where you want to add the output
    var toAdd = document.getElementById("myFrame");
    toAdd.appendChild(renderer.domElement);

    scene = new THREE.Scene();

    // ***** Camera
    camera = new THREE.PerspectiveCamera(
            100,             // Field of view
            frameHeight / frameWidth,      // Aspect ratio
            0.1,            // Near plane
            10000           // Far plane
    );
    camera.position.set(0, 0, 200);
    camera.lookAt(scene.position);

    // ***** Draw Objects *****
    var armThickness = 5;

    // ***** Matrials
    var materialArm1 = new THREE.MeshLambertMaterial();
    materialArm1.color = new THREE.Color(0x00d500);

    var materialArm2 = new THREE.MeshLambertMaterial();
    materialArm2.color = new THREE.Color(0xffa500);

    var materialPin = new THREE.MeshLambertMaterial();
    materialPin.color = new THREE.Color(0x808080);

    var materialTest = new THREE.MeshLambertMaterial();
    materialTest.color = new THREE.Color(0xff0000);

    // ***** Pivot Points
    arm1PivotPoint = new THREE.Object3D();
    arm1PivotPoint.name = 'arm1PivotPoint';
    scene.add(arm1PivotPoint);

    arm2PivotPoint = new THREE.Object3D();
    arm1PivotPoint.add(arm2PivotPoint);
    arm2PivotPoint.name = 'arm2PivotPoint';
    arm2PivotPoint.position.set(100, armThickness, 0);


    // ***** Pins
    //THREE.CylinderGeometry(radiusTop, radiusBottom, height, radiusSegments);
    var geometry1 = new THREE.CylinderGeometry(10, 10, armThickness * 2, 32);
    var Pin1 = new THREE.Mesh(geometry1, materialPin);
    Pin1.name = 'Pin1';
    arm1PivotPoint.add(Pin1);

    var geometry2 = new THREE.CylinderGeometry(10, 10, armThickness * 3, 32);
    var Pin2 = new THREE.Mesh(geometry2, materialPin);
    Pin2.name = 'Pin2';
    Pin2.position.set(100, armThickness / 2, 0);
    arm1PivotPoint.add(Pin2);

    var geometry3 = new THREE.CylinderGeometry(10, 10, armThickness * 2, 32);
    var Pin3 = new THREE.Mesh(geometry3, materialPin);
    Pin3.name = 'Pin3';
    arm2PivotPoint.add(Pin3);
    Pin3.position.set(100, 0, 0);


    // ***** Draw Arm1
    var geometry11 = new THREE.CylinderGeometry(20, 20, armThickness, 32);
    var Arm1Start = new THREE.Mesh(geometry11, materialArm1);
    Arm1Start.name = 'Arm1Start';
    arm1PivotPoint.add(Arm1Start);

    //THREE.BoxGeometry(Width(x), Height(y), Depth(z));
    var geometry12 = new THREE.BoxGeometry(100, armThickness, 40);
    var Arm1Middle = new THREE.Mesh(geometry12, materialArm1);
    Arm1Middle.name = 'Arm1Middle';
    Arm1Middle.position.set(50, 0, 0);
    arm1PivotPoint.add(Arm1Middle);

    var geometry13 = new THREE.CylinderGeometry(20, 20, armThickness, 32);
    var Arm1End = new THREE.Mesh(geometry13, materialArm1);
    Arm1End.name = 'Arm1End';
    Arm1End.position.set(100, 0, 0);
    arm1PivotPoint.add(Arm1End);

    // ***** Draw Arm2
    var geometry21 = new THREE.CylinderGeometry(20, 20, armThickness, 32);
    var arm2Start = new THREE.Mesh(geometry21, materialArm2);
    arm2Start.name = 'arm2Start';
    arm2PivotPoint.add(arm2Start);

    //THREE.BoxGeometry(Width(x), Height(y), Depth(z));
    var geometry22 = new THREE.BoxGeometry(100, armThickness, 40);
    var arm2Middle = new THREE.Mesh(geometry22, materialArm2);
    arm2Middle.name = 'arm2Middle';
    arm2Middle.position.set(50, 0, 0);
    arm2PivotPoint.add(arm2Middle);

    var geometry23 = new THREE.CylinderGeometry(20, 20, armThickness, 32);
    var arm2End = new THREE.Mesh(geometry23, materialArm2);
    arm2End.name = 'arm2End';
    arm2End.position.set(100, 0, 0);
    arm2PivotPoint.add(arm2End);

    //  Pivot to look at front
    arm1PivotPoint.rotation.x = Math.PI / 2;

    // ***** Static Test
    //arm1PivotPoint.rotation.y = Math.PI / 2;
    //arm2PivotPoint.rotation.y = Math.PI / 2;

    // ***** Lights
    var lightDirectional = new THREE.DirectionalLight();
    lightDirectional.position.set(0, 0, 20);
    scene.add(lightDirectional);

    var lightAmbient = new THREE.AmbientLight(0x303030); // soft white light
    scene.add(lightAmbient);

    renderer.render(scene, camera);

    //Push Current to Screen
    $('#arm1angleCurrent').html(arm1angleCurrent);
    $('#arm2angleCurrent').html(arm2angleCurrent);

});

// ********** Continous Motion Play **********
function playStart() {
    boolPause = false;
    boolRunMove = false;
    changeSpeed();
    if (!boolRunContinous) {
        boolRunContinous = true;
        play();
    }
}

function play() {
    if (boolPause || !boolRunContinous) { return; }
    renderer.render(scene, camera);
    scene.getObjectByName('arm1PivotPoint').rotation.y += arm1speed;
    scene.getObjectByName('arm2PivotPoint').rotation.y += arm2speed;
    angleCurrent();
    requestAnimationFrame(play);
}

// ********** Move To Angle **********
function moveStart() {
    boolPause = false;
    boolRunContinous = false;

    changeSpeed();
    moveGetAngles();
    arm1moveComplete = false;
    arm2moveComplete = false;

    if (!boolRunMove) {
        boolRunMove = true;
        move();
    }
}
function move() {
    if (boolPause || !boolRunMove) {
        return;
    }
    renderer.render(scene, camera);

    angleCurrent();
    var angleNextRad;

    if (!arm1moveComplete) {
        if (arm1Direction) {
            angleNextRad = arm1angleCurrentRad + arm1speed;
            if (angleNextRad < arm1angleNewRad) {
                scene.getObjectByName('arm1PivotPoint').rotation.y = angleNextRad;
            } else {
                scene.getObjectByName('arm1PivotPoint').rotation.y = arm1angleNewRad;
                arm1moveComplete = true;
                angleCurrent();
            }
        } else {
            angleNextRad = arm1angleCurrentRad - arm1speed;
            if (angleNextRad > arm1angleNewRad) {
                scene.getObjectByName('arm1PivotPoint').rotation.y = angleNextRad;
            } else {
                scene.getObjectByName('arm1PivotPoint').rotation.y = arm1angleNewRad;
                arm1moveComplete = true;
                angleCurrent();
            }
        }
    }

    if (!arm2moveComplete) {
        if (arm2Direction) {
            angleNextRad = arm2angleCurrentRad + arm2speed;
            if (angleNextRad < arm2angleNewRad) {
                scene.getObjectByName('arm2PivotPoint').rotation.y = angleNextRad;
            } else {
                scene.getObjectByName('arm2PivotPoint').rotation.y = arm2angleNewRad;
                arm2moveComplete = true;
                angleCurrent();
            }
        } else {
            angleNextRad = arm2angleCurrentRad - arm2speed;
            if (angleNextRad > arm2angleNewRad) {
                scene.getObjectByName('arm2PivotPoint').rotation.y = angleNextRad;
            } else {
                scene.getObjectByName('arm2PivotPoint').rotation.y = arm2angleNewRad;
                arm2moveComplete = true;
                angleCurrent();
            }
        }
    }

     if (arm1moveComplete && arm2moveComplete) {
        boolRunMove = false;
        renderer.render(scene, camera);
    } else {
        requestAnimationFrame(move);
    }

}

// ********** Basic Controls **********
function pauseFrame() {
    boolPause = true;
}

function resumeFrame() {
    boolPause = false;
    if (boolRunContinous) { play(); }
}

function resetFrame() {
    boolRunContinous = false;
    boolRunMove = false;
    boolPause = false;
    arm1moveComplete = false;
    arm2moveComplete = false;
    goHome();
}

// ********** Utilities **********
function changeSpeed() {
    var newSpeed = $("#arm1speedIn").val();
    if (newSpeed == 0) {
        arm1speed = 0;
    } else {
        arm1speed = 2 * Math.PI / newSpeed / 60;
    }
    newSpeed = $("#arm2speedIn").val();
    if (newSpeed == 0) {
        arm2speed = 0;
    } else {
        arm2speed = 2 * Math.PI / newSpeed / 60;
    }
}

function goHome() {
    scene.getObjectByName('arm1PivotPoint').rotation.y = 0;
    scene.getObjectByName('arm2PivotPoint').rotation.y = 0;
    arm1angleCurrent = 0;
    arm2angleCurrent = 0;
    renderer.render(scene, camera);
    //Push Current to Screen
    $('#arm1angleCurrent').html(0);
    $('#arm2angleCurrent').html(0);
    arm1angleNew = 0;
    arm2angleNew = 0;
}

function moveGetAngles() {
    angleCurrent();

    //Retreive New From Screen
    arm1angleNew = $("#arm1angleNewIn").val();
    arm2angleNew = $("#arm2angleNewIn").val();

    arm1angleNewRad = arm1angleNew / 180 * Math.PI;
    arm2angleNewRad = arm2angleNew / 180 * Math.PI;


    if (arm1angleCurrent < arm1angleNew) {
        arm1Direction = true;
    } else {
        arm1Direction = false;
    }

    if (arm2angleCurrent < arm2angleNew) {
        arm2Direction = true;
    } else {
        arm2Direction = false;
    }
}

function angleCurrent() {
    arm1angleCurrentRad = scene.getObjectByName('arm1PivotPoint').rotation.y;
    arm2angleCurrentRad = scene.getObjectByName('arm2PivotPoint').rotation.y;

    arm1angleCurrent = arm1angleCurrentRad * 180 / Math.PI;
    arm2angleCurrent = arm2angleCurrentRad * 180 / Math.PI;

    //Push Current to Screen
    $('#arm1angleCurrent').html(arm1angleCurrent.toFixed());
    $('#arm2angleCurrent').html(arm2angleCurrent.toFixed());
}
