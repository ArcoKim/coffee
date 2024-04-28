<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/sale/process/select.jsp");

    String scode = request.getParameter("scode");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = Util.getConnection();

        String sql =
            "SELECT sname FROM tbl_shop_01 WHERE scode=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, scode);

        rs = pstmt.executeQuery();
        rs.next();

        JSONObject ret = new JSONObject();
        ret.put("sname", rs.getString("sname"));

        response.setContentType("application/json");
        out.print(ret.toJSONString());
    } catch(Exception e) {
        log.error("SQL Error", e);
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            log.error("Close Error", e);
        }
    }
%>