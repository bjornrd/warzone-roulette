import QtQuick 2.0
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 480
    height: width*2.06
    visible: true
    title: "Warzone Roulette"

    header: Text {
        text: "Warzone Roulette\n Roll for drop-spot"
        horizontalAlignment:  Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 32
        color: Material.foreground
    }

    footer: TabBar {
        width: parent.width

        TabButton {
            id: caldera_grid_menu_button
            text: "Grid"

            onClicked: {
                stack.clear()
                stack.push(caldera_grid_roulette_view)
            }
        }

        TabButton {
            id: caldera_menu_button
            text: "Caldera"

            onClicked: {
                stack.clear()
                stack.push(caldera_roulette_view)
            }
        }

        TabButton {
            id: rebirth_menu_button
            text: "Rebirth"

            onClicked: {
                stack.clear()
                stack.push(rebirth_roulette_view)
            }
        }
    }


    StackView {
        id: stack
        anchors.fill: parent
    }

    CalderaGridRouletteView {
        id: caldera_grid_roulette_view
        visible: false
    }

    CalderaRouletteView {
        id: caldera_roulette_view
        visible: false
    }

    RebirthRouletteView {
        id: rebirth_roulette_view
        visible: false
    }

    Component.onCompleted: {
        stack.push(caldera_grid_roulette_view)
    }
}
