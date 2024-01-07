package chap08.webprocess;

import javax.servlet.http.HttpServletRequest;

public interface WebProcess {
	//Comparable interface를 상속받은 애들은 비교를 할 수 있다 
	//WebProcess를 상속받으면 process가 존재한다
	String process(HttpServletRequest request);
}
