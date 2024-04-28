<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/product/process/insert.jsp");

    String pcode = request.getParameter("pcode");
    String name = request.getParameter("name");
    String cost = request.getParameter("cost");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = Util.getConnection();

        String sql =
            "INSERT INTO tbl_product_01 VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pcode);
        pstmt.setString(2, name);
        pstmt.setInt(3, Integer.parseInt(cost));

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