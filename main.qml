import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.13
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Sirisha")
    color: "#1A1C1D"  //1A1C1D
    Rectangle{
        id:mainrect
        width : 350
        height: 250
        anchors.centerIn: parent
        border.color: "#ab2724"
        color :"#3D4143"
        Image{
            id:bgimage
            x : 5
            y : 5
            width : 340
            height: 195
            source:  "files/background.jpg"
        }
    }
    Rectangle{
        id:rectplay
        width:30
        height : 30
        x: 300
        y:325
        color : "#3D4143"
        visible:true
        Image{
            id:playimage
            anchors.fill: parent
            source:  "files/play.png"
        }

        MouseArea{
            id: playMouse
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")
                handlePlay();
                console.log("buffer progress on Play is  :  ", playMusic.bufferProgress);
                console.log("duration on Play is  :  ", playMusic.duration);
                console.log("status on play is  :  ", playMusic.status === Audio.Loaded);
                console.log("error state on pause is  :  ",  playMusic.error === Audio.NoError);
                console.log("availability on Play is  :  ", playMusic.availability);  //media player is avilable or not
                console.log("Audio available on play is  :  ", playMusic.hasAudio);
                console.log("Video available on play is  :  ", playMusic.hasVideo);
                console.log("Play back state on play is  :  ", playMusic.playbackState /*=== MediaPlayer.PlayingState*/);
                //                console.log("metadata title is : " , JSON.stringify(playMusic.metaData))
                console.log("meta data is" , playMusic.metaData.albumArtist)
                console.log("meta data name is" , playMusic.metaData.albumTitle)
                console.log("title is",playMusic.metaData.title);
            }
        }
    }

    Rectangle{
        id:rectpause
        width:30
        height : 30
        x: 300
        y:325
        color : "#3D4143"
        visible: false
        Image{
            id:pauseimage
            anchors.fill: parent
            source: "files/pause.png"
        }

        MouseArea{
            id: pauseMouse
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")
                handlePause();
                //                rectpause.visible = false
                //                rectplay.visible = true
                //                playMusic.pause()
                console.log("buffer progress on pause is  :  ", playMusic.bufferProgress);
                console.log("duration on pause is  :  ", playMusic.duration);
                console.log("status on pause is  :  ",  playMusic.status === Audio.Buffered);
                console.log("error state on pause is  :  ",  playMusic.error === Audio.NoError);
                console.log("availability on pause is  :  ", playMusic.availability);
                console.log("Audio available on pause is  :  ", playMusic.hasAudio);
                console.log("Video available on pause is  :  ", playMusic.hasVideo);
                console.log("Play back state on pause is  : ", playMusic.playbackState /*=== MediaPlayer.PausedState*/);
                console.log("meta data is" , playMusic.metaData.size)
                console.log("title is",playMusic.metaData.mediaType );
                //    console.log("title is",audiotitle);
            }
        }
    }

    Rectangle{
        id:mute
        width:20
        height : 20
        x: 460
        y:130
        color : "#1A1C1D"
        visible : true
        Image{
            id:muteimp
            anchors.fill: parent
            source:  "files/speaker.png"
        }

        MouseArea{
            id: mutemouse
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")
                handleMute();

            }
        }
    }

    Rectangle{
        id:unmute
        width:20
        height : 20
        x: 460
        y:130
        color : "#1A1C1D"
        visible:false
        Image{
            id:unmuteimp
            anchors.fill: parent
            source:  "files/mute.png"
        }

        MouseArea{
            id: unmutemouse
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")
                handleUnMute();

            }
        }
    }

    Rectangle{
        id:front
        width:30
        height : 30
        x: 400
        y:325
        color : "#3D4143"
        visible:true
        Image{
            id:frontimg
            anchors.fill: parent
            source:  "files/forward.png"
        }

        MouseArea{
            id: frontmoue
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")

                playMusic.seek(playMusic.position + 1500)

            }
        }
    }
    Rectangle{
        id:back
        width:30
        height : 30
        x: 200
        y:325
        color : "#3D4143"
        visible:true
        Image{
            id:backimg
            anchors.fill: parent
            source:  "files/Rewind.png"
        }

        MouseArea{
            id: backmouse
            anchors.fill: parent
            onClicked: {
                console.log("Mouse are clicked")

                playMusic.seek(playMusic.position - 2000)
            }
        }
    }
    //    Text{
    //        id:audiotext
    //       // text:playMusic.metaData.title + "\n" + playMusic.metaData.albumTitle + "\n" + playMusic.metaData.description
    //        Component.onCompleted: {
    //            //                playMusic.source = Qt.resolvedUrl("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
    //            console.log("================================> ", playMusic.metaData.title);
    //        }
    //    }

    Audio {
        id: playMusic
        // audioRole : Audio.GameRole
        //        playlist: Playlist {
        //            id: playlist
        ////            PlaylistItem { source: "files/audio.flac"; }
        ////            PlaylistItem { source:"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"}
        ////            PlaylistItem { source: "files/audio.mp4";}
        //            //            onItemsChanged:{
        //            //                console.log("start value is", start)
        //            //                console.log("end value is",end)
        //            //            }
        //        }
        source: "files/ElBano.mp3"
        // loops: 2
        volume: 0.3
        // source:"https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
        //        onStatusChanged: {
        //            if(status == Audio.Buffering) {
        //                console.log("=========== ",playMusic.metaData.author)
        //            }
        //        }
        onPlaybackStateChanged: {
            if(playbackState === Audio.StoppedState){
                console.log("resetting the buttons on stopped")
                rectpause.visible = false
                rectplay.visible = true
                control.value = 0
            }
            if(playbackState === Audio.PlayingState){
                console.log("resetting the buttons o playing")
                rectpause.visible = true
                rectplay.visible = false
            }
        }

        //  notifyInterval: 2000
        //        onPlaybackStateChanged: {
        //            console.log("title is",audiotitle);
        //            if(playMusic.playbackState === Audio.PausedState) {
        //                console.log("**********")
        //                console.log(playMusic.metaData.title)
        //            }
        //        }

        //            //  metaData.title: "My Song"
        //            onNotifyIntervalChanged: {
        //                console.log("position is : ", position);
        //                console.log("buffer progress is : ", bufferProgress);
        //                console.log("Playbackstateis : ", playbackstatearray[playbackState]);
        //            }
        //        onMetaDataChanged: {
        //            console.log("metadata in audio is", metaData.albumTitle)
        //        }

        //  metaData.albumArtist: "sirisha"
    }

    function handlePause(){
        rectpause.visible = false
        rectplay.visible = true
        playMusic.pause()
    }

    function handlePlay()
    {
        rectpause.visible = true
        rectplay.visible = false
        playMusic.play();

    }

    function handleMute(){
        playMusic.volume = 0;
        unmute.visible = true;
        mute.visible = false;
    }

    function  handleUnMute(){
        playMusic.volume = 0.7;
        unmute.visible = false;
        mute.visible = true;
    }

    Text{
        id: text
        text :milliSecondsToString((playMusic.duration))
        color : "#ab2724"
        width : 100
        height : 100
        x:430
        y:285
        font.pointSize: 10
        font.bold:true

    }

    Text{
        id: text1
        text :milliSecondsToString((playMusic.position))
        color : "#ab2724"
        width : 100
        height : 100
        x:160
        y:285
        font.pointSize: 10
        font.bold: true
        onTextChanged: {
            control.value = moveSlider(playMusic.position , playMusic.duration)
        }

    }

    function milliSecondsToString(milliseconds)
    {
        milliseconds = milliseconds > 0 ? milliseconds : 0  // ms = 60000   // 3000
        var timeInSeconds = Math.floor(milliseconds/1000);  // tis = 60     // 3
        var minutes = Math.floor(timeInSeconds/60)    // min = 1            //1/20
        var minutesString = minutes<10? "0"+ minutes : minutes  // ms = 01  //
        var seconds = Math.floor(timeInSeconds%60)   // sec = 60% 60 = 0
        var secondsString = seconds < 10 ? "0" + seconds : seconds  // ss = 00
        return minutesString+ ":" + secondsString

    }

    function moveSlider(pos , dur){
        return pos/dur

    }



    Slider {
        id: control
        value: 0
        width : 220
        x:210
        y:280

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: control.availableWidth
            height: implicitHeight
            radius: 2
            color: "#bdbebf"

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                color: "#ab2724"
                radius: 2
            }
        }

        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 18
            implicitHeight: 18
            radius: 9
            color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }
        onMoved: {
            console.log("value is", value)
            var slidervalue = value
            playMusic.seek(slidervalue * playMusic.duration)
            // control.value = (slidervalue * playMusic.duration) - playMusic.duration < 500 ? 0 : slidervalue
            slidervalue!==1 && playMusic.play();

        }

    }


    Timer {
        id:timer
        interval: 2000
        //running: true
    }
}

