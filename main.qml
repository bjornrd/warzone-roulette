import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 480
    height: width*2.06
    visible: true
    title: "Warzone Roulette"

    header: Text {
        text: " <br>
                <font color=\'#afb3b3\'><u><b> Warzone Roulette </b></u></font>
              "
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
            font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase

            contentItem: Text {
                text: caldera_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: caldera_menu_button.font
                color: caldera_menu_button.checked ? Material.accent : Material.foreground
            }

            onClicked: {
                swipe_view.setCurrentIndex(0)
            }
        }

        TabButton {
            id: rebirth_menu_button
            text: "Rebirth"
            hoverEnabled: false
            font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase

            contentItem: Text {
                text: rebirth_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: rebirth_menu_button.font
                color: rebirth_menu_button.checked ? Material.accent : Material.foreground
            }

            onClicked: {
                swipe_view.setCurrentIndex(1)
            }
        }

        TabButton {
            id: caldera_grid_menu_button
            text: "Grid"
            hoverEnabled: false
            font.capitalization: Qt.platform.os === "ios" ? Font.Capitalize : Font.AllUppercase

            contentItem: Text {
                text: caldera_grid_menu_button.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font: caldera_grid_menu_button.font
                color: caldera_grid_menu_button.checked ? Material.accent : Material.foreground
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

    Drawer {
        id: drawer
        width: 0.67 * window.width
        height: window.height
        interactive: swipe_view.currentIndex === 0 ? true : false
        dragMargin: 40

        Rectangle {
            anchors.fill: parent
            color: Qt.lighter(Material.primary, 3)

            Text {
                text: " <font color=\'#e3bf15\'><b>Written by:</b></font> <br>
                        Bjørn Rudi Dahl <br>
                        bjorn.rudi.dahl@outlook.com <br>
                        <br>
                        <font color=\'#e3bf15\'><b>For:</b></font> <br>
                        Dataspill Bonanza - 2022<br>
                        <br>
                        <br>
                        <a href=\"https://github.com/bjornrd/warzone-roulette.git\"><b>Github repository</b></a>
                        "
                font.pointSize: 16
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.topMargin: 40
                horizontalAlignment:  Text.AlignLeft
                verticalAlignment: Text.AlignTop
                color: Material.foreground

                onLinkActivated: link => Qt.openUrlExternally(link)
            }
        }



        Overlay.modal: Rectangle {
            color: "#aa030303"
        }
    }
}
