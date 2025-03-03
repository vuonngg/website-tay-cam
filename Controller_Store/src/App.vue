<template>
  <div>
    <HeaderLayout />
    <HomeAdmin />
    <br /><br /><br /><br />
    <hr />
    <FooterLayout />
  </div>
</template>

<script setup>
import FooterLayout from "./layout/FooterLayout.vue";
import HeaderLayout from "./layout/HeaderLayout.vue";
import Home from "./page/view/Home.vue";
import HomeAdmin from "./page/viewAdmin/HomeAdmin.vue";
</script>
