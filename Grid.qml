import QtQuick 2.0

Item {
    property string x_coordinates: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    property int y_coordinates: [1,2,3,4,5,6,7,8,9]

    property alias current_coordinate: current_coordinate

    Coordinate {
        id: current_coordinate
        x_coordinate: x_coordinates[0]
        y_coordinate: y_coordinates[0]
    }



    function setCoordinate(x, y)
    {
        x_coordinate = x;
        y_coordinate = y;
    }
}
