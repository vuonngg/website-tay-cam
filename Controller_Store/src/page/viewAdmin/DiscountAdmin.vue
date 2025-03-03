<template>
  <div class="container">
    <div class="row">
      <br />
      <div class="col-8">
        <h4 class="text-center"><b>Danh sách mã giảm giá</b></h4>
        <br />
        <table border="1" class="table table-success text-center table-hover">
          <thead>
            <tr>
              <th>STT</th>
              <th>Mã code</th>
              <th>Số lượng</th>
              <th>Phần trăm</th>
              <th>Ngày bắt đầu</th>
              <th>Ngày hết hạn</th>
              <th>Ngày tạo</th>
              <th colspan="3"></th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(dc, index) in discounts"
              :key="dc.id"
              @click="detailAdd(dc)"
            >
              <th>{{ index + 1 }}</th>
              <th>{{ dc.code }}</th>
              <th>{{ dc.quantity }}</th>
              <th>{{ dc.percentage + "%" }}</th>
              <th>{{ dc.validFrom }}</th>
              <th>{{ dc.validTo }}</th>
              <th>{{ dc.createAt }}</th>
              <td>
                <div class="action-buttons">
                  <button
                    type="button"
                    @click="deleteDiscount(dc.id)"
                    class="btn btn-warning"
                  >
                    Xóa
                  </button>
                  <button
                    type="button"
                    @click="detailUpdate(dc)"
                    class="btn btn-success"
                  >
                    Sửa
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-4 ps-5">
        <br />
        <br />
        <br />
        <form v-show="isShow">
          <div class="form-floating">
            <input
              type="text"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newDiscount.code"
            />

            <label for="floatingTextarea">Mã code</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              min="5"
              max="100"
              step="5"
              v-model="newDiscount.quantity"
            />

            <label for="floatingTextarea">Số lượng</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              min="11"
              step="5"
              v-model="newDiscount.percentage"
            />

            <label for="floatingTextarea">Số phần trăm %</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="date"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newDiscount.validFrom"
            />
            <label for="floatingTextarea">Ngày bắt đầu</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="date"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newDiscount.validTo"
            />
            <label for="floatingTextarea">Ngày hết hạn</label>
          </div>
          <br />
          <br />
          <div class="text-center">
            <button type="button" class="btn btn-info" @click="addDiscount()">
              Thêm
            </button>
          </div>
        </form>
        <form v-show="!isShow">
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
              v-model="newDiscount.code"
            />

            <label for="floatingTextarea">Mã code</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              min="5"
              max="100"
              step="5"
              v-model="newDiscount.quantity"
            />

            <label for="floatingTextarea">Số lượng</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="number"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              min="11"
              step="5"
              v-model="newDiscount.percentage"
            />

            <label for="floatingTextarea">Số phần trăm %</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="date"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newDiscount.validFrom"
            />
            <label for="floatingTextarea">Ngày bắt đầu</label>
          </div>
          <br />
          <div class="form-floating">
            <input
              type="date"
              required
              class="form-control"
              placeholder="Leave a comment here"
              id="floatingTextarea"
              v-model="newDiscount.validTo"
            />
            <label for="floatingTextarea">Ngày hết hạn</label>
          </div>
          <br />
          <br />
          <div class="text-center">
            <button
              type="button"
              class="btn btn-success"
              @click="updateDiscount()"
            >
              Sửa
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { useToast } from "vue-toastification";
import Swal from "sweetalert2";

//detail add
const detailAdd = (dc) => {
  newDiscount.value = { ...dc };
};

//
const toast = useToast();
//tro ve
const previousAdd = () => {
  isShow.value = true;
  resetDiscount();
};

//v show update
const isShow = ref(true);

//dicountdicount

const discounts = ref([]);
const newDiscount = ref({
  id: null,
  quantity: 1,
  code: "",
  percentage: 5,
  validFrom: null,
  validTo: null,
  createAt: new Date().toISOString().split("T")[0],
});
const discountUpdate = ref({
  id: null,
  quantity: 1,
  code: "",
  percentage: 5,
  validFrom: null,
  validTo: null,
  createAt: null,
});
const resetDicountUpdate = () => {
  discountUpdate.value = {
    id: null,
    quantity: 1,
    code: "",
    percentage: 5,
    validFrom: null,
    validTo: null,
    createAt: null,
  };
};
const resetDiscount = () => {
  newDiscount.value = {
    id: null,
    quantity: 1,
    code: "",
    percentage: 5,
    validFrom: null,
    validTo: null,
    createAt: new Date().toISOString().split("T")[0],
  };
};

// Hàm lấy danh sách mã giảm giá
const getDiscounts = async () => {
  try {
    const response = await axios.get(
      "http://localhost:8080/discounts/hien-thi"
    );
    console.log(response.data);
    discounts.value = response.data;
  } catch (error) {
    console.error("Lỗi khi gọi API lấy discount:", error);
  }
};
const detailUpdate = (discount) => {
  newDiscount.value = { ...discount };
  discountUpdate.value.createAt = discount.createAt;
  isShow.value = false;
};

const addDiscount = async () => {
  console.log(
    "Dữ liệu trước khi gửi:",
    JSON.stringify(newDiscount.value, null, 2)
  );

  if (!newDiscount.value) {
    toast.error("Dữ liệu giảm giá không hợp lệ!");
    return;
  }

  const { id, ...discountData } = newDiscount.value;

  // Kiểm tra các trường không được null, rỗng hoặc không hợp lệ
  if (
    !discountData.code.trim() ||
    discountData.percentage == null ||
    discountData.quantity == null ||
    !discountData.validFrom ||
    !discountData.validTo ||
    !discountData.createAt
  ) {
    toast.error("Vui lòng nhập đầy đủ thông tin giảm giá!");
    return;
  }

  // Kiểm tra quantity phải là số nguyên >= 1
  if (!Number.isInteger(discountData.quantity) || discountData.quantity < 1) {
    toast.error("Số lượng phải là số nguyên và lớn hơn hoặc bằng 1!");
    return;
  }

  // Kiểm tra percentage phải là số và >= 5
  if (
    typeof discountData.percentage !== "number" ||
    discountData.percentage < 5
  ) {
    toast.error("Phần trăm giảm giá phải là số và lớn hơn hoặc bằng 5!");
    return;
  }

  const createDate = new Date(discountData.createAt);
  const validFromDate = new Date(discountData.validFrom);
  const validToDate = new Date(discountData.validTo);

  // Kiểm tra ngày áp dụng phải sau hoặc bằng ngày tạo
  if (validFromDate < createDate) {
    toast.error(
      `Ngày áp dụng (${discountData.validFrom}) phải sau hoặc bằng ngày tạo (${discountData.createAt})!`
    );
    return;
  }

  // Kiểm tra ngày hết hạn phải sau ngày áp dụng
  if (validToDate <= validFromDate) {
    toast.error(
      `Ngày hết hạn (${discountData.validTo}) phải sau ngày áp dụng (${discountData.validFrom})!`
    );
    return;
  }

  try {
    const response = await axios.post(
      "http://localhost:8080/discounts/add",
      discountData
    );

    toast.success("Thêm giảm giá thành công!");
    console.log("Thêm giảm giá thành công:", response.data);

    resetDiscount();
    getDiscounts();
  } catch (error) {
    console.error("Lỗi khi thêm giảm giá:", error);
    toast.error("Đã xảy ra lỗi khi thêm giảm giá!");
  }
};

const updateDiscount = async () => {
  discountUpdate.value = {
    ...JSON.parse(JSON.stringify(newDiscount.value)),
    createAt: discountUpdate.value.createAt,
  };
  console.log(
    "Dữ liệu trước khi gửi update:",
    JSON.stringify(discountUpdate.value, null, 2)
  );

  if (!discountUpdate.value) {
    toast.error("Dữ liệu giảm giá không hợp lệ!");
    return;
  }

  const { id, ...discountData } = discountUpdate.value;

  // Kiểm tra các trường không được null, rỗng hoặc không hợp lệ
  if (
    !discountData.code.trim() ||
    discountData.percentage == null ||
    discountData.quantity == null ||
    !discountData.validFrom ||
    !discountData.validTo ||
    !discountData.createAt
  ) {
    toast.error("Vui lòng nhập đầy đủ thông tin giảm giá!");
    return;
  }

  // Kiểm tra quantity phải là số nguyên >= 1
  if (!Number.isInteger(discountData.quantity) || discountData.quantity < 1) {
    toast.error("Số lượng phải là số nguyên và lớn hơn hoặc bằng 1!");
    return;
  }

  // Kiểm tra percentage phải là số và >= 5
  if (
    typeof discountData.percentage !== "number" ||
    discountData.percentage < 5
  ) {
    toast.error("Phần trăm giảm giá phải là số và lớn hơn hoặc bằng 5!");
    return;
  }

  const createDate = new Date(discountData.createAt);
  const validFromDate = new Date(discountData.validFrom);
  const validToDate = new Date(discountData.validTo);

  // Kiểm tra ngày áp dụng phải sau hoặc bằng ngày tạo
  if (validFromDate < createDate) {
    toast.error(
      `Ngày áp dụng (${discountData.validFrom}) phải sau hoặc bằng ngày tạo (${discountData.createAt})!`
    );
    return;
  }

  // Kiểm tra ngày hết hạn phải sau ngày áp dụng
  if (validToDate <= validFromDate) {
    toast.error(
      `Ngày hết hạn (${discountData.validTo}) phải sau ngày áp dụng (${discountData.validFrom})!`
    );
    return;
  }

  Swal.fire({
    title: "Bạn có chắc muốn sửa không?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Có",
    cancelButtonText: "Không",
  }).then(async (result) => {
    // Cần async ở đây vì có await bên trong
    if (result.isConfirmed) {
      try {
        const response = await axios.put(
          "http://localhost:8080/discounts/update",
          discountUpdate.value
        );

        toast.success("Sửa mã giảm giá thành công!");
        console.log("Sửa mã giảm giá thành công:", response.data);

        resetDicountUpdate();
        resetDiscount();
        getDiscounts();
        isShow.value = true;
      } catch (error) {
        console.error("Lỗi khi thêm sửa mã giá:", error);
        toast.error("Đã xảy ra lỗi khi sửa mã giảm giá!");
      }
    }
  });
};

const deleteDiscount = async (id) => {
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
        await axios.delete(`http://localhost:8080/discounts/delete/${id}`);
        toast.success("Xóa thành công!");
        getDiscounts(); // Load lại danh sách sau khi xóa
      } catch (error) {
        console.error("Lỗi khi xóa giảm giá:", error);
        toast.error("Xóa thất bại!");
      }
    }
  });
};

// Gọi API khi component được render
onMounted(getDiscounts);
</script>

<style scoped>
/* Ẩn nút ban đầu nhưng vẫn chiếm không gian */
tbody tr .action-buttons {
  opacity: 0;
  transform: scale(0.9);
  transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out;
}

/* Khi hover vào hàng, hiện nút ra */
tbody tr:hover .action-buttons {
  opacity: 1;
  transform: scale(1);
}
tbody tr .action-buttons button {
  margin-right: 2px; /* Tạo khoảng cách giữa các nút */
}
</style>
