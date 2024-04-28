<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    Logger log = LoggerFactory.getLogger("/product/process/select.jsp");

    String pcode = request.getParameter("pcode");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = Util.getConnection();

        String sql =
            "SELECT name, cost FROM tbl_product_01 WHERE pcode=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pcode);

        rs = pstmt.executeQuery();
        rs.next();

        JSONObject ret = new JSONObject();
        ret.put("name", rs.getString("name"));
        ret.put("cost", rs.getInt("cost"));

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