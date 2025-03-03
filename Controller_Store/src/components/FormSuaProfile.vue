<template>
  <div class="container">
    <h3 class="text-center">Sửa thông tin</h3>

    <form class="text-center">
      <div class="form-floating">
        <textarea
          v-model="newProfile.name"
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea"
        ></textarea>
        <label for="floatingTextarea">Name</label>
      </div>
      <div class="form-floating">
        <textarea
          v-model="newProfile.email"
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea"
        ></textarea>
        <label for="floatingTextarea">email</label>
      </div>

      <div class="form-floating">
        <input
          type="date"
          v-model="newProfile.ngaySinh"
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea"
        />
        <label for="floatingTextarea">Ngày sinh</label>
      </div>
      <div class="form-floating">
        <textarea 
          v-model="newProfile.sdt"
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea"
        ></textarea>
        <label for="floatingTextarea">Số điện thoại</label>
      </div>
      <div class="form-floating">
        <textarea
          readonly
          v-model="newProfile.quyen"
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea"
        ></textarea>
        <label for="floatingTextarea">Role</label>
      </div>
    </form>
  </div>
</template>
<script setup>
defineModel("newProfile", {
  default: () => ({
    id: 0,
    name: "",
    email: "",
    ngaySinh: "",
    sdt: "",
    quyen: "user",
  }),
});
</script>
