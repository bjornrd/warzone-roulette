import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    Map {
        id: caldera
    }

    CalderaGridRouletteResultView {
        id: roulette_result_view
        width: parent.width
        height: parent.height/2

        anchors.top: parent.top
        anchors.left: parent.left

        x_coordinate: caldera.grid_x_coordinates[roulette_controller.x_coordinate_value]
        y_coordinate: caldera.grid_y_coordinates[roulette_controller.y_coordinate_value]


    }

    CalderaGridRouletteController {
        id: roulette_controller
        width: parent.width
        height: parent.height/2

        anchors.top: roulette_result_view.bottom
        anchors.left: parent.left

        onStateChanged: {

        }
    }

    GridMapSelector {
        id: map_selector
        z: 100

        anchors.fill: parent

        // TODO: I'd like the vertical center of this component to be centered on the screen, not relative to the component
        y_start: parent.height*3/10
        y_end: parent.height*6/10

        shape_fill_color: Qt.lighter(Material.primary, 5)
        shape_stroke_color: Material.primary

        onUseCalderaGridSignal: {roulette_controller.state = "caldera"}
        onUseRebirthGridSignal: {roulette_controller.state = "rebirth"}

    }
}
