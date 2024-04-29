<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <jsp:include page="parts/styles.jsp" />

    <title>Dashboard</title>
</head>

<body id="page-top">

<jsp:include page="parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="parts/sidebar.jsp" />

    <%
        Logger log = LoggerFactory.getLogger("index.jsp");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {
            conn = Util.getConnection();
    %>
    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">

            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                </div>

                <div class="row">

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            총 판매액</div>
                                        <%
                                            sql =
                                                "SELECT TO_CHAR(SUM(a.amount * b.cost), '999,999,999,999') cost " +
                                                "FROM tbl_salelist_01 a, tbl_product_01 b " +
                                                "WHERE a.pcode = b.pcode";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            rs.next();
                                        %>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            총합
                                            <br />
                                            <%= rs.getString("cost") %>원
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            최대 매출 상품</div>
                                        <%
                                            sql =
                                                "SELECT name, TO_CHAR(cost, 'FM999,999,999,999') cost " +
                                                "FROM (SELECT a.name, SUM(a.cost * b.amount) cost " +
                                                "      FROM tbl_product_01 a, " +
                                                "           tbl_salelist_01 b " +
                                                "      WHERE a.pcode = b.pcode " +
                                                "      GROUP BY a.pcode, a.name " +
                                                "      ORDER BY cost DESC) " +
                                                "WHERE ROWNUM = 1";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            rs.next();
                                        %>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%= rs.getString("name") %>
                                            <br />
                                            <%= rs.getString("cost") %>원
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-mug-hot fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            최대 매출 지점</div>
                                        <%
                                            sql =
                                                "SELECT sname, TO_CHAR(cost, 'FM999,999,999,999') cost " +
                                                "FROM (SELECT a.sname, SUM(c.amount * b.cost) cost " +
                                                "      FROM tbl_shop_01 a, " +
                                                "           tbl_product_01 b, " +
                                                "           tbl_salelist_01 c " +
                                                "      WHERE a.scode = c.scode " +
                                                "        and b.pcode = c.pcode " +
                                                "      GROUP BY a.scode, a.sname " +
                                                "      ORDER BY cost DESC " +
                                                ") WHERE ROWNUM=1";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            rs.next();
                                        %>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%= rs.getString("sname") %>
                                            <br />
                                            <%= rs.getString("cost") %>원
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-store fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            최대 매출 판매</div>
                                        <%
                                            sql =
                                                "SELECT name, TO_CHAR(cost, 'FM999,999,999,999') cost " +
                                                "FROM (SELECT b.name, a.amount * b.cost cost " +
                                                "      FROM tbl_salelist_01 a, " +
                                                "           tbl_product_01 b " +
                                                "      WHERE a.pcode = b.pcode " +
                                                "      ORDER BY cost DESC) " +
                                                "WHERE ROWNUM = 1";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            rs.next();
                                        %>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%= rs.getString("name") %>
                                            <br />
                                            <%= rs.getString("cost") %>원
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-handshake fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="card shadow mb-4 ml-2">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Table Description</h6>
                        </div>
                        <div class="card-body">
                            <ol>
                                <li>
                                    <strong>tbl_product_01</strong>: 이 테이블은 제품 정보를 저장합니다.
                                    <ul>
                                        <li><strong>pcode</strong>: 제품 코드를 나타내는 VARCHAR2(10) 타입의 주요 키(primary key)입니다.</li>
                                        <li><strong>name</strong>: 제품 이름을 나타내는 VARCHAR2(20) 타입의 열입니다.</li>
                                        <li><strong>cost</strong>: 제품 가격을 나타내는 NUMBER(10) 타입의 열입니다.</li>
                                    </ul>
                                </li>
                                <li>
                                    <strong>tbl_shop_01</strong>: 이 테이블은 상점 정보를 저장합니다.
                                    <ul>
                                        <li><strong>scode</strong>: 상점 코드를 나타내는 VARCHAR2(10) 타입의 주요 키입니다.</li>
                                        <li><strong>sname</strong>: 상점 이름을 나타내는 VARCHAR2(20) 타입의 열입니다.</li>
                                    </ul>
                                </li>
                                <li>
                                    <strong>tbl_salelist_01</strong>: 이 테이블은 판매 목록 정보를 저장합니다.
                                    <ul>
                                        <li><strong>saleno</strong>: 판매 번호를 나타내는 NUMBER(10) 타입의 주요 키입니다.</li>
                                        <li><strong>pcode</strong>: 제품 코드를 나타내는 VARCHAR2(10) 타입의 열이며, tbl_product_01의 pcode와 관계를 형성합니다.</li>
                                        <li><strong>saledate</strong>: 판매 일자를 나타내는 DATE 타입의 열입니다.</li>
                                        <li><strong>scode</strong>: 상점 코드를 나타내는 VARCHAR2(10) 타입의 열이며, tbl_shop_01의 scode와 관계를 형성합니다.</li>
                                        <li><strong>amount</strong>: 제품 판매량을 나타내는 NUMBER(10) 타입의 열입니다.</li>
                                    </ul>
                                </li>
                            </ol>
                        </div>
                    </div>

            </div>

        </div>

    </div>

    <%
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

    <jsp:include page="parts/footer.jsp" />

</div>

<jsp:include page="parts/scripts.jsp" />

</body>

</html>