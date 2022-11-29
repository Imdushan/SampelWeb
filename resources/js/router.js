import Vue from "vue";
import Router from "vue-router";

import Login from './components/Login'
import DashboardMain from "./components/DashboardMain.vue";

const routes = [
    {
        path: "/",
        component: Login
    },



    { path: '/as/dashboard', component: DashboardMain, name: 'DashboardMain'},
    { path: '/as/submenu-list', component: DashboardMain, name: 'SUBMenuList'},
    { path: '/as/submenu-list2', component: DashboardMain, name: 'SUBMenuList2'},


];

Vue.use(Router);

export default new Router({
    state: {
        userIsAuthorized: true,
    },
    mode: "history",
    routes
});
