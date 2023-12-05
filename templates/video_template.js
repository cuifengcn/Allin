async function recommendVideos(pageNum) {
  pageNum = parseInt(pageNum);
  var videos = [];
  return JSON.stringify({
    videos,
    currPage: 1,
    totalPage: 1,
  });
}

async function searchVideos(pageNum, keyword) {
  pageNum = parseInt(pageNum);
  var videos = [];
  return JSON.stringify({
    videos,
    currPage: 1,
    totalPage: 1,
  });
}

async function videoDetail(video) {
  video = JSON.parse(video);
  var seasons = [];
  return JSON.stringify({
    seasons,
    latestUpdate: "",
    introduce: "",
  });
}

async function seasonDetail(video, videoDetail, season) {
  video = JSON.parse(video);
  videoDetail = JSON.parse(videoDetail);
  season = JSON.parse(season);
  var episodes = [];
  return JSON.stringify({
    seasonName: "",
    seasonUrl: "",
    episodes,
  });
}
