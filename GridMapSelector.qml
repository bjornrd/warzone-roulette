import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Shapes 1.15

Item {
    id: root

    property int y_start: 0
    property int y_end: 0
    property int section_height: y_end - y_start
    property int section_width: 100

    property alias shape_fill_color: shape_path.fillColor
    property alias shape_stroke_color: shape_path.strokeColor

    Shape {
        id: shape

        property alias button_section_start_y: tl.y
        property alias button_section_end_y: ml.y

        ShapePath {
            id: shape_path
            startX: root.width
            startY: root.y_start

            PathLine {
                id: tl
                x: root.width - root.section_width/2
                y: root.y_start + 50
            }
            PathLine {
                id: ml
                x: tl.x
                y: tl.y + section_height
            }
            PathLine {
                id: bl
                x: ml.x + root.section_width/2
                y: ml.y + 50
            }


        }
    }

//    Button {
//        id: caldera_button
//    }

//    Button {
//        id: rebirth_button
//    }



}
