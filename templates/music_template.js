async function recommendPlaylists(pageNum) {
  pageNum = parseInt(pageNum);
  var playlists = [];
  return JSON.stringify({ playlists, currPage: 1, totalPage: 1 });
}

async function recommendMusics(pageNum) {
  pageNum = parseInt(pageNum);
  var musics = [];
  return JSON.stringify({ musics, currPage: 1, totalPage: 1 });
}

async function searchPlaylists(pageNum, keyword) {
  pageNum = parseInt(pageNum);
  var playlists = [];
  return JSON.stringify({ playlists, currPage: 1, totalPage: 1 });
}

async function searchMusics(pageNum, keyword) {
  pageNum = parseInt(pageNum);
  var musics = [];
  return JSON.stringify({ musics, currPage: 1, totalPage: 1 });
}

async function playlistMusics(pageNum, playlist) {
  pageNum = parseInt(pageNum);
  playlist = JSON.parse(playlist);
  var musics = [];
  return JSON.stringify({ musics, currPage: 1, totalPage: 1 });
}

async function musicUrl(music, quality) {
  music = JSON.parse(music);
  return "";
}

async function musicLyric(music) {
  music = JSON.parse(music);
  return "";
}

async function musicComments(pageNum, music) {
  pageNum = parseInt(pageNum);
  music = JSON.parse(music);
  var comments = [];
  return JSON.stringify({ comments, currPage: 1, totalPage: 1 });
}
