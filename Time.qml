pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick


Singleton {
    id:root
    property string time: ''
        Process {
            id:timeProc
            command: ["date", "+%I:%M %P"]
            running: true
            stdout:StdioCollector {
                onStreamFinished: {
                    var parts = this.text.trim().split(' ')
                    root.time =parts[0]+ ' '+ parts[1]
                }
            }
        }
        Timer {
            interval:60000
            running:true
            repeat:true
            onTriggered: {
                timeproc.running = true
            }
        }

    }