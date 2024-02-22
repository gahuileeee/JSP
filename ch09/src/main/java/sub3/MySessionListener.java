package sub3;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener //리스너는 주소 매핑 없음
public class MySessionListener implements HttpSessionAttributeListener {
	int count =0;
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		// 세션에 추가(setAttribute)될 때 호출되는 method
		count++;
		
		System.out.println("현재 로그인 총 사용자 : "+count);
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// 세선이 삭제 (invalidate)될 때호출되는 method
		count--;
		
		System.out.println("현재 로그인 총 사용자 : "+count);
	}
	
	
}
