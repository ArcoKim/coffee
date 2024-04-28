<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/sale/process/select.jsp");

    String saleno = request.getParameter("saleno");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = Util.getConnection();

        String sql =
            "SELECT pcode, saledate, scode, amount FROM tbl_salelist_01 WHERE saleno=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(saleno));

        rs = pstmt.executeQuery();
        rs.next();

        JSONObject ret = new JSONObject();
        ret.put("pcode", rs.getString("pcode"));
        ret.put("saledate", rs.getDate("saledate").toString());
        ret.put("scode", rs.getString("scode"));
        ret.put("amount", rs.getInt("amount"));

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