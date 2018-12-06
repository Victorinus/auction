<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<style>
    .auction-search-search {
        margin: auto;
        width: 1000px;
    }
	.title {
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		text-align: center;
	}
	.table {
        width: 100%;
		border-top: 2px solid black;
		border-bottom: 1px solid gray;
    }
    tr {
       height: 50px; 
    }
    .text-dt {
        text-align: center;
        width: 100px;
        line-height: 25px;
    }
    .text-nm {
        width: 222px;
        line-height: 25px;
    }
    .search-wrap {
        margin-top: 10px;
        margin-bottom: 10px;
        padding :10px;
        text-align: center;
    }
    .reset-btn {
        height: 30px;
        background-color: burlywood;
        border: 1px solid burlywood;
        color: white;
        cursor: pointer;
    }    
    .search-btn {
        height: 30px;
        background-color: darksalmon;
        border: 1px solid darksalmon;
        color: white;
        cursor: pointer;
    }
    .sort {
        margin-top: 5px;
        margin-bottom: 5px;
        text-align: right;
    }
    .search-list {
        border-bottom: 2px solid black;
        border-bottom: 1px solid gray;
        margin-top: 10px;
        margin-bottom: 10px;
        padding: 0px;
    }
    .search-result {
        border-bottom: 1px solid gray;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .paging {
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: center;
    }
</style>

<script>
    function checkItems(){
        var all = document.querySelector(".all")
        var items = document.querySelectorAll(".item")
        console.log(items)
        for(var i=0;i<items.length;i++){
            items[i].checked = all.checked
        }
    }
    //검색 초기화

</script>

<div class="auction-search-search">
	<div class="title">
		 <h2>검색</h2> 
	</div>
    <form action="search" method="get">
        <table class="table">
            <tr>
                <th width="10%">기간</th>
                <td width="40%">
                    <input type="text" name="date_st" placeholder="20180101" class="text text-dt">
                    ~
                    <input type="text" name="date_fn" placeholder="20181231" class="text text-dt">
                    ※ 연월일 숫자만 입력
                </td>
                <th width="10%">경매</th>
                <td width="40%">
                    <input type="checkbox" name="type" value="offline+online" onclick="checkItems();" class="all" >전체
                    <input type="checkbox" name="type" value="offline" class="item">오프라인
                    <input type="checkbox" name="type" value="online" class="item">온라인
                </td>
            </tr>
            <tr>
                <th>작가/작품명</th>
                <td>
                    <input type="text" name="key" placeholder="작가 또는 작품명을 입력하세요." class="text text-nm">
                </td>
                <th>재질</th>
                <td>
                    <input type="text" name="medium" placeholder="작품재료를 입력하세요." class="text text-nm">
                </td>
            </tr>
        </table>
        <div class="search-wrap">
            <input type="button" value="검색 초기화" class="reset-btn">
            <input type="submit" value="검색" class="search-btn">
        </div>
    </form>
    <div class="sort">
        총 작품
    </div>
    <div class="search-list">
        <div class="search-result">
                
        </div>
    </div>
    <div class="paging">
        [이전]
        1
        2
        3
        4
        [다음]
    </div>
</div>


<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>