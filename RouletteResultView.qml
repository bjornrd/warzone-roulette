import QtQuick 2.0

ListView {
    property string x_coordinate: "A"
    property string y_coordinate: "1"

    leftMargin: 0
    rightMargin: 0
    topMargin: 0
    bottomMargin: 0

    Item {
        Text {
            id: x_coordinate_text
            text: x_coordinate.toString().toUpperCase()
            font.bold: true
            font.pointSize: 32
        }

        Text {
            id: y_coordinate_text
            text: y_coordinate.toString()
            anchors.left: x_coordinate_text.right
            anchors.leftMargin: 30
            font.bold: true
            font.pointSize: 32
        }
    }


}
