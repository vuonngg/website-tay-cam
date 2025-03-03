<template>
  <div class="container">
    <div class="row">
      <br />
      <div class="col-8">
        <h4 class="text-center"><b>Danh sách sản phẩm</b></h4>
        <br />
        <div v-for="product in products" :key="product.id">
          <!-- // -->
          <div class="card mb-3" style="max-width: 800px">
            <div class="row g-0">
              <div
                class="col-md-4 d-flex align-items-center justify-content-center"
              >
                <img
                  :src="product.image"
                  class="img-fluid"
                  alt="..."
                  width="200"
                  height="150"
                />
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">
                    <b>{{ product.name }}</b>
                  </h5>
                  <p class="card-text Helvetica Neue">
                    {{ product.description }}
                  </p>
                  <div class="row">
                    <div class="col-9">
                      <p class="card-text">
                        <small class="text-body-secondary me-2"
                          >Ngày thêm: <b> {{ product.createAt }}</b></small
                        >
                        <small class="text-body-secondary me-2"
                          >Số lượng: <b> {{ product.quantity }}</b></small
                        >
                        <small class="text-body-secondary" style="float: right"
                          >Giá:
                          <b style="color: red">
                            {{ Number(product.price).toLocaleString("vi-VN") }}
                            vnđ</b
                          >
                        </small>
                      </p>
                    </div>
                    <div class="col-3">
                      <button
                        type="button"
                        class="btn btn btn-warning"
                        style="
                          --bs-btn-padding-y: 0.25rem;
                          --bs-btn-padding-x: 0.5rem;
                          --bs-btn-font-size: 0.75rem;
                        "
                        @click="deleteProduct(product.id)"
                      >
                        Xóa
                      </button>
                      <button
                        type="button"
                        class="btn btn btn-success ms-2"
                        style="
                          --bs-btn-padding-y: 0.25rem;
                          --bs-btn-padding-x: 0.5rem;
                          --bs-btn-font-size: 0.75rem;
                        "
                        @click="detailUpdate(product)"
                      >
                        Sửa
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <nav aria-label="...">
          <ul class="pagination justify-content-center">
            <li class="page-item disabled">
              <a class="page-link">Trước</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item" aria-current="page">
              <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#">Sau</a>
            </li>
          </ul>
        </nav>
      </div>
      <div class="col-4">
        <br />
        <br /><br />
        <div v-show="!isShow">
          <div class="form-floating">
            <input
              type="text"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.name"
            />

            <label for="floatingTextarea">Tên sản phẩm</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.price"
            />

            <label for="floatingTextarea">Giá</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              min="1"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.quantity"
            />

            <label for="floatingTextarea">Số lượng</label>
          </div>
          <br />
          <div class="row">
            <div class="col-7">
              <div class="form-floating">
                <input
                  type="file"
                  min="1"
                  required
                  class="form-control"
                  @change="saveImage($event)"
                />

                <label for="floatingTextarea">Ảnh</label>
              </div>
            </div>
            <div class="col-5">
              <div style="padding-left: 10px"><b>Danh mục</b></div>
              <select
                v-model="newProduct.category"
                class="form-select"
                aria-label="Default select example"
              >
                <option v-for="ct in categorys" :key="ct.id" :value="ct.id">
                  {{ ct.name }}
                </option>
              </select>
            </div>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="text"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              style="height: 150px"
              v-model="newProduct.description"
            />

            <label for="floatingTextarea">Mô tả sản phẩm</label>
          </div>
          <br />
          <div class="text-center">
            <button type="button" class="btn btn-info" @click="addProduct()">
              Thêm sản phẩm
            </button>
          </div>
        </div>
        <div v-show="isShow">
          <div class="text-end">
            <button
              @click="previousAdd()"
              type="button"
              class="btn btn-primary"
              style="
                --bs-btn-padding-y: 0.25rem;
                --bs-btn-padding-x: 0.5rem;
                --bs-btn-font-size: 0.75rem;
              "
            >
              Trở về
            </button>
          </div>
          <div class="form-floating">
            <input
              type="text"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.name"
            />

            <label for="floatingTextarea">Tên sản phẩm</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.price"
            />

            <label for="floatingTextarea">Giá</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              min="1"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newProduct.quantity"
            />

            <label for="floatingTextarea">Số lượng</label>
          </div>
          <br />
          <div class="row">
            <div class="col-7">
              <div class="form-floating">
                <input
                  type="file"
                  min="1"
                  required
                  class="form-control"
                  @change="saveImage($event)"
                />

                <label for="floatingTextarea">Ảnh</label>
              </div>
            </div>
            <div class="col-5">
              <div style="padding-left: 10px"><b>Danh mục</b></div>
              <select
                v-model="newProduct.category"
                class="form-select"
                aria-label="Default select example"
              >
                <option v-for="ct in categorys" :key="ct.id" :value="ct.id">
                  {{ ct.name }}
                </option>
              </select>
            </div>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="text"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              style="height: 150px"
              v-model="newProduct.description"
            />

            <label for="floatingTextarea">Mô tả sản phẩm</label>
          </div>
          <br />
          <div class="text-center">
            <button type="button" class="btn btn-info" @click="updateProduct()">
              Cập nhật sản phẩm
            </button>
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

// tro ve
const previousAdd = () => {
  resetNewProduct();
  isShow.value = false;
};

//thong bao
const toast = useToast();

// category lấy ra;
const categorys = ref([]);
//product để lấy ra
const products = ref([]);
//hàm lưu ảnh vào biến
const fileImage = ref(null);
const saveImage = (image) => {
  fileImage.value = image.target.files[0];
};
// upda nahr lên
const uploadImage = async () => {
  if (!fileImage.value) return null;

  const formData = new FormData();
  formData.append("image", fileImage.value);

  try {
    const response = await axios.post(
      "https://api.imgbb.com/1/upload",
      formData,
      {
        params: {
          key: "5eda1e9473b687a7d46d23eb95dc4d13", // API Key ImgBB
        },
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }
    );

    // Lấy link ảnh từ phản hồi API
    const imageUrl = response.data.data.url;
    console.log("Ảnh đã upload thành công:", imageUrl);
    return imageUrl;
  } catch (error) {
    console.error("Lỗi upload ảnh:", error.response?.data || error.message);
    return null;
  }
};
// hàm new để gán vào dom
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
//resert newProduct
const resetNewProduct = () => {
  newProduct.value = {
    id: null,
    name: "",
    price: null,
    quantity: null,
    image: "",
    description: "",
    category: 2,
    createAt: null,
  };
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
// lấy productproduct
const getProduct = async () => {
  try {
    const res = await axios.get("http://localhost:8080/products/hien-thi");
    console.log(res.data);
    products.value = res.data;
  } catch (error) {
    console.error("Lỗi khi gọi product:", error);
  }
};
onMounted(() => {
  getCategory();
  getProduct();
});

// tạo iswhow để hiện update
const isShow = ref(false);
// tạo hàm showUpdate để hiện update
const detailUpdate = (product) => {
  newProduct.value = { ...product, category: product.category?.id };
  isShow.value = true;
};
//chewck form
const validateForm = (isEdit = false) => {
  if (!newProduct.value.name.trim()) {
    toast.error("Tên sản phẩm không được để trống.");
    return false;
  }
  if (!newProduct.value.price || newProduct.value.price <= 0) {
    toast.error("Giá sản phẩm phải lớn hơn 0.");
    return false;
  }
  if (!newProduct.value.quantity || newProduct.value.quantity <= 0) {
    toast.error("Số lượng sản phẩm phải lớn hơn 0.");
    return false;
  }
  if (!isEdit && !fileImage.value) {
    // Thêm mới: bắt buộc chọn ảnh
    toast.error("Vui lòng chọn ảnh sản phẩm.");
    return false;
  } else if (isEdit && !fileImage.value && !newProduct.value.image) {
    // Cập nhật: không có ảnh cũ và không chọn mới
    toast.error("Vui lòng chọn ảnh sản phẩm.");
    return false;
  }

  if (!newProduct.value.description.trim()) {
    toast.error("Mô tả sản phẩm không được để trống.");
    return false;
  }
  if (!newProduct.value.category) {
    toast.error("Vui lòng chọn danh mục sản phẩm.");
    return false;
  }
  return true;
};
// hàm add
const addProduct = async () => {
  if (!validateForm(true)) return;

  try {
    // Upload ảnh
    const imageUrl = await uploadImage();
    if (!imageUrl) {
      toast.error("Không thể upload ảnh.");
      return;
    }

    // Tạo sản phẩm mới
    const productData = {
      id: null,
      name: newProduct.value.name,
      price: newProduct.value.price,
      quantity: newProduct.value.quantity,
      image: imageUrl,
      description: newProduct.value.description,
      category: { id: newProduct.value.category },
      createAt: new Date().toISOString().split("T")[0],
    };
    console.log("Du lieu truoc khi add", productData);
    console.log("Dữ liệu JSON:", JSON.stringify(productData, null, 2));
    // Gửi yêu cầu thêm
    const res = await axios.post(
      "http://localhost:8080/products/add",
      productData
    );
    toast.success("Thêm sản phẩm thành công!");
    getProduct(); // Làm mới danh sách
    resetNewProduct(); // Reset form
    fileImage.value = null;
  } catch (error) {
    toast.error("Thêm sản phẩm thất bại.");
    console.error(error);
  }
};

//ham xoa
const deleteProduct = async (id) => {
  if (!id) {
    toast.error("ID không hợp lệ!");
    return;
  }

  Swal.fire({
    title: "Bạn có muốn xóa không?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Có",
    cancelButtonText: "Không",
  }).then(async (result) => {
    // Cần async ở đây vì có await bên trong
    if (result.isConfirmed) {
      try {
        await axios.delete(`http://localhost:8080/products/delete/${id}`);
        toast.success("Xóa thành công!");
        getProduct(); // Load lại danh sách sau khi xóa
      } catch (error) {
        console.error("Lỗi khi xóa sản phẩm:", error);
        toast.error("Xóa thất bại!");
      }
    }
  });
};

//hamf update
const updateProduct = async () => {
  if (!validateForm(true)) return;

  try {
    let imageUrl = newProduct.value.image; // Giữ nguyên URL ảnh cũ

    // Nếu người dùng chọn ảnh mới, upload và cập nhật URL
    if (fileImage.value) {
      const uploadedUrl = await uploadImage();
      if (!uploadedUrl) {
        toast.error("Không thể upload ảnh.");
        return;
      }
      imageUrl = uploadedUrl; // Cập nhật URL ảnh mới
    }

    // Tạo dữ liệu sản phẩm để update
    const productData = {
      id: newProduct.value.id, // ID sản phẩm cần cập nhật
      name: newProduct.value.name,
      price: newProduct.value.price,
      quantity: newProduct.value.quantity,
      image: imageUrl, // Giữ ảnh cũ hoặc ảnh mới
      description: newProduct.value.description,
      category: { id: newProduct.value.category },
      createAt: newProduct.value.createAt,
    };

    console.log("Dữ liệu trước khi update:", productData);
    console.log("Dữ liệu JSON:", JSON.stringify(productData, null, 2));

    // Gửi yêu cầu cập nhật
    const res = await axios.put(
      `http://localhost:8080/products/update`,
      productData
    );

    toast.success("Cập nhật sản phẩm thành công!");
    getProduct(); // Làm mới danh sách sản phẩm
    resetNewProduct(); // Reset form
    fileImage.value = null;
  } catch (error) {
    toast.error("Cập nhật sản phẩm thất bại.");
    console.error(error);
  }

  isShow.value = false;
};

// phân trang
const page = ref(1);
</script>
