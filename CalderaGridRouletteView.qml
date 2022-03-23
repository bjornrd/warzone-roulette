import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    Map {
        id: map
    }

    CalderaGridRouletteResultView {
        id: roulette_result_view
        width: parent.width
        height: parent.height/2

        anchors.top: parent.top
        anchors.left: parent.left

        x_coordinate: map.grid_coordinates[roulette_controller.x_coordinate_value][0]
        y_coordinate: map.grid_coordinates[roulette_controller.x_coordinate_final_value][1][roulette_controller.y_coordinate_value]
    }

    CalderaGridRouletteController {
        id: roulette_controller
        width: parent.width
        height: parent.height/2

        anchors.top: roulette_result_view.bottom
        anchors.left: parent.left

        map_grid: map.grid_coordinates
    }

    GridMapSelector {
        id: map_selector
        z: 100

        anchors.fill: parent

        // TODO: I'd like the vertical center of this component to be centered on the screen, not relative to the component
        y_start: parent.height*2/10
        y_end: parent.height*5/10

        shape_fill_color: Qt.lighter(Material.primary, 3)
        shape_stroke_color: Material.primary

        onUseCalderaGridSignal: {map.state = "caldera"}
        onUseRebirthGridSignal: {map.state = "rebirth"}

    }
}
