/*
 This file is part of WarzoneRoulette.

 WarzoneRoulette is free software: you can redistribute it and/or modify it under the terms of the
 GNU General Public License as published by the Free Software Foundation, either version 3 of the License,
 or (at your option) any later version.

 WarzoneRoulette is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the GNU General Public License for more details.

 You should have received a copy of the GNU General Public License along with WarzoneRoulette.
 If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    Map {
        id: map
    }

    GridRouletteResultView {
        id: roulette_result_view
        width: parent.width
        height: parent.height/2

        anchors.top: parent.top
        anchors.left: parent.left

        x_coordinate: map.grid_coordinates[roulette_controller.x_coordinate_value][0]
        y_coordinate: map.grid_coordinates[roulette_controller.x_coordinate_final_value][1][roulette_controller.y_coordinate_value]
    }

    GridRouletteController {
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
        y_start: parent.height*3/10
        y_end: parent.height*6/10

        background_color: Material.background

        onUseCalderaGridSignal: map.state = "caldera"
        onUseRebirthGridSignal: map.state = "rebirth"

    }
}
