package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterB implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("FilterB dofilter()...");
		
		//인코딩 처리
		request.setCharacterEncoding("utf-8"); //항상 귀찮게 했던 인코딩 처리를 이쪽으로 빼버림
		
		//다음 필터로 요청
		chain.doFilter(request, response);
	}
	
}
