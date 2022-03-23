QT += quick

SOURCES += \
        main.cpp

resources.files =\
                qtquickcontrols2.conf \
                main.qml \
                Coordinate.qml \
                MapGrid.qml \
                Map.qml \
                CalderaGridRouletteResultView.qml \
                CalderaGridRouletteView.qml \
                CalderaGridRouletteController.qml \
                CalderaZones.qml \
                CalderaRouletteResultView.qml \
                CalderaRouletteController.qml \
                CalderaRouletteView.qml \
                RebirthZones.qml \
                RebirthRouletteResultView.qml \
                RebirthRouletteController.qml \
                RebirthRouletteView.qml \
                RollButton.qml \
                RouletteBehaviour.qml \
                GridMapSelector.qml

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
    CalderaGridRouletteController.qml \
    CalderaGridRouletteResultView.qml \
    CalderaGridRouletteView.qml \
    CalderaRouletteController.qml \
    CalderaRouletteResultView.qml \
    CalderaRouletteView.qml \
    CalderaZones.qml \
    Coordinate.qml \
    GridMapSelector.qml \
    Map.qml \
    MapGrid.qml \
    RebirthRouletteController.qml \
    RebirthRouletteResultView.qml \
    RebirthRouletteView.qml \
    RebirthZones.qml \
    RollButton.qml \
    RouletteBehaviour.qml \
    qtquickcontrols2.conf
