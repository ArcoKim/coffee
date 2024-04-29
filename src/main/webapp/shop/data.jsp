<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <jsp:include page="../parts/styles.jsp" />

    <title>Shop - Check</title>
</head>

<body id="page-top">

<jsp:include page="../parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="../parts/sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">Shop - Check</h1>
                </div>

                <div class="card shadow mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Shop</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>매장코드</th>
                                    <th>매장명</th>
                                    <th>매장별 판매액</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>매장코드</th>
                                    <th>매장명</th>
                                    <th>매장별 판매액</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    Logger log = LoggerFactory.getLogger("/shop/data.jsp");

                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;

                                    try {
                                        conn = Util.getConnection();

                                        String sql =
                                            "SELECT a.scode, a.sname, " +
                                            "NVL(TO_CHAR(SUM(c.amount * b.cost), '999,999,999,999'), 0) cost " +
                                            "FROM tbl_shop_01 a, tbl_product_01 b, tbl_salelist_01 c " +
                                            "WHERE a.scode = c.scode(+) and b.pcode(+) = c.pcode " +
                                            "GROUP BY a.scode, a.sname " +
                                            "ORDER BY a.scode";
                                        pstmt = conn.prepareStatement(sql);
                                        rs = pstmt.executeQuery();

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
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <jsp:include page="../parts/footer.jsp" />

    </div>

</div>

<jsp:include page="../parts/scripts.jsp" />

</body>

</html>