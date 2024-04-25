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
        a:nth-child(1){
            text-decoration: underline;
        }
    </style>
    <title>판매등록</title>
</head>
<body>

<script src="js/confirm.js"></script>

<header>
    <jsp:include page="parts/header.jsp"/>
</header>
<nav>
    <jsp:include page="parts/nav.jsp"/>
</nav>
<SECTION>
    <h3>판매등록</h3>
<%
    Connection conn = null;
    Statement stmt = null;
    int saleno = 0;

    try {
        conn = Util.getConnection();
        stmt = conn.createStatement();
        String sql = "SELECT MAX(saleno) + 1 saleno FROM tbl_salelist_01";

        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        saleno = rs.getInt("saleno");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
    <form name="frm_insert" action="action.jsp" method="post">
        <table>
            <tr>
                <td>판매번호</td>
                <td><input type="text" name = "saleno" value="<%= saleno %>"></td>
            </tr>
            <tr>
                <td>상품코드</td>
                <td><input type="text" name = "pcode" value=""></td>
            </tr>
            <tr>
                <td>판매날짜</td>
                <td><input type="text" name = "saledate" value=""></td>
            </tr>
            <tr>
                <td>매장코드</td>
                <td><input type="text" name = "scode" value=""></td>
            </tr>
            <tr>
                <td>판매수량</td>
                <td><input type="text" name = "amount" value=""></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="등록" onclick="return insertCheck()" />
                    <input type="reset" value="다시쓰기" />
                </td>
            </tr>
        </table>
    </form>
</SECTION>
<footer>
    <jsp:include page="parts/footer.jsp"/>
</footer>
</body>
</html>