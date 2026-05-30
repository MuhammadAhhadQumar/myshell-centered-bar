import Quickshell
import Quickshell.Hyprland
import QtQuick

Row {
    spacing:5
    anchors.centerIn: parent
    Repeater {
        model:10
        Rectangle {
            property int workspaceId: index + 1
                property bool active: Hyprland.focusedWorkspace?.id === workspaceId

                    width: active ? 45 : 35
                    color: active ? Colors.foreground : Colors.color0Light
                    height: 26
                    radius: 15

                    Behavior on width {
                    NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
                }
                Behavior on color {
                ColorAnimation { duration: 200 }
            }

            Text {
                anchors.centerIn: parent
                text: workspaceId
                font.pixelSize: 14
                font.family: "JetBrainsMono Nerd Font Propo"
                color: active ? Colors.background : Colors.foreground
                font.bold: active

                Behavior on color {
                ColorAnimation { duration: 200 }
            }
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: {
                parent.opacity = 0.8
            }
            onExited: {
                parent.opacity = 1
            }
            onClicked: {
                Hyprland.dispatch("workspace " + workspaceId)
            }
        }
    }
}
}