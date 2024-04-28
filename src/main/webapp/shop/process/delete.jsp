<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/shop/process/delete.jsp");

    String scode = request.getParameter("scode");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = Util.getConnection();

        String sql =
                "DELETE FROM tbl_shop_01 WHERE scode=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, scode);

        pstmt.executeUpdate();
    } catch(Exception e) {
        log.error("SQL Error", e);
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            log.error("Close Error", e);
        }
    }

    response.sendRedirect("/shop/data.jsp");
%>