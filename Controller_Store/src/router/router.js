import { createWebHistory, createRouter } from "vue-router";
import Controllers from "@/page/view/Controllers.vue";
import Discount from "@/page/view/Discount.vue";
import GioHang from "@/page/view/GioHang.vue";
import NitendoController from "@/page/view/NitendoController.vue";
import PsController from "@/page/view/PsController.vue";
import Whisthlist from "@/page/view/Whisthlist.vue";
import XboxController from "@/page/view/XboxController.vue";
import DiscountAdmin from "@/page/viewAdmin/DiscountAdmin.vue";
import DonHangAdmin from "@/page/viewAdmin/DonHangAdmin.vue";
import HoaDonAdmin from "@/page/viewAdmin/HoaDonAdmin.vue";
import ProductAdmin from "@/page/viewAdmin/ProductAdmin.vue";
import UserAdmin from "@/page/viewAdmin/UserAdmin.vue";

const routes = [
  { path: "/", redirect: "/home" }, // Chuyển hướng mặc định
  { path: "/home", name: "home", component: Controllers },
  { path: "/xbox", name: "xbox", component: XboxController },
  { path: "/ps", name: "ps", component: PsController },
  { path: "/discount", name: "discount", component: Discount },
  { path: "/gioHang", name: "gioHang", component: GioHang },
  { path: "/whishlist", name: "whishlist", component: Whisthlist },
  {
    path: "/nitendoController",
    name: "nitendoController",
    component: NitendoController,
  },
  { path: "/userAdmin", name: "userAdmin", component: UserAdmin },
  { path: "/productAdmin", name: "productAdmin", component: ProductAdmin },
  { path: "/hoaDonAdmin", name: "hoaDonAdmin", component: HoaDonAdmin },
  { path: "/donHangAdmin", name: "donHangAdmin", component: DonHangAdmin },
  { path: "/discountAdmin", name: "discountAdmin", component: DiscountAdmin },
  { path: "/:pathMatch(.*)*", redirect: "/home" },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
