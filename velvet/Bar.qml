import Quickshell
import QtQuick


Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            required property var modelData
            screen: modelData
            anchors {
                top:true
                left:true
                right:true
            }
            implicitHeight:43
            color:"transparent"
            Rectangle {
                anchors.fill:parent
                color:"transparent"
                anchors.topMargin:10
                // border.color:Colors.color0Light
                // border.width:1
                radius: 15
                Clock {}
                Workspaces { }
            }
        }
    }
}
