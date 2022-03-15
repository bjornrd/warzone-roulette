QT += quick virtualkeyboard

SOURCES += \
        main.cpp

resources.files =\
                qtquickcontrols2.conf \
                main.qml \
                Coordinate.qml \
                MapGrid.qml \
                Map.qml \
                RouletteResultView.qml \
                RouletteView.qml \
                RouletteController.qml

resources.prefix = /$${TARGET}
RESOURCES += resources \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Coordinate.qml \
    Map.qml \
    MapGrid.qml \
    RouletteController.qml \
    RouletteResultView.qml \
    RouletteView.qml \
    qtquickcontrols2.conf
