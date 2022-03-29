import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root
    property int zone_value: 0
    property int num_zones: 0

    RouletteBehaviour {
        id: roulette_behaviour
        property int num_rolls: 0
        property int base_max_rolls: 21
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

        onPressAndHold: {
            if(roll_timer.running)
                roll_timer.stop()

            roulette_behaviour.max_rolls = 1
            roll_timer.interval = roulette_behaviour.roll_timer_base_interval
            roll_timer.start()
        }
    }

    Timer {
        id: roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_rolls < roulette_behaviour.max_rolls

        onTriggered: doRoll()
        onRunningChanged: {
            if(!running){
                roulette_behaviour.max_rolls = roulette_behaviour.base_max_rolls
            }
        }
    }

    function doRoll()
    {
        // Force new value for each roll
        var new_zone_value = Math.floor(Math.random()*root.num_zones)
        if (new_zone_value === root.zone_value)
        {
            while(new_zone_value === root.zone_value){
                new_zone_value = Math.floor(Math.random()*root.num_zones)
            }
        }
        root.zone_value = new_zone_value

        roulette_behaviour.num_rolls += 1
        roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_rolls*roulette_behaviour.roll_timer_interval_incr

    }
}
