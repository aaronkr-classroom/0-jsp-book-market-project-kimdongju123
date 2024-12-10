<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판 목록</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>

    <h1 style="text-align: center;">게시판 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.num}</td>
                    <td>
                        <a href="BoardDetailAction.do?num=${board.num}">
                            ${board.subject}
                        </a>
                    </td>
                    <td>${board.name}</td>
                    <td>${board.regist_day}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div style="text-align: center; margin-top: 20px;">
        <a href="BoardWriteForm.do">글쓰기</a>
    </div>
</body>
</html>
