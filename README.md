# 김영한 스프링 mvc 1편 servlet에 관한 프로젝트

### 프로젝트 패키지를 war로 한 이유
- JSP를 사용하기 위해서

### HttpServletRequest
- HTTP 요청 메시지를 개발자가 직접 파싱해서 사용해도 되지만 매우 불편하다. 
서블릿은 개발자가 HTTP요청 메시지를 편리하게 사용할 수 있도록 개발자 대신에 HTTP 요청 메시지를 파싱한다.
그리고 그 결과를 `HttpServletRequest`객체에 담아서 사용한다

```
POST /save HTTP/1.1
Host: localhost:8080
Content-Type: application/x-www-formurlencoded

username=park&age=20
```

- 임시 저장소 기능 : 해당 HTTP 요청이 시작부터 끝날 때 까지 유지되는 임시 저장소 기능
  - 저장 : `request.setAttribute(name, value)`
  - 조회 : `request.getAttribute(name)`
- 세션 관리 기능
  - `request.getSession(create:true)`
- HttpServletRequest, HttpServletResponse를 사용할 때 가장 중요한 점은 이 객체들이 HTTP요청 메시지 HTTP응답 메시지를 편리하게 사용하도록 도와주는 객체라는 점이다.
따라서 이 기능에 대해서 깊이있는 이해를 하려면 HTTP스펙이 제공하는 요청, 응답 메시지 자체를 이해해야한다