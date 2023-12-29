 import Vue from 'vue';
import VueRouter from 'vue-router';

// Vistas 
import Inicio      from '../views/Inicio.vue';
import FormResumen from '../views/FormResumen.vue';
import ExitoCompra from '../views/ExitoCompra.vue';
import PagError404 from '../views/PagError404.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/',               name: 'Inicio',      component: Inicio, meta: {title: 'Gamers Guild | Inicio'} },
  { path: '/formulario',     name: 'Formulario',  component: () => import(/* webpackChunkName: "about" */ '../views/Formulario.vue'), meta: {title: 'Gamers Guild | Añadir a deseados'}},
  { path: '/deseados',       name: 'Deseados',    component: () => import(/* webpackChunkName: "about" */ '../views/Deseados.vue'), meta: {title: 'Gamers Guild | Lista de deseados'} },
  { path: '/resumen',        name: 'Resumen',     component: FormResumen, meta: {title: 'Gamers Guild | Resumen de compra', requiresCart: true}},
  { path: '/compra-exitosa', name: 'Exito',       component: ExitoCompra, meta: {title: 'Gamers Guild | Compra exitosa', requiresCart: true}},
  { path: '/:catchAll(.*)',                       component: PagError404, },
];

const router = new VueRouter({
  routes
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title || 'Gamers Guild';
  next();

  // Verifica que haya un producto añadido al carrito, para luego pasar a la vista de "resumen".
  if (to.meta.requiresCart) {
    const carritoLocalStorage = localStorage.getItem('carrito');
    if (!carritoLocalStorage || JSON.parse(carritoLocalStorage).length === 0) {
      next('/');
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;
