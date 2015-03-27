// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  console.log("Hello!");
  var videoIdJSONStr;
  $.get("/api/dj", null, function(data) {
    videoIdJSONStr = data;
    console.log(videoIdJSONStr);
    player = new YT.Player('player', {
      height: '390',
      width: '640',
      videoId: videoIdJSONStr,
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  });

}

function playNext() {
  player.clearVideo();
  var videoIdJSONStr;
  $.get("/api/dj", null, function(data) {
    videoIdJSONStr = data;
    console.log(videoIdJSONStr);
    player.loadVideoById(videoIdJSONStr);
    player.playVideo();
  });
}


// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.playVideo();
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
//var done = false;

//var state = ytplayer.getPlayerState();
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.ENDED) {
    playNext();
    //stopVideo();
    ////    done = true;
  }
  //videoUrl = player.getVideoUrl();
  //videoUrlArray = videoUrl.split("=");
  //videoId = videoUrlArray[1]


  //  $.post("/api/deletesong", 
  //      {'videoId': videoId}, 
  //      function (data) {
  //        player.playNext();
  //      }
  //      );

}
function stopVideo() {
  player.stopVideo();
}