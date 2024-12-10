<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 보기</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        td {
            text-align: left;
        }
        a {
            text-decoration: none;
            color: blue;
        }
        .btn {
            display: block;
            width: 100px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f2f2f2;
            text-decoration: none;
            color: black;
        }
        .btn:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">게시물 상세보기</h1>
    <table>
        <tr>
            <th>번호</th>
            <td>${board.num}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.name} (${board.id})</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.subject}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.content}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${board.regist_day}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.hit}</td>
        </tr>
        <tr>
            <th>IP 주소</th>
            <td>${board.ip}</td>
        </tr>
    </table>
    <a href="BoardListAction.do" class="btn">목록으로</a>
</body>
</html>
