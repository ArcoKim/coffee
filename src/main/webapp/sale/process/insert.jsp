<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/sale/process/insert.jsp");

    String saleno = request.getParameter("saleno");
    String pcode = request.getParameter("pcode");
    String saledate = request.getParameter("saledate");
    String scode = request.getParameter("scode");
    String amount = request.getParameter("amount");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = Util.getConnection();

        String sql =
                "INSERT INTO tbl_salelist_01 VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(saleno));
        pstmt.setString(2, pcode);
        pstmt.setDate(3, Date.valueOf(saledate));
        pstmt.setString(4, scode);
        pstmt.setInt(5, Integer.parseInt(amount));

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

    response.sendRedirect("/sale/data.jsp");
%>