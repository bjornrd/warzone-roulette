import QtQuick 2.0

Item {
    RebirthZones {
        id: zones
    }

    RebirthRouletteResultView {
        id: roulette_result_view
        width: parent.width
        height: parent.height/2

        anchors.top: parent.top
        anchors.left: parent.left

        zone: zones.zones[roulette_controller.zone_value]
    }

    RebirthRouletteController {
        id: roulette_controller
        width: parent.width
        height: parent.height/2

        anchors.top: roulette_result_view.bottom
        anchors.left: parent.left
    }
}
