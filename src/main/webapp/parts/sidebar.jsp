<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="navbar-nav sidebar accordion" id="accordionSidebar">

    <li class="nav-item">
        <a class="nav-link" href="/index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        Data
    </div>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#product"
           aria-expanded="true" aria-controls="product">
            <i class="fas fa-fw fa-box"></i>
            <span>Product</span>
        </a>
        <div id="product" class="collapse" aria-labelledby="product" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Data Management</h6>
                <a class="collapse-item" href="/product/add.jsp">
                    <i class="fas fa-fw fa-circle-plus"></i>
                    <span>Add</span>
                </a>
                <a class="collapse-item" href="/product/data.jsp">
                    <i class="fas fa-fw fa-circle-check"></i>
                    <span>Check</span>
                </a>
                <a class="collapse-item" href="/product/edit.jsp">
                    <i class="fas fa-fw fa-pen-to-square"></i>
                    <span>Edit</span>
                </a>
                <a class="collapse-item" href="/product/remove.jsp">
                    <i class="fas fa-fw fa-trash"></i>
                    <span>Remove</span>
                </a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#shop"
           aria-expanded="true" aria-controls="shop">
            <i class="fas fa-fw fa-shop"></i>
            <span>Shop</span>
        </a>
        <div id="shop" class="collapse" aria-labelledby="shop" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Data Management</h6>
                <a class="collapse-item" href="/shop/add.jsp">
                    <i class="fas fa-fw fa-circle-plus"></i>
                    <span>Add</span>
                </a>
                <a class="collapse-item" href="/shop/data.jsp">
                    <i class="fas fa-fw fa-circle-check"></i>
                    <span>Check</span>
                </a>
                <a class="collapse-item" href="/shop/edit.jsp">
                    <i class="fas fa-fw fa-pen-to-square"></i>
                    <span>Edit</span>
                </a>
                <a class="collapse-item" href="/shop/remove.jsp">
                    <i class="fas fa-fw fa-trash"></i>
                    <span>Remove</span>
                </a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#sale"
           aria-expanded="true" aria-controls="sale">
            <i class="fas fa-fw fa-handshake"></i>
            <span>Sale</span>
        </a>
        <div id="sale" class="collapse" aria-labelledby="sale" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Data Management</h6>
                <a class="collapse-item" href="/sale/add.jsp">
                    <i class="fas fa-fw fa-circle-plus"></i>
                    <span>Add</span>
                </a>
                <a class="collapse-item" href="/sale/data.jsp">
                    <i class="fas fa-fw fa-circle-check"></i>
                    <span>Check</span>
                </a>
                <a class="collapse-item" href="/sale/edit.jsp">
                    <i class="fas fa-fw fa-pen-to-square"></i>
                    <span>Edit</span>
                </a>
                <a class="collapse-item" href="/sale/remove.jsp">
                    <i class="fas fa-fw fa-trash"></i>
                    <span>Remove</span>
                </a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>