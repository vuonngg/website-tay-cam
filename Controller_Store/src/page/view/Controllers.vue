<template>
  <div class="container-sm container-md container-lg container-xl">
    <!-- Carousel -->
    <div
      id="carouselExampleSlidesOnly"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="2000">
          <router-link to="/xbox">
            <img
              src="https://i.imgur.com/U2Mxo0s.jpeg"
              class="d-block w-100"
              alt="Xbox"
            />
          </router-link>
        </div>
        <div class="carousel-item">
          <router-link to="/ps">
            <img
              src="https://i.imgur.com/qZVQFJZ.png"
              class="d-block w-100"
              alt="PlayStation"
            />
          </router-link>
        </div>
        <div class="carousel-item">
          <router-link to="/nitendoController">
            <img
              src="https://i.imgur.com/99nRJlt.png"
              class="d-block w-100"
              alt="Nintendo"
            />
          </router-link>
        </div>
      </div>
    </div>
    <br />
    <div class="row">
      <div class="col-2"></div>
      <div class="col-10">
        <div class="row g-4">
          <div v-for="pd in products" :key="pd.id" class="col-12 col-md-3 mb-4">
            <div class="card" style="">
              <img :src="pd.image" />
              <div class="card-body">
                <h5 class="card-title text-center">{{ pd.name }}</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up
                  the bulk of the card's content.
                </p>
                <b style="color: red"
                  >{{ Number(pd.price).toLocaleString("vi-VN") }}vnđ</b
                >
                <div class="d-flex justify-content-between">
                  <button class="btn btn-success">Thêm vào giỏ</button>
                  <button class="btn btn-danger">Mua</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { useToast } from "vue-toastification";
import Swal from "sweetalert2";

const categorys = ref([]);

const newProduct = ref({
  id: null,
  name: "",
  price: null,
  quantity: null,
  image: "",
  description: "",
  category: 2,
  createAt: null,
});
const products = ref([]);
const getProduct = async () => {
  try {
    const res = await axios.get("http://localhost:8080/products/hien-thi");
    console.log(res.data);
    products.value = res.data;
  } catch (error) {
    console.error("Lỗi khi gọi product:", error);
  }
};

//lấy category
const getCategory = async () => {
  try {
    const res = await axios.get(
      "http://localhost:8080/products/hien-thi/category"
    );
    console.log(res.data);
    categorys.value = res.data;
  } catch (error) {
    console.error("Lỗi khi gọi category:", error);
  }
};
onMounted(() => {
  getCategory();
  getProduct();
});
</script>
<style scoped>
#carouselExample {
  width: 100%; /* Thay đổi chiều rộng của carousel */
  max-width: 1200px; /* Giới hạn chiều rộng tối đa */
  margin: 0 auto; /* Căn giữa */
}

.carousel-item {
  height: 500px; /* Giới hạn chiều cao của carousel */
}

.carousel-item img {
  object-fit: cover; /* Giữ tỷ lệ ảnh khi thay đổi kích thước */
  height: 100%; /* Căn chỉnh chiều cao ảnh phù hợp với carousel-item */
}
.card {
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-title {
  font-size: 1.25rem;
  font-weight: bold;
}

.card-text {
  font-size: 1rem;
}

.card-body {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 150px;
}

button {
  width: 48%;
}

.modal-content {
  max-width: 500px;
  margin: 0 auto;
}
</style>
