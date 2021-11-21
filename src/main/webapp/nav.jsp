<!-- 이성규 : 권한별 항목 유무 코드 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/magnific-popup.css" />
<link rel="stylesheet" href="css/templatemo-style.css" />
<title>Insert title here</title>
</head>
<body>
	<%
	int check = (int)session.getAttribute("u_level");

	if (check == 0) {
	%>
	<nav class="tm-nav">
		<ul>
			<li><a href="newBoard?type=usercheck"><span
					class="tm-nav-deco"></span>Login</a></li>
			<li><a href="newBoard?type=join"><span class="tm-nav-deco"></span>Join</a>
			</li>
			<li><a href="newBoard?type=list"><span class="tm-nav-deco"></span>Board</a>
			</li>

		</ul>
	</nav>
	<%
	} else {
	%>
	<nav class="tm-nav">
		<ul>
			<li><a href="newBoard?type=logout"><span class="tm-nav-deco"></span>Logout</a>
			</li>
			<li><a href="newBoard?type=list"><span class="tm-nav-deco"></span>Board</a>
			</li>
			<li><a href="newBoard?type=writeForm"><span
					class="tm-nav-deco"></span>Write</a></li>

		</ul>
	</nav>
	<%
	}
	%>
</body>
</html>























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/magnific-popup.css" />
<link rel="stylesheet" href="css/templatemo-style.css" />
<title>Insert title here</title>
</head>
<body>
<nav class="tm-nav">
        <ul>
          <li>
            <a href="newBoard?type=usercheck"><span class="tm-nav-deco"></span>Login</a>
          </li>
          <li>
            <a href="newBoard?type=list"><span class="tm-nav-deco"></span>Logout</a>
          </li>
          <li>
            <a href="newBoard?type=join"><span class="tm-nav-deco"></span>Join</a>
          </li>
          <li>
            <a href="newBoard?type=list"><span class="tm-nav-deco"></span>Board</a>
          </li>
          <li>
            <a href="newBoard?type=writeForm"><span class="tm-nav-deco"></span>Write</a>
          </li>

        </ul>
</nav>
</body>
</html> --%>