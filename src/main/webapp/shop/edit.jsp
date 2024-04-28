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

    <title>지점 - 변경</title>
</head>

<body id="page-top">

<jsp:include page="../parts/header.jsp" />

<div id="wrapper">

    <jsp:include page="../parts/sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between my-4">
                    <h1 class="h3 mb-0 text-gray-800">지점 - 변경</h1>
                </div>

                <div class="p-5 w-75 m-auto">
                    <div class="text-center">
                        <h3 class="text-gray-900 mb-4">Shop</h3>
                    </div>
                    <form class="user" action="/shop/process/update.jsp" method="POST">
                        <div class="form-group">
                            <label for="shop_select">매장코드</label>
                            <div class="form-select">
                                <select name="scode" id="shop_select">
                                    <option>매장코드를 선택해주세요.</option>
                                    <%
                                        Logger log = LoggerFactory.getLogger("/shop/edit.jsp");

                                        Connection conn = null;
                                        PreparedStatement pstmt = null;
                                        ResultSet rs = null;

                                        try {
                                            conn = Util.getConnection();

                                            String sql =
                                                "SELECT scode FROM tbl_shop_01";
                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            while(rs.next()) {
                                    %>
                                    <option value="<%= rs.getString("scode") %>"><%= rs.getString("scode") %></option>
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
                            <label for="sname">매장이름</label>
                            <input type="text" class="form-control form-control-user" name="sname"
                                   id="sname" placeholder="매장이름을 입력하세요." required>
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