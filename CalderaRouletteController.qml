import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.15

Item {
    property int zone_value: 0

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
        zone_value = Math.floor(Math.random()*15)
    }
}
