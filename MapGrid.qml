/*
 This file is part of WarzoneRoulette.

 WarzoneRoulette is free software: you can redistribute it and/or modify it under the terms of the
 GNU General Public License as published by the Free Software Foundation, either version 3 of the License,
 or (at your option) any later version.

 WarzoneRoulette is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the GNU General Public License for more details.

 You should have received a copy of the GNU General Public License along with WarzoneRoulette.
 If not, see <https://www.gnu.org/licenses/>.
*/

import QtQuick 2.0

Item {    
    property var coordinates: []


    property var caldera_valid_coordinates: [
//                                                ["A", []],
                                                ["B", ["3", "4", "5", "6"]],
                                                ["C", ["1", "2", "3", "4", "5", "6", "7"]],
                                                ["D", ["1", "2", "3", "4", "5", "6", "7", "8"]],
                                                ["E", ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]],
                                                ["F", ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]],
                                                ["G", ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]],
                                                ["H", ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]],
                                                ["I", ["1", "2", "3", "4", "5", "6", "7", "8"]]
//                                                ["J", []],
                                            ]

    property var rebirth_valid_coordinates: [
//                                                ["A", []],
//                                                ["B", []],
                                                ["C", ["6"]],
                                                ["D", ["5", "6", "7"]],
                                                ["E", ["3", "4", "5", "6", "7"]],
                                                ["F", ["3", "4", "5", "6"]],
                                                ["G", ["2", "3", "4", "5", "6"]],
                                                ["H", ["2", "3", "4"]]
//                                                ["I", []],
//                                                ["J", []]
                                            ]
}
