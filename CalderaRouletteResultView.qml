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
    property string zone: ""
    property int font_pointSize: 42

    Text {
        id: zone_text
        text: zone.toString()
        font.bold: true
        font.pointSize: font_pointSize

        x: parent.width/2 - width/2
        y: parent.height/2

        color: Material.accent
    }
}
