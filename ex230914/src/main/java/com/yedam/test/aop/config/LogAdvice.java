package com.yedam.test.aop.config;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAdvice {
	//포인트컷 : 조인포인트(비즈니스 로직과 관련된 메소드) 중에서 Advice(공통 로직)가 적용될 메소드
	//@Pointcut("execution(* *..*ServiceImpl.*(..))")
	@Pointcut("within(*..*ServiceImpl)")
	public void allPointCut() {}
	
	//Weaving: 포인트컷 + Advice + 동작시점
	@Around("allPointCut()")
	private Object logger(ProceedingJoinPoint joinpoint) throws Throwable {
		// AOP가 적용되는 메서드의 이름
		String signatuerStr = joinpoint.getSignature().toString();
		System.out.println("시작: " + signatuerStr);
		
		// 비즈니스 메소드 실행 전 Advice 실행
		System.out.println("핵심 기능 전 실행 - 공통기능 : " +System.currentTimeMillis());
		try {
			Object obj = joinpoint.proceed(); // 실제 비즈니스 메소드 실행 코드
			return obj;
		}finally {
			// 비즈니스 메소드 실행 후 Advice 실행
			System.out.println("핵심 기능 후 실행 - 공통기능 : " +System.currentTimeMillis());
		}
	}
}
