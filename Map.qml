import QtQuick 2.0

Item {
    property alias grid_x_coordinates: grid.x_coordinates
    property alias grid_y_coordinates: grid.y_coordinates

    MapGrid {
        id: grid
    }
}
