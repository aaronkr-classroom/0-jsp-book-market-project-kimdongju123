<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">새 게시글 작성</h1>
    <form action="BoardWriteAction.do" method="post">
        <label for="id">작성자 ID</label>
        <input type="text" id="id" name="id" required placeholder="작성자 ID를 입력하세요.">

        <label for="name">작성자 이름</label>
        <input type="text" id="name" name="name" required placeholder="작성자 이름을 입력하세요.">

        <label for="subject">제목</label>
        <input type="text" id="subject" name="subject" required placeholder="게시글 제목을 입력하세요.">

        <label for="content">내용</label>
        <textarea id="content" name="content" rows="10" required placeholder="게시글 내용을 입력하세요."></textarea>

        <div style="text-align: center;">
            <button type="submit">게시글 등록</button>
        </div>
    </form>
</body>
</html>
