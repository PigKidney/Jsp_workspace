package chap10.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// ServletContextListener : 컨텍스트 내부 내용에 변화가 있을 때 리로드시 호출되는 이벤트 리스너
public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		System.out.println("MyListener1-1 : 컨텍스트 내부에 몬가 수정됨");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
		System.out.println("MyListener1-2 : 컨텍스트 디스뜨로이");		
	}

}