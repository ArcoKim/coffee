<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <style>
        a:nth-child(3){
            text-decoration: underline;
        }
    </style>
    <title>매장별 판매액</title>
</head>

<header><jsp:include page="parts/header.jsp" /></header>
<nav><jsp:include page="parts/nav.jsp" /></nav>

<section>
    <h3>매장별 판매액</h3>
    <table>
        <tr>
            <td>매장코드</td>
            <td>매장명</td>
            <td>매장별 판매액</td>
        </tr>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        conn = Util.getConnection();
        stmt = conn.createStatement();
        String sql =
              "SELECT " +
                "C.scode, B.sname, " +
                "TO_CHAR(sum(A.cost * C.amount), '999,999,999,999') cost " +
              "FROM "+
                "TBL_PRODUCT_01 A, TBL_SHOP_01 B, TBL_SALELIST_01 C " +
              "WHERE " +
                "B.SCODE = C.SCODE and A.PCODE = C.PCODE " +
              "GROUP BY C.SCODE, B.SNAME " +
              "ORDER BY 1";
        rs = stmt.executeQuery(sql);

        while(rs.next()) {
%>
        <tr>
            <td><%= rs.getString("scode") %></td>
            <td><%= rs.getString("sname") %></td>
            <td><%= rs.getString("cost") %></td>
        </tr>
<%
      }
  } catch (Exception e) {
      e.printStackTrace();
  } finally {
      try {
          if (rs != null) rs.close();
          if (stmt != null) stmt.close();
          if (conn != null) conn.close();
      } catch (SQLException e) {
          e.printStackTrace();
      }
  }
%>
    </table>
</section>

<footer><jsp:include page="parts/footer.jsp" /></footer>

</body>
</html>