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

    <jsp:include page="../parts/styles.jsp" />

    <title>Product - Edit</title>
</head>

<body id="page-top">

<jsp:include page="../parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="../parts/sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">Product - Edit</h1>
                </div>

                <div class="p-5 w-75 m-auto">
                    <div class="text-center">
                        <h3 class="text-gray-900 mb-4">Product</h3>
                    </div>
                    <form class="user" action="/product/process/update.jsp" method="POST">
                        <div class="form-group">
                            <label for="product_select">상품코드</label>
                            <div class="form-select">
                                <select name="pcode" id="product_select">
                                    <option>상품코드를 선택해주세요.</option>
                                    <%
                                        Logger log = LoggerFactory.getLogger("/product/edit.jsp");

                                        Connection conn = null;
                                        PreparedStatement pstmt = null;
                                        ResultSet rs = null;

                                        try {
                                            conn = Util.getConnection();

                                            String sql =
                                                "SELECT pcode FROM tbl_product_01";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            while(rs.next()) {
                                    %>
                                    <option value="<%= rs.getString("pcode") %>"><%= rs.getString("pcode") %></option>
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
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name">상품이름</label>
                            <input type="text" class="form-control form-control-user" name="name"
                                   id="name" placeholder="상품이름을 입력하세요." required>
                        </div>
                        <div class="form-group">
                            <label for="cost">금액</label>
                            <input type="text" class="form-control form-control-user" name="cost"
                                   id="cost" placeholder="금액을 입력하세요." required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            변경하기
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