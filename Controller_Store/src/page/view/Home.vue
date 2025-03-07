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
              <router-link
                class="nav-link fw-bold fs-6"
                :class="{ 'bg-secondary text-white': $route.path === '/' }"
                to="/"
              >
                Trang chủ
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link fw-bold fs-6"
                :class="{ 'bg-secondary text-white': $route.path === '/ps' }"
                to="/ps"
              >
                PlayStation Controller
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link fw-bold fs-6"
                :class="{ 'bg-secondary text-white': $route.path === '/xbox' }"
                to="/xbox"
              >
                Xbox Controller
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link fw-bold fs-6"
                :class="{
                  'bg-secondary text-white':
                    $route.path === '/nitendoController',
                }"
                to="/nitendoController"
              >
                Nintendo Switch
              </router-link>
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

          <!-- Biểu tượng giỏ hàng và yêu thích bên phải -->
          <ul class="navbar-nav ms-auto d-flex align-items-center">
            <li class="nav-item">
              <router-link to="/whishlist">
                <img
                  src="../../img/iconwhishlist.png"
                  alt="Wishlist"
                  width="30"
                  height="27"
                  class="d-inline-block align-text-top"
                />
              </router-link>
            </li>
            <li class="nav-item ms-3">
              <router-link to="/gioHang">
                <img
                  src="../../img/gioHang.png"
                  alt="Giỏ hàng"
                  width="30"
                  height="35"
                  class="d-inline-block align-text-top"
                />
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script setup></script>

<style scoped>
/* Thêm lớp CSS để giảm kích thước chữ cho các menu */
.nav-link.fs-6 {
  font-size: 0.875rem; /* Giảm kích thước chữ */
  white-space: nowrap; /* Đảm bảo không xuống dòng */
}

/* Tạo lớp cho các menu khi đang chọn và đổi màu nền thành xám */
.nav-link.bg-secondary {
  background-color: #6c757d !important;
  color: white !important;
}

/* Thay đổi kích thước ô tìm kiếm */
form .form-control {
  width: 300px; /* Rút ngắn chiều rộng ô tìm kiếm */
}

/* Căn chỉnh giỏ hàng và yêu thích cách đều đẹp */
.navbar-nav.ms-auto {
  display: flex;
  align-items: center;
  justify-content: space-between; /* Căn đều */
  width: 150px; /* Giới hạn chiều rộng của thanh biểu tượng */
}

.nav-item {
  margin-right: 20px; /* Tạo khoảng cách đều giữa các biểu tượng */
}
</style>
