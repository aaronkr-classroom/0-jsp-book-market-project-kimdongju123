package mvc.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

        if (command.equals("/BoardListAction.do")) { // 게시물 목록 보기
            requestBoardList(request);
            RequestDispatcher rd = request.getRequestDispatcher("./Board/list.jsp");
            rd.forward(request, response);

        } else if (command.equals("/BoardWriteForm.do")) { // 게시물 작성 폼 이동
            RequestDispatcher rd = request.getRequestDispatcher("./Board/writeForm.jsp");
            rd.forward(request, response);

        } else if (command.equals("/BoardWriteAction.do")) { // 새 게시물 등록
            requestBoardWrite(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);

        } else if (command.equals("/BoardView.do")) { // 게시물 보기
            RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
            rd.forward(request, response);

        } else if (command.equals("/BoardUpdateAction.do")) { // 게시물 수정
            requestBoardUpdate(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);

        } else if (command.equals("/BoardDeleteAction.do")) { // 게시물 삭제
            requestBoardDelete(request);
            RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
            rd.forward(request, response);
        }
    }

    // 게시물 목록 가져오기
    public void requestBoardList(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        request.setAttribute("boardList", dao.getBoardList(0, 0, null, null));
    }

    // 새 게시물 등록
    public void requestBoardWrite(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO board = new BoardDTO();

        // 폼 데이터 받아오기
        board.setId(request.getParameter("id"));
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setIp(request.getRemoteAddr());

        // 데이터베이스에 새 게시물 등록
        dao.insertBoard(board);
    }

    // 선택된 게시물 수정
    public void requestBoardUpdate(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        BoardDTO board = new BoardDTO();

        // 수정할 데이터 받아오기
        board.setNum(Integer.parseInt(request.getParameter("num"))); // 게시물 번호
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        // 데이터베이스에서 게시물 수정
        dao.updateBoard(board);
    }

    // 선택된 게시물 삭제
    public void requestBoardDelete(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();

        // 삭제할 게시물 번호 받아오기
        int num = Integer.parseInt(request.getParameter("num"));

        // 데이터베이스에서 게시물 삭제
        dao.deleteBoard(num);
    }
}
