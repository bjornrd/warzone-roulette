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
