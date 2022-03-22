import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: root

    text: "Roll"
    font.pointSize: 64
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
        anchors.fill: parent
        color: Material.background
    }
}
