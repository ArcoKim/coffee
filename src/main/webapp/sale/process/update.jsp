<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/sale/process/update.jsp");

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
                "UPDATE tbl_salelist_01 SET pcode=?, saledate=?, scode=?, amount=? WHERE saleno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pcode);
        pstmt.setDate(2, Date.valueOf(saledate));
        pstmt.setString(3, scode);
        pstmt.setInt(4, Integer.parseInt(amount));
        pstmt.setInt(5, Integer.parseInt(saleno));

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