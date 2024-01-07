package chap10.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class RequestListener implements ServletRequestListener{

	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		System.out.println("RequestListener : 시작");
	}
	
	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		System.out.println("RequestListener : 끝");
		
	}
}