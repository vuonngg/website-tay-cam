<template>
  <div class="container">
    <div class="form-floating">
      <textarea
        required
        v-model="baiViet.name"
        readonly
        class="form-control"
        placeholder="Leave a comment here"
        id="floatingTextarea"
      ></textarea>
      <label for="floatingTextarea"><b>Name</b></label>
    </div>
    <br />
    <div class="form-floating">
      <textarea
        required
        style="height: 100px"
        v-model="baiViet.title"
        class="form-control"
        placeholder="Leave a comment here"
        id="floatingTextarea"
      ></textarea>
      <label for="floatingTextarea">Tiêu đề</label>
    </div>
    <div class="form-floating">
      <textarea
        required
        style="height: 200px"
        v-model="baiViet.content"
        class="form-control"
        placeholder="Leave a comment here"
        id="floatingTextarea"
      ></textarea>
      <label for="floatingTextarea">Nội dung</label>
    </div>
    <br />
    <div class="form-floating">
      <textarea
        v-model="baiViet.date"
        readonly
        class="form-control"
        placeholder="Leave a comment here"
        id="floatingTextarea"
      ></textarea>
      <label for="floatingTextarea"><b>Ngày</b></label>
    </div>
  </div>
</template>

<script setup>
defineModel("baiViet", {
  default: () => ({
    id: 0,
    name: "",
    title: "",
    content: "",
    date: "",
  }),
});
</script>
