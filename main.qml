import QtQuick 2.0
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 480
    height: width*2.06
    visible: true
    title: "Warzone Roulette"

    header: Text {
        text: "<br><p><u><b>Warzone Roulette</b></u><br>
               <i>Roll</i> &nbsp; for drop-spot</p>"
        horizontalAlignment:  Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 32
        color: Material.foreground        
    }

    footer: TabBar {
        id: tab_bar
        width: parent.width
        currentIndex: swipe_view.currentIndex


        TabButton {
            id: caldera_menu_button
            text: "Caldera"
            hoverEnabled: false

            contentItem: Text {
                text: caldera_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: caldera_menu_button.font
                color: caldera_menu_button.checked ? "yellow" : Material.foreground
            }

            onClicked: {
                swipe_view.setCurrentIndex(0)
            }
        }

        TabButton {
            id: rebirth_menu_button
            text: "Rebirth"
            hoverEnabled: false

            contentItem: Text {
                text: rebirth_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: rebirth_menu_button.font
                color: rebirth_menu_button.checked ? "yellow" : Material.foreground
            }

            onClicked: {
                swipe_view.setCurrentIndex(1)
            }
        }

        TabButton {
            id: caldera_grid_menu_button
            text: "Grid"
            hoverEnabled: false

            contentItem: Text {
                text: caldera_grid_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: caldera_grid_menu_button.font
                color: caldera_grid_menu_button.checked ? "yellow" : Material.foreground
            }

            onClicked: {
                swipe_view.setCurrentIndex(2)
            }
        }
    }

    SwipeView {
        id: swipe_view
        anchors.fill: parent
        currentIndex: tab_bar.currentIndex

        CalderaRouletteView {
            id: caldera_roulette_view
        }

        RebirthRouletteView {
            id: rebirth_roulette_view
        }

        CalderaGridRouletteView {
            id: caldera_grid_roulette_view
        }
    }

}
