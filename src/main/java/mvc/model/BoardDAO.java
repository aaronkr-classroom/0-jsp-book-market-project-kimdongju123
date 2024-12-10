package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBconnection;

public class BoardDAO {
    private static BoardDAO instance;

    private BoardDAO() {
    }

    public static BoardDAO getInstance() {
        if (instance == null) {
            instance = new BoardDAO();
        }
        return instance;
    }

    // 게시글 총 개수 가져오기
    public int getListCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnection.getConnection();
            String query = "SELECT COUNT(*) FROM board";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return count;
    }

    // 게시글 리스트 가져오기
    public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
        ArrayList<BoardDTO> boardList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int startRow = (page - 1) * limit; // 페이지 시작 번호

        try {
            conn = DBconnection.getConnection();
            String query = "SELECT * FROM board WHERE " + items + " LIKE ? ORDER BY num DESC LIMIT ?, ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, "%" + text + "%");
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, limit);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setRegist_day(rs.getString("regist_day"));
                dto.setHit(rs.getInt("hit"));
                dto.setIp(rs.getString("ip"));

                boardList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return boardList;
    }

    // 새 게시글 등록
    public void insertBoard(BoardDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBconnection.getConnection();
            String query = "INSERT INTO board (id, name, subject, content, regist_day, ip) VALUES (?, ?, ?, ?, NOW(), ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getSubject());
            pstmt.setString(4, dto.getContent());
            pstmt.setString(5, dto.getIp());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // ID로 사용자 이름 가져오기
    public String getLoginNameById(String id) {
        String name = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnection.getConnection();
            String query = "SELECT name FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return name;
    }

    // 게시글 업데이트
    public void updateBoard(BoardDTO dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBconnection.getConnection();
            String query = "UPDATE board SET subject = ?, content = ? WHERE num = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getNum());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 게시물 삭제
    public void deleteBoard(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBconnection.getConnection();
            String query = "DELETE FROM board WHERE num = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
