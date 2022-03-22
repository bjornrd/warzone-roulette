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

        GridMapSelector {
            id: map_selector

            anchors.fill: parent

            y_start: parent.height*3/10
            y_end: parent.height*9/10

            shape_fill_color: Qt.lighter(Material.primary, 5)
            shape_stroke_color: Material.primary

        }
    }

    CalderaGridRouletteController {
        id: roulette_controller
        width: parent.width
        height: parent.height/2

        anchors.top: roulette_result_view.bottom
        anchors.left: parent.left
    }


}
