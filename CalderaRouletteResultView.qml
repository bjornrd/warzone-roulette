import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    property string zone: ""
    property int font_pointSize: 42

    Text {
        id: zone_text
        text: zone.toString()
        font.bold: true
        font.pointSize: font_pointSize

        x: parent.width/2 - width/2
        y: parent.height/2

        color: Material.foreground
    }
}
