var btn4_state = 0;

$(function () {
    $("#btn1").button({
        icons: {
            primary: "ui-icon-locked"
        },
        text: false
    });
    $("#btn1").click(btn1_click);

    $("#btn2").button({
        icons: {
            primary: "ui-icon-locked"
        }
    });
    $("#btn2").click(btn2_click);

    $("#btn3").button({
        icons: {
            primary: "ui-icon-gear",
            secondary: "ui-icon-triangle-1-s"
        }
    });
    $("#btn3").click(btn3_click);

    $("#btn4").button(btn4_icons("ui-icon-triangle-1-s", btn4_state));
    $("#btn4").click(btn4_click);

    function btn1_click() {
        alert("Button 1 Pressed");
    }
    function btn2_click() {
        alert("Button 2 Pressed");
    }
    function btn3_click() {
        alert("Button 3 Pressed");
    }

    function btn4_click() {
        btn4_state++;
        if (btn4_state == 5) { btn4_state = 1; }
        switch (btn4_state) {
            case 1:
                btn4_icons("ui-icon-circle-arrow-n", btn4_state);
                break;
            case 2:
                btn4_icons("ui-icon-circle-arrow-e", btn4_state);
                break;
            case 3:
                btn4_icons("ui-icon-circle-arrow-s", btn4_state);
                break;
            case 4:
                btn4_icons("ui-icon-circle-arrow-w", btn4_state);
                break;
        }
    }

    function btn4_icons(newIcon, newText) {
        $("#btn4").button({
            icons: {
                primary: "ui-icon-gear",
                secondary: newIcon
            },
            text: true,
            label: newText
        });
    }

});
