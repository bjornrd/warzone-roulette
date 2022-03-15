import QtQuick 2.0

Item {
    property string zone: ""
    property int font_pointSize: 32

    Text {
        id: zone_text
        text: zone.toString()
        font.bold: true
        font.pointSize: font_pointSize

        anchors.centerIn: parent
    }
}
