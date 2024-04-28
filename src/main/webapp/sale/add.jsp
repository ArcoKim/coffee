<%@ page import="org.slf4j.Logger" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <jsp:include page="../parts/styles.jsp" />

    <title>판매 - 추가</title>
</head>

<body id="page-top">

<jsp:include page="../parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="../parts/sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">판매 - 추가</h1>
                </div>

                <div class="p-5 w-75 m-auto">
                    <div class="text-center">
                        <h3 class="text-gray-900 mb-4">Sale</h3>
                    </div>
                    <form class="user" action="/sale/process/insert.jsp" method="POST">
                        <%
                            Logger log = LoggerFactory.getLogger("/sale/add.jsp");

                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            try {
                                conn = Util.getConnection();

                                String sql =
                                    "SELECT MAX(a.saleno) + 1 saleno FROM tbl_salelist_01 a";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                rs.next();
                        %>
                        <div class="form-group">
                            <label for="saleno">판매번호</label>
                            <input type="text" class="form-control form-control-user" name="saleno"
                                   id="saleno" placeholder="판매번호를 입력하세요."
                                   value="<%= rs.getInt("saleno") %>" readonly>
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
                        <div class="form-group">
                            <label for="pcode">상품코드</label>
                            <input type="text" class="form-control form-control-user" name="pcode"
                                   id="pcode" placeholder="상품코드를 입력하세요." required>
                        </div>
                        <div class="form-group">
                            <label for="saledate">판매날짜</label>
                            <input type="text" class="form-control form-control-user" name="saledate"
                                   id="saledate" placeholder="판매날짜를 입력하세요." required>
                        </div>
                        <div class="form-group">
                            <label for="scode">매장코드</label>
                            <input type="text" class="form-control form-control-user" name="scode"
                                   id="scode" placeholder="매장코드를 입력하세요." required>
                        </div>
                        <div class="form-group">
                            <label for="amount">판매수량</label>
                            <input type="text" class="form-control form-control-user" name="amount"
                                   id="amount" placeholder="판매수량을 입력하세요." required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            등록하기
                        </button>
                    </form>
                </div>

            </div>

        </div>

        <jsp:include page="../parts/footer.jsp" />

    </div>

</div>

<jsp:include page="../parts/scripts.jsp" />

</body>

</html>