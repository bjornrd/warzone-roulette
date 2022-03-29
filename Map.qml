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
