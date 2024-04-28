<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/product/process/delete.jsp");

    String pcode = request.getParameter("pcode");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = Util.getConnection();

        String sql =
                "DELETE FROM tbl_product_01 WHERE pcode=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pcode);

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

    response.sendRedirect("/product/data.jsp");
%>