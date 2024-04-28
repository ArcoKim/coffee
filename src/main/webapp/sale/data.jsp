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

    <title>판매 - 확인</title>
</head>

<body id="page-top">

<jsp:include page="../parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="../parts/sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">판매 - 확인</h1>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Sale</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>비번호</th>
                                    <th>상품코드</th>
                                    <th>판매날짜</th>
                                    <th>매장코드</th>
                                    <th>상품명</th>
                                    <th>판매수량</th>
                                    <th>총판매액</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>비번호</th>
                                    <th>상품코드</th>
                                    <th>판매날짜</th>
                                    <th>매장코드</th>
                                    <th>상품명</th>
                                    <th>판매수량</th>
                                    <th>총판매액</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <%
                                    Logger log = LoggerFactory.getLogger("/sale/data.jsp");

                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;

                                    try {
                                        conn = Util.getConnection();

                                        String sql =
                                            "SELECT a.saleno, a.pcode, a.saledate, a.scode, b.name, a.amount, " +
                                            "TO_CHAR(a.amount * b.cost, '999,999,999,999') cost " +
                                            "FROM tbl_salelist_01 a, tbl_product_01 b " +
                                            "WHERE a.pcode = b.pcode";
                                        pstmt = conn.prepareStatement(sql);
                                        rs = pstmt.executeQuery();

                                        while(rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getInt("saleno") %></td>
                                    <td><%= rs.getString("pcode") %></td>
                                    <td><%= rs.getDate("saledate") %></td>
                                    <td><%= rs.getString("scode") %></td>
                                    <td><%= rs.getString("name") %></td>
                                    <td><%= rs.getInt("amount") %></td>
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