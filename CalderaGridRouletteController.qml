import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    property int x_coordinate_value: 0
    property int x_coordinate_final_value: 0
    property int y_coordinate_value: 0

    property int x_roll_max: 0
    property int y_roll_max: 0

    property var map_grid: []

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
            if(x_roll_timer.running)
                x_roll_timer.stop()
            if(y_roll_timer.running)
                y_roll_timer.stop()

            roulette_behaviour.num_x_rolls = 0
            roulette_behaviour.num_y_rolls = 0
            x_roll_timer.interval = roulette_behaviour.roll_timer_base_interval
            y_roll_timer.interval = roulette_behaviour.roll_timer_base_interval

            root.y_coordinate_value = 0
            x_roll_timer.start()
        }
    }

    Timer {
        id: x_roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_x_rolls < roulette_behaviour.max_rolls

        onTriggered: doXRoll()
        onRunningChanged: {
            if(!running){
                root.x_coordinate_final_value = root.x_coordinate_value
                root.y_roll_max = root.map_grid[root.x_coordinate_final_value][1].length
                y_roll_timer.start()
            }
        }
    }

    Timer {
        id: y_roll_timer
        interval: roulette_behaviour.roll_timer_base_interval
        repeat: roulette_behaviour.num_y_rolls < roulette_behaviour.max_rolls

        onTriggered: doYRoll()
    }

    onMap_gridChanged: {
        if(x_roll_timer.running)
            x_roll_timer.stop()
        if(y_roll_timer.running)
            y_roll_timer.stop()

        roulette_behaviour.num_x_rolls = 0
        roulette_behaviour.num_y_rolls = 0
        x_roll_timer.interval = roulette_behaviour.roll_timer_base_interval
        y_roll_timer.interval = roulette_behaviour.roll_timer_base_interval

        root.x_coordinate_value = 0
        root.y_coordinate_value = 0
        root.x_coordinate_final_value = 0
        if(root.map_grid)
            root.x_roll_max = root.map_grid.length
    }


    function doXRoll()
    {
        var new_x_coordinate_value = Math.ceil(Math.random()*root.x_roll_max) - 1
        if(new_x_coordinate_value === root.x_coordinate_value)
        {
            while(new_x_coordinate_value === root.x_coordinate_value){
                new_x_coordinate_value = Math.ceil(Math.random()*root.x_roll_max) - 1
            }
        }

        root.x_coordinate_value = new_x_coordinate_value

        roulette_behaviour.num_x_rolls += 1
        x_roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_x_rolls*roulette_behaviour.roll_timer_interval_incr
    }

    function doYRoll()
    {
        if(root.y_roll_max === 1)
        {
            root.y_coordinate_value = 0
        } else {
            var new_y_coordinate_value = Math.ceil(Math.random()*root.y_roll_max) - 1
            if(new_y_coordinate_value === root.y_coordinate_value)
            {
                while(new_y_coordinate_value === root.y_coordinate_value){
                    new_y_coordinate_value = Math.ceil(Math.random()*root.y_roll_max) - 1
                }
            }

            root.y_coordinate_value = new_y_coordinate_value
        }
        roulette_behaviour.num_y_rolls += 1
        y_roll_timer.interval = roulette_behaviour.roll_timer_base_interval + roulette_behaviour.num_y_rolls*roulette_behaviour.roll_timer_interval_incr

    }
}
