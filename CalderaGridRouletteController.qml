import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    property int x_coordinate_value: 0
    property int y_coordinate_value: 0

    QtObject {
        id: internal
        property int num_x_rolls: 0
        property int num_y_rolls: 0
        property int max_rolls: 21

        property int roll_timer_base_interval: 35
        property int roll_timer_interval_incr: 10
    }

    Button {
        id: roll_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height/2

        text: "Roll"
        font.pointSize: 64
        font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase

        contentItem: Text {
            text: roll_button.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font: roll_button.font
            color: roll_button.down ? Material.accent : Material.foreground
        }

        background: Rectangle {
            anchors.fill: parent
            color: Material.background
        }

        onClicked: {
            internal.num_x_rolls = 0
            internal.num_y_rolls = 0
            x_roll_timer.interval = internal.roll_timer_base_interval
            y_roll_timer.interval = internal.roll_timer_base_interval

            x_roll_timer.start()
            y_roll_timer.start()
        }
    }

    Timer {
        id: x_roll_timer
        interval: internal.roll_timer_base_interval
        repeat: internal.num_x_rolls < internal.max_rolls

        onTriggered: doXRoll()
    }

    Timer {
        id: y_roll_timer
        interval: internal.roll_timer_base_interval
        repeat: internal.num_y_rolls < internal.max_rolls

        onTriggered: doYRoll()
    }


    function doXRoll()
    {
        var new_x_coordinate_value = Math.floor(Math.random()*10)
        if(new_x_coordinate_value === root.x_coordinate_value)
        {
            while(new_x_coordinate_value === root.x_coordinate_value){
                new_x_coordinate_value = Math.floor(Math.random()*10)
            }
        }

        root.x_coordinate_value = new_x_coordinate_value

        internal.num_x_rolls += 1
        x_roll_timer.interval = internal.roll_timer_base_interval + internal.num_x_rolls*internal.roll_timer_interval_incr
    }

    function doYRoll()
    {
        var new_y_coordinate_value = Math.floor(Math.random()*9)
        if(new_y_coordinate_value === root.y_coordinate_value)
        {
            while(new_y_coordinate_value === root.y_coordinate_value){
                new_y_coordinate_value = Math.floor(Math.random()*9)
            }
        }

        root.y_coordinate_value = new_y_coordinate_value

        internal.num_y_rolls += 1
        y_roll_timer.interval = internal.roll_timer_base_interval + internal.num_y_rolls*internal.roll_timer_interval_incr
    }
}
