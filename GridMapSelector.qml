/*
 This file is part of WarzoneRoulette.

 WarzoneRoulette is free software: you can redistribute it and/or modify it under the terms of the
 GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License,
 or (at your option) any later version.

 WarzoneRoulette is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with WarzoneRoulette.
 If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls.Material 2.15

Item {
    id: root

    property int y_start: 0
    property int y_end: 0
    property int section_height: y_end - y_start
    property int section_width: 75

    property alias background_color: background.color

    signal useCalderaGridSignal
    signal useRebirthGridSignal

    Rectangle {
        id: background

        width: root.section_height
        height: root.section_width

        y: root.y_start + width
        x: root.width - height

        Button {
            id: caldera_button
            width: background.width/2
            height: background.height
            anchors.right: background.right
            checkable: true
            checked: true

            contentItem: Text {
                text: "Caldera"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: parent.checked ? Material.accent : Material.foreground
                font.pointSize: 16
                font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase
                font.bold: parent.checked
            }

            background: Rectangle {
                anchors.fill: parent
                color: background.color
            }

            onClicked: {
                root.useCalderaGridSignal()
            }

        }

        Button {
            id: rebirth_button
            width: background.width/2
            height: background.height
            anchors.left: background.left
            checkable: true
            checked: false

            contentItem: Text {
                text: "Rebirth"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: parent.checked ? Material.accent : Material.foreground
                font.pointSize: 16
                font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase
                font.bold: parent.checked
            }

            background: Rectangle {
                anchors.fill: parent
                color: background.color
            }

            onClicked: {
                root.useRebirthGridSignal()
            }
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
