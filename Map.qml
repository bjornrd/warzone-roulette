/*
 This file is part of WarzoneRoulette.

 WarzoneRoulette is free software: you can redistribute it and/or modify it under the terms of the
 GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License,
 or (at your option) any later version.

 WarzoneRoulette is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with WarzoneRoulette.
 If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.0

Item {
    id: root

    property alias grid_coordinates: grid.coordinates

    state: "caldera"

    MapGrid {
        id: grid
        coordinates: []
    }

    states: [
        State {
            name: "caldera"
            PropertyChanges {
                target: grid
                coordinates: grid.caldera_valid_coordinates
            }
        },

        State {
            name: "rebirth"
            PropertyChanges {
                target: grid
                coordinates: grid.rebirth_valid_coordinates
            }
        }
    ]
}
