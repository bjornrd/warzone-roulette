import QtQuick 2.0
import QtQuick.Controls.Material 2.15


Item {
    Map {
        id: caldera
    }

    RouletteResultView {
        id: roulette_result_view
        width: parent.width
        height: parent.height/2

        anchors.top: parent.top
        anchors.left: parent.left

        x_coordinate: caldera.grid_x_coordinates[roulette_controller.x_coordinate_value]
        y_coordinate: caldera.grid_y_coordinates[roulette_controller.y_coordinate_value]
    }

    RouletteController {
        id: roulette_controller
        width: parent.width
        height: parent.height/2

        anchors.top: roulette_result_view.bottom
        anchors.left: parent.left
    }
}
