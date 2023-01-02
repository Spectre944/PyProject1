import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11


Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Translator")

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

        ColumnLayout {
            id: buttonContainer
            anchors.fill: leftMenuFrame
            spacing: 2


            Button {
                id: setPage1
                width: leftMenuFrame.width
                height: 50
                text: qsTr("Page 1")
                onClicked: appView.setCurrentIndex(0)

            }

            Button {
                id: setPage2

                width: leftMenuFrame.width
                height: 50
                text: qsTr("Page 2")
                onClicked: appView.setCurrentIndex(1)
            }


        }
    }
    Rectangle{
        id: appContainer
        anchors.left: leftMenuFrame.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        color: "#cccccc"

        SwipeView {
                id: appView

                anchors.fill: parent
                clip: true
                anchors.leftMargin: 0

                Item {
                    id: item1

                    TextField {
                        id: textFieldInput
                        x: 128
                        y: 50
                        placeholderText: qsTr("Word")
                    }

                    Button {
                        id: buttonAddWord
                        x: 22
                        y: 50
                        text: qsTr("Add world")
                        onClicked: {
                            //signal to Py
                            backend.getWord(textFieldInput.text)
                        }
                    }

                    Text {
                        id: textProcessed
                        x: 368
                        y: 63
                        width: 56
                        height: 14
                        text: qsTr("-")
                        font.pixelSize: 12
                    }

                    TableView {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: buttonAddWord.bottom
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0

                        columnSpacing: 1
                        rowSpacing: 1
                        clip: true



                        delegate: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 50
                            Text {
                                text: display
                            }
                        }
                    }
                }

                Item {
                    Text {
                        text: qsTr("Bye")
                    }
                }
        }

        PageIndicator {
            id: indicator
            y: 413
            width: 48
            height: 37
            anchors.left: appView.horizontalCenter
            anchors.bottom: parent.bottom


            count: appView.count
            currentIndex: appView.currentIndex

        }

    }



    Connections{
        target: backend

        //Recive signal from Py signal is - wordProcessed
        function onWordProcessed(stringText){
            textProcessed.text = stringText
        }
    }



}
