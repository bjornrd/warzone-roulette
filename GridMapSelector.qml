import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Shapes 1.15
import QtQuick.Controls.Material 2.15

Item {
    id: root

    property int y_start: 0
    property int y_end: 0
    property int section_height: y_end - y_start
    property int section_width: 100

    property alias shape_fill_color: shape_path.fillColor
    property alias shape_stroke_color: shape_path.strokeColor

    signal useCalderaGridSignal
    signal useRebirthGridSignal

    Shape {
        id: shape

        property alias y_safe_region_start: tl.y
        property alias y_safe_region_end: ml.y
        property alias x_safe_region_start: ml.x
        property alias x_safe_region_end: shape_path.startX

        ShapePath {
            id: shape_path
            startX: root.width
            startY: root.y_start

            PathLine {
                id: tl
                x: root.width - root.section_width/2
                y: root.y_start + 50
            }

            PathLine {
                id: ml
                x: tl.x
                y: tl.y + section_height
            }

            PathLine {
                id: bl
                x: ml.x + root.section_width/2
                y: ml.y + 50
            }
        }
    }


    Button {
        id: caldera_button
        x: shape.x_safe_region_start
        y: shape.y_safe_region_start + width
        z: 40
        width: (shape.y_safe_region_end - shape.y_safe_region_start)/2
        height:(shape.x_safe_region_end - shape.x_safe_region_start)
        checkable: true
        checked: true


        contentItem: Text {
            text: "Caldera"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: parent.checked ? Material.accent : Material.foreground
            font.pointSize: 16
            font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase
        }

        background: Rectangle {
            anchors.fill: parent
            color: root.shape_fill_color
        }

        onClicked: {
            root.useCalderaGridSignal()
        }

        transform: Rotation {
            origin.x: 0
            origin.y: 0
            angle: -90
        }
    }

    Button {
        id: rebirth_button
        x: shape.x_safe_region_start
        y: shape.y_safe_region_start + 2*width
        z: 40
        width: (shape.y_safe_region_end - shape.y_safe_region_start)/2
        height:(shape.x_safe_region_end - shape.x_safe_region_start)
        checkable: true
        checked: false

        property bool selected: false

        contentItem: Text {
            text: "Rebirth"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: parent.checked ? Material.accent : Material.foreground
            font.pointSize: 16
            font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase
        }

        background: Rectangle {
            anchors.fill: parent
            color: root.shape_fill_color
        }

        onClicked: {
            root.useRebirthGridSignal()
        }

        transform: Rotation {
            origin.x: 0
            origin.y: 0
            angle: -90
        }
    }

    ButtonGroup {
        buttons: [caldera_button, rebirth_button]
    }


    Component.onCompleted: root.useCalderaGridSignal()



}
