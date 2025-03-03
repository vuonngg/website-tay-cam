<template>
  <div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg py-3" style="background-color: #f8f8ff">
      <div class="container">
        <!-- Nút toggle khi thu nhỏ -->
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Nội dung Navbar -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <!-- Danh sách menu bên trái -->
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link fw-bold fs-5" href="#">Trang chủ</a>
            </li>
            <li class="nav-item">
              <router-link class="nav-link fw-bold fs-5" to="/discount"
                >Khuyễn mãi</router-link
              >
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle fw-bold text-black fs-5"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
              >
                Danh mục
              </a>
              <ul class="dropdown-menu">
                <li>
                  <router-link class="dropdown-item" to="/ps"
                    >Playtation Controller</router-link
                  >
                </li>
                <li>
                  <router-link class="dropdown-item" to="/xbox"
                    >Xbox Controller</router-link
                  >
                </li>
                <li>
                  <router-link class="dropdown-item" to="/nitendoController"
                    >Nitendo switch</router-link
                  >
                </li>
              </ul>
            </li>
          </ul>

          <!-- Ô tìm kiếm căn giữa -->
          <form class="d-flex mx-auto w-50">
            <input
              class="form-control me-2"
              type="search"
              placeholder="Tìm kiếm..."
              aria-label="Search"
            />
            <button class="btn btn-dark" type="submit">Search</button>
          </form>

          <!-- Giỏ hàng bên phải -->
          <ul class="navbar-nav ms-auto">
            <router-link to="/whishlist">
              <img
                src="../../img/iconwhishlist.png"
                alt="Giỏ hàng"
                width="30"
                height="27"
                class="d-inline-block align-text-top"
              />
            </router-link>
          </ul>
          <ul class="navbar-nav ms-auto">
            <router-link to="/gioHang">
              <img
                src="../../img/gioHang.png"
                alt="Giỏ hàng"
                width="30"
                height="35"
                class="d-inline-block align-text-top"
              />
            </router-link>
          </ul>
        </div>
      </div>
    </nav>

    <br />

    <router-view></router-view>
  </div>
</template>
<script setup></script>
