function insertCheck() {
    if(document.frm_insert.pcode.value === "") {
        alert("상품코드가 입력되지 않았습니다.");
        frm_insert.pcode.focus();
        return false;
    };

    if(document.frm_insert.saledate.value === "") {
        alert("판매날짜가 입력되지 않았습니다.");
        frm_insert.saledate.focus();
        return false;
    }

    if(document.frm_insert.scode.value === "") {
        alert("매장코드가 입력되지 않았습니다.");
        frm_insert.scode.focus();
        return false;
    }

    if(document.frm_insert.amount.value === "") {
        alert("판매수량이 입력되지 않았습니다.");
        frm_insert.amount.focus();
        return false;
    }

    success();
    return true;
}

function success() {
    alert("판매등록이 완료 되었습니다.");
}