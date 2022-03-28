import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 480
    height: width*2.06
    visible: true
    title: "Warzone Roulette"



    header: Button {
        id: about_button
        text: "About"
        anchors.right: parent.right
        anchors.rightMargin: 20
        width: 60
        topPadding: 20
        checkable: true
        checked: drawer.visible


        contentItem: Text {
            id: text_item
            text: about_button.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: about_button.checked || about_button.down ? Qt.darker(Material.accent) : Material.accent
            font.pointSize: 16
            font.family: "Roboto"

        }

        background: Rectangle {
            color: Material.background
        }

        onClicked: {
           drawer.force_open = true
           drawer.open()
       }
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

            background: Rectangle { // Ignore default ripple effect
                color: Material.background
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

            background: Rectangle { // Ignore default ripple effect
                color: Material.background
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

            background: Rectangle { // Ignore default ripple effect
                color: Material.background
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
        interactive: swipe_view.currentIndex === 0 || force_open ? true : false
        dragMargin: 40

        property bool force_open: false

        Rectangle {
            anchors.fill: parent
            color: Qt.lighter(Material.primary, 3)

            Text {
                text: " <font color=\'#e3bf15\'><b>Written by:</b></font> <br>
                        Yup <br>
                        <br>
                        <font color=\'#e3bf15\'><b>For:</b></font> <br>
                        <i>Dataspill Bonansa</i><br>
                        <br>
                        <br>
                        <a href=\"https://github.com/bjornrd/warzone-roulette.git\"><b>Github repository</b></a> <br>
                        <br>
                        <br>
                        Developed using Qt Creator <br>
                        And Qt " + qtversion + " <br>
                        (Clang 12.0 (Apple), 64 bit) <br>
                        From revision: <a href=\"https://code.qt.io/cgit/qt-creator/qt-creator.git/log/?id=f884ff2160ed5b3c44663d70e1c6915aff4b8ac0\"> f884ff2160 </a>
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

        onClosed: force_open = false


        Overlay.modal: Rectangle {
            color: "#aa030303"
        }
    }
}
