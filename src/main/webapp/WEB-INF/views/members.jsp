<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<a href="/index.html">메인</a>
<table>
  <thead>
  <th>id</th>
  <th>username</th>
  <th>age</th>
  </thead>
  <tbody>
  <tr>
    <td>${member.id}</td>
    <td>${member.username}</td>
    <td>${member.age}</td>
  </tr>
  </tbody>
</table>
</body>
</html>