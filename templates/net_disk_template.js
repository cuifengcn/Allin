async function recommendSources(pageNum) {
  pageNum = parseInt(pageNum);
  var sources = [];
  return JSON.stringify({
    sources,
    currPage: 1,
    totalPage: 1,
  });
}

async function searchSources(pageNum, keyword) {
  pageNum = parseInt(pageNum);

  var sources = [];

  return JSON.stringify({
    sources,
    currPage: 1,
    totalPage: 1,
  });
}
