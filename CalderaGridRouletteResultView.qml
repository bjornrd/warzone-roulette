import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    property string x_coordinate: "A"
    property string y_coordinate: "1"

    property int font_pointSize: 42

    Item {
        width: parent.width
        height: parent.height

        Text {
            id: x_coordinate_text
            text: x_coordinate.toString().toUpperCase()
            font.bold: true
            font.pointSize: font_pointSize

            x: parent.width/2 - (width + y_coordinate_text.width + y_coordinate_text.anchors.leftMargin)/2
            y: parent.height/2

            color: Material.foreground
        }

        Text {
            id: y_coordinate_text
            text: y_coordinate.toString()
            font.bold: true
            font.pointSize: font_pointSize

            anchors.left: x_coordinate_text.right
            anchors.leftMargin: 30
            anchors.top: x_coordinate_text.top

            color: Material.foreground
        }
    }
}
