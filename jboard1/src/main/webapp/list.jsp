<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");

	ArticleDAO dao = ArticleDAO.getInstance();
	

	// 전체 글 갯수 조회
		int total =0;
	if(keyword!=null){
		total = dao.selectCountTotalSearch(searchType, keyword);
	}else{
		total = dao.selectCountTotal();
	}
	// 마지막 페이지 번호 계산
	int lastPageNum = 0;
	
	if(total % 10 == 0){
		lastPageNum = (total / 10);		
	}else {
		lastPageNum = (total / 10) + 1;
	}
	
	// 현재 페이지 번호
	int currentPg = 1;
	
	if(pg != null){
		currentPg = Integer.parseInt(pg);
	}
	
	// limit 시작값 계산
	int start = (currentPg - 1) * 10;
	
	// 페이지번호 그룹 계산
	int pageGroupCurrent = (int) Math.ceil(currentPg / 10.0);
	int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
	int pageGroupEnd   = pageGroupCurrent * 10;
	
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	// 페이지 시작번호 계산
	int pageStartNum = total - start;
	
	List<ArticleDTO> articles = null;
	//검색
	if(keyword!=null){
		 articles = dao.selectArticlesForSearch(searchType, keyword, start);	
	}else{
		// 글 조회
		 articles = dao.selectArticles(start);
	}
	//동적 파라미터 지정
	StringBuilder params= new StringBuilder("");
	if(searchType != null){
		params.append("&keyword="+keyword+"&searchType="+searchType);
	}
	if(pg!=null){
			params.append("&pg="+pg);
	}
%>
<%@ include file="./_header.jsp" %>
<script>
 window.onload=function(){
	 //const frmSearch = document.getElementByClassName('search');
	 	// const btnSearch = document.search.submit;
	 
		 //btnSearch.onclick= ()=>{
	 		//alert('검색클릭!');
	 	}
	 	
 }
</script>
<main>
    <section class="list">
        <h3><a href="/jboard1/list.jsp">글목록</a></h3>
        <article>
        <!-- 검색 -->
        <form action="/jboard1/list.jsp" class="search" name="search">
        <select name="searchType">
        	<option value="title">제목</option>
        	<option value="content">내용</option>
        	<option value="title_content">제목+내용</option>
        	<option value="writer">작성자</option>
        	
        </select>
        	<input type="text" name="keyword" placeholder="검색 키워드 입력">
        	<input type="submit"  value="검색">
        </form>
            <table border="0">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
                <% for(ArticleDTO article : articles){ %>
                <tr>
                    <td><%= pageStartNum-- %></td>
                    <td><a href="/jboard1/view.jsp?no=<%= article.getNo()%><%=params.toString() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                    <td><%= article.getNick() %></td>
                    <td><%= article.getRdate().substring(2, 10) %></td>
                    <td><%= article.getHit() %></td>
                </tr>
                <% } %>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
        
        	<% if(pageGroupStart > 1){ %>
            <a href="/jboard1/list.jsp?pg=<%= pageGroupStart - 1 %><%=params.toString() %>" class="prev">이전</a>
            <% } %>
            
            <% for(int n=pageGroupStart ; n<=pageGroupEnd ; n++){ %>
            <a href="/jboard1/list.jsp?pg=<%= n %><%=params.toString() %>" class="num <%= (currentPg == n) ? "current" : "" %>"><%= n %></a>
            <% } %>

			<% if(pageGroupEnd < lastPageNum ){ %>
            <a href="/jboard1/list.jsp?pg=<%= pageGroupEnd + 1 %><%=params.toString() %>" class="next">다음</a>
            <% } %>
            
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="/jboard1/write.jsp" class="btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="./_footer.jsp" %>