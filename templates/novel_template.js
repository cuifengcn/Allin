async function recommendNovels(pageNum) {
  pageNum = parseInt(pageNum);
  var novels = [];
  return JSON.stringify({
    novels,
    currPage: 1,
    totalPage: 1,
  });
}

async function searchNovels(pageNum, keyword) {
  pageNum = parseInt(pageNum);
  var novels = [];
  return JSON.stringify({
    novels: novels,
    currPage: 1,
    totalPage: 1,
  });
}

async function novelDetail(novel) {
  novel = JSON.parse(novel);
  var chapters = [];
  return JSON.stringify({
    chapters,
    introduce: "",
    author: "",
    size: "",
  });
}

async function novelContent(novel, chapter) {
  novel = JSON.parse(novel);
  chapter = JSON.parse(chapter);
  return "";
}
