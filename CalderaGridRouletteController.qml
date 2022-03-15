import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    property int x_coordinate_value: 0
    property int y_coordinate_value: 0

    Button {
        id: roll_button
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height/2


        text: "Roll"
        font.bold: true
        font.pointSize: 48

        onClicked: {
            doRoll()
        }
    }

    function doRoll()
    {
        x_coordinate_value = Math.floor(Math.random()*10)
        y_coordinate_value = Math.floor(Math.random()*9)
    }
}
