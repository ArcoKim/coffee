$(document).ready(function() {
    $('#dataTable').DataTable();
    $('#product_select').change(() => {
        fetch("/product/process/select.jsp?pcode=" + $('#product_select').val())
            .then((response) => response.json())
            .then((data) => {
                $("#name").val(data.name);
                $("#cost").val(data.cost);
            });
    });
    $('#sale_select').change(() => {
        fetch("/sale/process/select.jsp?saleno=" + $('#sale_select').val())
            .then((response) => response.json())
            .then((data) => {
                $("#pcode").val(data.pcode);
                $("#saledate").val(data.saledate);
                $("#scode").val(data.scode);
                $("#amount").val(data.amount);
            });
    });
    $('#shop_select').change(() => {
        fetch("/shop/process/select.jsp?scode=" + $('#shop_select').val())
            .then((response) => response.json())
            .then((data) => {
                $("#sname").val(data.sname);
            });
    });
});
