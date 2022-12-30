import QtQuick
import QtQuick.Window
import QtQuick.Controls 6.3

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Button {
        id: userButton
        x: 139
        y: 17
        width: 114
        height: 41
        text: qsTr("Button")
    }

    Rectangle {
        id: leftMenuFrame
        width: 120
        color: "#505050"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }
}
