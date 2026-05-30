import Quickshell
import QtQuick


Rectangle {
    anchors.left:parent.left; anchors.verticalCenter:parent.verticalCenter; anchors.leftMargin: 5
    color:'transparent'
    radius:15
    implicitHeight:time.implicitHeight + 10
    implicitWidth: time.implicitWidth +20
    Text {
        anchors.centerIn:parent
        id:time
        text: Time.time
        color:Colors.foreground
        font.family:"JetBrainsMono Nerd Font Propo"
        font.pixelSize:14
    }
}