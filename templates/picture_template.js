async function recommendAlbums(pageNum) {
  pageNum = parseInt(pageNum);
  var albums = [];
  var currPage = 1;
  var totalPage = 1;
  return JSON.stringify({
    albums,
    currPage,
    totalPage,
  });
}

async function searchAlbums(pageNum, keyword) {
  pageNum = parseInt(pageNum);
  var albums = [];
  var currPage = 1;
  var totalPage = 1;
  return JSON.stringify({
    albums,
    currPage,
    totalPage,
  });
}

async function pictures(pageNum, album) {
  pageNum = parseInt(pageNum);
  album = JSON.parse(album);
  var pictures = [];
  var currPage = 1;
  var totalPage = 1;
  return JSON.stringify({
    pictures,
    currPage,
    totalPage,
  });
}
