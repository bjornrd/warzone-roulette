import QtQuick 2.0

Item {    
    property string x_coordinates: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    property string y_coordinates: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    property var caldera_coordinates: [
                                        ["A", []],
                                        ["B", [4,5,6]],
                                        ["C", [2,3,4,5,6,7]],
                                        ["D", [2,3,4,5,6,7,8]],
                                        ["E", [1,2,3,4,5,6,7,8]],
                                        ["F", [1,2,3,4,5,6,7,8,9]],
                                        ["G", [1,2,3,4,5,6,7,8,9]],
                                        ["H", [1,2,3,4,5,6,7,8,9]],
                                        ["I", [2,3,4,5,6,7,8]],
                                        ["J", []],
                                       ]

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
