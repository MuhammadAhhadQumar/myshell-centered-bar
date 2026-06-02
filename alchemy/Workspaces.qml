import Quickshell
import Quickshell.Hyprland
import QtQuick
Rectangle {
    anchors.centerIn: parent
    // anchors.leftMargin: 10
    width:row.width + 25
    height: row.height + 8
    radius: 20
    // border.color: Colors.color0Light
    // border.width: 1
    color: Colors.background
    Row {
        id:row
        spacing:5
        anchors.centerIn: parent
        Repeater {
            model:10
            Rectangle {
                property int workspaceId: index + 1
                    property var ws: Hyprland.workspaces.values.find(w => w.id === workspaceId)
                    property bool hasWindows: ws !== undefined
                        property bool active: Hyprland.focusedWorkspace?.id === workspaceId
                            width: active ? 35 : 20
                            color: active ? Colors.foreground:"transparent"
                            height: 20
                            radius: 20
                            Behavior on width {
                            NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
                        }
                        Behavior on color {
                        ColorAnimation { duration: 200 }
                    }

                    Text {
                        anchors.centerIn: parent
                        text:active ? "" :hasWindows ?"" : ''
                        font.pixelSize: 12
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
}
