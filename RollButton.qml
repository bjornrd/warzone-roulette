import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Button {
    id: root

    signal pressureChanged(real pressure)

    text: "Roll"
    font.pointSize: down ? 64 : 72
    font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase

    contentItem: Text {
        id: text_item
        text: root.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font: root.font
        color: root.down ? Material.accent : Material.foreground
    }

    background: Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: Material.background

//        MultiPointTouchArea {
//            anchors.fill: parent
//            touchPoints: [
//                TouchPoint {
//                    id: point1

//                    onPressureChanged: {
//                        root.pressureChanged(point1.pressure)
//                        console.log(pressure)
//                    }
//                }
//            ]
//         }
    }        

}
