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

### HTTP요청 데이터
- GET - 쿼리 파라미터
- POST - HTML Form
  - content-type : application/x-www-form-urlencoded
  - 메시지 바디에 쿼리 파라미터 형식으로 전달
- HTTP message body
  - HTTP API에서 주로 사용 : JSON, XML, TEXT
- 데이터 형식은 주로 JSON사용
  - POST, PUT, PATCH

### PrintWriter와 템플릿 엔진
HttpServletResponse에서 응답으로 사용 가능한 `PrintWriter`에 모든 HTML을 넣어서 응답하기에는 너무 불편하고 가독성이 떨어진다
그렇기때문에 우리가 사용하는 기존 HTML에서 자바 코드를 넣을 수 있는 템플릿 엔진이 등장하게 되었다
템플릿 엔진을 사용하게되면 HTML문서에서 필요한 곳에만 코드를 넣을 수 있기때문에 동적으로 HTML을 관리할 수 있고 가독성도 좋아지게 된다.
- JSP
  - 가장 많이 사용했던 템플릿 엔진. 현재는 성능도 다른 템플릿 엔진에 비해 낮고, JAR가 아닌 WAR사용한다는 점에서 점점 사용하지 않게 되고있다
- Thymeleaf
  - 현재 가장 많이 사용하는 템플릿 엔진. 좋은 가독성과 성능을 가지고있다
- Mustache
  - Thymeleaf보다 더 경량화된 템플릿 엔진


### 서블릿과 JSP의 한계
서블릿으로 개발할때는 View화면을 위한 HTML을 만드는 작업이 자바 코드에 섞여있기때문에 코드의 가독성이 떨어지고 복잡해졌다
그리고 JSP를 사용한 덕분에 HTML은 깔끔하게 가져가면서 중간중간 동적으로 변경이 필요한 부분에만 자바 코드를 적용했다

하지만 JSP는 View화면만 보여주는것이 아닌 비즈니스 로직까지 포함되어있고 JSP가 너무 많은 역할을 감당하고있다.
이렇게 되면 큰 프로젝트에서 JSP를 사용하게 되면 유지보수가 너무 까다로워진다

### MVC의 등장
이로인해 비즈니스 로직은 서블릿처럼 다른곳에서 처리하고 JSP는 목적에 맞게 HTML로 화면(View)을 그리는 일에 집중하도록 하는 MVC패턴이 등장했다

### MVC패턴의 한계
MVC패턴을 적용한 덕분에 컨트롤러의 역할과 뷰를 렌더링 하는 역할을 명확하게 구분할 수 있다.
그런데 컨트롤러에는 중복된 코드가 많고, 필요하지 않는 코드들도 많이 보인다.
- foward 중복 : View로 이동하는 코드가 항상 중복 호출되어야 한다.
- viewPath 중복
- 사용하지 않는 코드 : 현재 코드에서는 response는 사용하지 않지만 코드에 들어가있다

정리하면, 공통처리가 어렵다. 이 문제를 해결하려면 컨트롤러 호출 전에 먼저 공통 기능을 도입해야한다.
이러한 기능은 프론트 컨트롤런(Front Controller)패턴을 도입하면 이런 문제를 해결할 수 있i다.