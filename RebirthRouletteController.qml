import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root
    property int zone_value: 0

    RouletteBehaviour {
        id: roulette_behaviour
        property int num_rolls: 0
    }

    RollButton {
        id: roll_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height/2

        onClicked: {
            roulette_behaviour.num_rolls = 0
            roll_timer.interval = roulette_behaviour.roll_timer_base_interval
            roll_timer.start()
        }
    }

    Timer {
        id: roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_rolls < roulette_behaviour.max_rolls

        onTriggered: doRoll()
    }

    function doRoll()
    {
        // Force new value for each roll
        var new_zone_value = Math.floor(Math.random()*10)
        if (new_zone_value === root.zone_value)
        {
            while(new_zone_value === root.zone_value){
                new_zone_value = Math.floor(Math.random()*10)
            }
        }
        root.zone_value = new_zone_value

        roulette_behaviour.num_rolls += 1
        roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_rolls*roulette_behaviour.roll_timer_interval_incr

    }
}
