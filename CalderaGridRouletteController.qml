import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    property int x_coordinate_value: 0
    property int y_coordinate_value: 0

    state: "caldera"
    onStateChanged: {console.log(state)}

    QtObject {
        id: internal
        property int x_roll_max: 10
        property int y_roll_max: 9
    }

    states: [
        State {
            name: "caldera"
            PropertyChanges {
                target: internal
                x_roll_max: 10
                y_roll_max: 9
            }
        },

        State {
            name: "rebirth"
            PropertyChanges {
                target: internal
                x_roll_max: 10
                y_roll_max: 9
            }
        }
    ]

    RouletteBehaviour {
        id: roulette_behaviour
        property int num_x_rolls: 0
        property int num_y_rolls: 0
    }

    RollButton {
        id: roll_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height/2

        onClicked: {
            roulette_behaviour.num_x_rolls = 0
            roulette_behaviour.num_y_rolls = 0
            x_roll_timer.interval = roulette_behaviour.roll_timer_base_interval
            y_roll_timer.interval = roulette_behaviour.roll_timer_base_interval

            x_roll_timer.start()
            y_roll_timer.start()
        }
    }

    Timer {
        id: x_roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_x_rolls < roulette_behaviour.max_rolls

        onTriggered: doXRoll()
    }

    Timer {
        id: y_roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_y_rolls < roulette_behaviour.max_rolls

        onTriggered: doYRoll()
    }


    function doXRoll()
    {
        var new_x_coordinate_value = Math.floor(Math.random()*internal.x_roll_max)
        if(new_x_coordinate_value === root.x_coordinate_value)
        {
            while(new_x_coordinate_value === root.x_coordinate_value){
                new_x_coordinate_value = Math.floor(Math.random()*internal.x_roll_max)
            }
        }

        root.x_coordinate_value = new_x_coordinate_value

        roulette_behaviour.num_x_rolls += 1
        x_roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_x_rolls*roulette_behaviour.roll_timer_interval_incr
    }

    function doYRoll()
    {
        var new_y_coordinate_value = Math.floor(Math.random()*internal.y_roll_max)
        if(new_y_coordinate_value === root.y_coordinate_value)
        {
            while(new_y_coordinate_value === root.y_coordinate_value){
                new_y_coordinate_value = Math.floor(Math.random()*internal.y_roll_max)
            }
        }

        root.y_coordinate_value = new_y_coordinate_value

        roulette_behaviour.num_y_rolls += 1
        y_roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_y_rolls*roulette_behaviour.roll_timer_interval_incr
    }
}
