<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page contentType="text/html; charset = UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <style>
        a:nth-child(2){
            text-decoration: underline;
        }
    </style>
    <title>판매등록</title>
</head>
<body>
<header>
    <jsp:include page="parts/header.jsp"/>
</header>
<nav>
    <jsp:include page="parts/nav.jsp"/>
</nav>
<SECTION>
    <h3>판매현황</h3>
    <table>
        <tr>
            <td>비번호</td>
            <td>상품코드</td>
            <td>판매날짜</td>
            <td>매장코드</td>
            <td>상품명</td>
            <td>판매수량</td>
            <td>총판매액</td>
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
                "B.saleno, " +
                "A.pcode, " +
                "TO_CHAR(B.saledate, 'yyyymmdd') saledate, " +
                "B.scode, "+
                "A.name, "+
                "B.amount, "+
                "TO_CHAR(A.cost * B.amount, '999,999,999,999') cost "+
            "FROM "+
                "TBL_PRODUCT_01 A, TBL_SALELIST_01 B "+
            "WHERE "+
                "A.pcode = B.pcode";

        rs = stmt.executeQuery(sql);
        while (rs.next()){
%>
        <tr>
            <td><%=rs.getInt("saleno")%></td>
            <td><%=rs.getString("pcode")%></td>
            <td><%=rs.getInt("saledate")%></td>
            <td><%=rs.getString("scode")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getInt("amount")%></td>
            <td><%=rs.getString("cost")%></td>
        </tr>
<%
        }
    }
    catch (Exception e) {
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
</SECTION>
<footer>
    <jsp:include page="parts/footer.jsp"/>
</footer>
</body>
</html>