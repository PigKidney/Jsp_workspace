package chap10.service;

import javax.servlet.http.HttpServletRequest;

public class FilterIndexService implements Service {

   // 싱글톤 디자인 패턴
   private static FilterIndexService instance = new FilterIndexService();

   public static FilterIndexService getInstance() {
      return instance;
   }
   
   //외부에서 이 클래스를 무단으로 생성하는 것을 방지하기 위함
   private FilterIndexService() {}
   
   @Override
   public String service(HttpServletRequest request) {
      // TODO Auto-generated method stub
      return "/WEB-INF/views/filter/index.jsp";
   }
}