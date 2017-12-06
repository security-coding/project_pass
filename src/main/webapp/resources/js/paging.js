// 페이징 객체
var paging = {
    // default value
    p: {
        index: 0,
        pageStartNum: 1
    },
    
    // paging create
    create: function () {
        var htmlTag = '';
        for (var i = paging.p.pageStartNum; i <= paging.p.pageLastNum; i++) {
            htmlTag += '<li class="pageIndex"><span>' + i + '</span></li>';
        }
        $('.index').html(htmlTag);

        // current index ui
        $('.pageIndex').each(function () {
            if (paging.p.index == $(this).text() - 1) {
                $(this).addClass('active');
            } else {
                $(this).removeClass('active');
            }
        });

        // previous page button
        if (paging.p.pageStartNum != 1) {
            $('.preBtn').html('<li id="pagePreFirst"><span>«</span></li><li id="pagePre"><span>‹</span></li>');
            // First page index
            $('#pagePreFirst').click(function () {
                var index = paging.p.pageCnt + 1;
                var pageCnt = paging.p.pageCnt;
                if (0 < index - pageCnt) {
                    index -= pageCnt;
                    paging.p.pageStartNum = index;
                    paging.p.index = index - 1;
                    paging.ajax();
                }

            });

            // previous page index
            $("#pagePre").click(function () {
                var index = paging.p.pageStartNum;
                var pageCnt = paging.p.pageCnt;
                if (0 < index - pageCnt) {
                    index -= pageCnt;
                    paging.p.pageStartNum = index;
                    paging.p.index = index - 1;
                    paging.ajax();
                }
            });
        } else $('.preBtn').children('li').remove();

        // index list
        $('.pageIndex').click(function () {
            var index = Number($(this).find('span').text());
            paging.p.index = index - 1;
            paging.ajax();
        });

        // Next page button
        if (paging.p.lastChk) {
            $('.nextBtn').html('<li id="pageNext"><span>›</span></li><li id="pageLast"><span>»</span></li>');
            // next page index
            $('#pageNext').click(function () {
                var index = paging.p.pageStartNum;
                var total = paging.p.total;
                var listCnt = paging.p.listCnt;
                var pageCnt = paging.p.pageCnt;

                var totalPageCnt = Math.ceil(total / listCnt);
                var max = Math.ceil(totalPageCnt / pageCnt);
                if (max * pageCnt > index + pageCnt) {
                    index += pageCnt;
                    paging.p.pageStartNum = index;
                    paging.p.index = index - 1;
                    paging.ajax();
                }
            });
            // last page index
            $('#pageLast').click(function () {
                var index = paging.p.pageStartNum;
                var total = paging.p.total;
                var listCnt = paging.p.listCnt;
                var pageCnt = paging.p.pageCnt;

                var totalPageCnt = Math.ceil(total / listCnt);
                var max = Math.ceil(totalPageCnt / pageCnt);
                while (max * pageCnt > index + pageCnt) {
                    index += pageCnt;
                }
                var remainListCnt = total - listCnt * (index - 1);
                var remainPageCnt = Math.floor(remainListCnt / listCnt);
                if (remainListCnt % listCnt != 0) {
                    remainPageCnt++;
                }
                var pageLastNum = 0;
                if (remainListCnt <= listCnt) {
                    pageLastNum = index;
                } else if (remainPageCnt <= pageCnt) {
                    pageLastNum = remainPageCnt + index - 1;
                } else {
                    pageLastNum = pageCnt + index - 1;
                }
                paging.p.pageStartNum = index;
                paging.p.index = index - 1;
                paging.ajax();
            });
        } else {
            $('.nextBtn').children('li').remove();
        }
    },
    remove: function () {
        $('.preBtn').children('li').remove();
        $('.index').html('1');
        $('.nextBtn').children('li').remove();
    }
}