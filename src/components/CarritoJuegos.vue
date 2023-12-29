<script>
export default {
  data() {
    return {
      carritoLocal: [],
      mostrarCarrito: true,
    };
  },
  computed: {
    total() {
      return this.carritoLocal.reduce((total, producto) => total + parseFloat(producto.precioTotal) , 0);
    },
  },
  mounted() {
    this.obtenerProductos();
  },
  methods: {
    obtenerProductos() {
      const productosLocal = localStorage.getItem("carrito");
      if (productosLocal) {
        this.carritoLocal = JSON.parse(productosLocal);
      }
    },
    eliminarProducto(producto) {
      const index = this.carritoLocal.findIndex((pr) => pr.id === producto.id);
      if (index !== -1) {
        this.carritoLocal.splice(index, 1);
        localStorage.setItem("carrito", JSON.stringify(this.carritoLocal));
      }
    },
    cerrarCarrito() {
      this.mostrarCarrito = false;
    },

    getRutaImg(img) {
      return `https://gamersguild.000webhostapp.com/api/${img}`;
    },
  },
};
</script>

<template>
  <div :class="['carrito-desplegado', mostrarCarrito ? 'mostrar-carrito' : '']">
    <div class="d-flex justify-content-between">
      <h3 class="mt-5 ms-4">Mi carrito</h3>
      <button class="btn-close mt-5" @click="cerrarCarrito"></button>
    </div>
    <template v-if="carritoLocal.length === 0">
      <div class="d-flex flex-column carrito-vacio">
        <p class="text-center">¡Tu carrito está vacío!</p>
        <img src="../assets/img/carrito-vacio.png" alt="Tu carrito está vacío">
      </div>
    </template>
    <template v-else>
      <div class="productos-container">
        <article v-for="producto in carritoLocal" :key="producto.id" class="card mb-3" style="max-width: 540px;">
          <div class="row g-0">
            <div class="col-md-5">
              <img :src="getRutaImg(producto.img)" class="img-fluid rounded-start" :alt="producto.titulo">
            </div>
            <div class="col-md-7">
              <div class="card-body">
                <div class="d-flex justify-content-betwee align-items-center mb-2">
                  <h4 class="card-title fs-5">{{ producto.titulo }}</h4>
                  <button class="btn btn-danger" @click="eliminarProducto(producto)"> <i class="bi-trash-fill"></i></button>
                </div>
                <p class="card-text">{{ producto.cantidad }} x ${{ producto.precio }}</p>
              </div>
            </div>
          </div>
        </article>
      </div>
      <div class="acciones-container d-flex justify-content-center flex-column">
        <div class="d-flex justify-content-between">
          <p>Total</p>
          <p> ${{ total }}</p>
        </div>
        <router-link to="/resumen" class="btn btn-primary text-white">Finalizar compra</router-link>
      </div>
    </template>
  </div>
</template>

