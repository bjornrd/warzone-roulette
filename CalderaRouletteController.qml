import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root
    property int zone_value: 0

    QtObject {
        id: internal
        property int num_rolls: 0
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
            internal.num_rolls = 0
            roll_timer.interval = internal.roll_timer_base_interval
            roll_timer.start()
        }
    }

    Timer {
        id: roll_timer
        interval: internal.roll_timer_base_interval
        repeat: internal.num_rolls < internal.max_rolls

        onTriggered: doRoll()
    }

    function doRoll()
    {
        // Force new value for each roll
        var new_zone_value = Math.floor(Math.random()*15)
        if (new_zone_value === root.zone_value)
        {
            while(new_zone_value === root.zone_value){
                new_zone_value = Math.floor(Math.random()*15)
            }
        }
        root.zone_value = new_zone_value

        internal.num_rolls += 1
        roll_timer.interval = internal.roll_timer_base_interval + internal.num_rolls*internal.roll_timer_interval_incr

    }
}
