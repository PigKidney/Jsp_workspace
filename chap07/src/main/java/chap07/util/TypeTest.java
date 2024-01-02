package chap07.util;

import chap07.dto.BreadDTO;

public class TypeTest {
	static void method1(BreadDTO bread) {
		bread.setBread_name("초고소라빵");
		bread.setBread_price(2200);
	}
	
	static void method2(int a) {
		a += 10;
	}
	
	
	public static void main(String[] args) {
		// 참조형 변수의 경우 해당 인스턴스의 주소를 넘기기 때문에
		// 메서드에 가서 변화가 생길시 원본 인스턴스에 변화가 생기는 것과 같다 
		BreadDTO bread = new BreadDTO();
		
		method1(bread);
		
		System.out.println("빵 이름 : "+bread.getBread_name());
		System.out.println("빵 가격 : "+bread.getBread_price());
		// 기본형 변수의 경우 변수에 저장되어있는 값을 넘기기 때문에
		// 메서드에 가서 변화가 생겨도 메서드의 지역변수의 값이 변할 뿐이다
		// 일반적인 참조형 변수에는 참조형 변수의 규칙이 통용되지만
		/// Wrapper 클래스나 String 클래스에는 적용되지 않는다
		int num = 10;
		
		method2(num);
		
		System.out.println("숫자: "+ num);
	}
}
