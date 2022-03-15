import QtQuick 2.0
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 480
    height: width*2.06
    visible: true
    title: "Warzone Roulette"

    // Caldera grid
    // Caldera names
    // Rebirth names

    header: ToolBar {
        Button {
            id: caldera_grid_menu_button
            text: "Caldera Grid"
            width: parent.width/3
            height: parent.height
        }

        Button {
            id: caldera_menu_button
            text: "Caldera"
            width: parent.width/3
            height: parent.height
            anchors.left: caldera_grid_menu_button.right
        }

        Button {
            id: rebirth_menu_button
            text: "Rebirth"
            width: parent.width/3
            height: parent.height
            anchors.left: caldera_menu_button.right
        }
    }

    StackView {
        id: stack
        initialItem: roulette_view
        anchors.fill: parent

    }


    RouletteView {
        id: roulette_view
//        anchors.fill: parent
//        width: parent.width
//        height: parent.height
    }


}
