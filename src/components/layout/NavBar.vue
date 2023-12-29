<script>
import CarritoJuegos from '../CarritoJuegos.vue';

export default {
  props: {
    carrito: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      cantidadProductos: 0,
      mostrarCarrito: false,
    };
  },
  
  components: {
    CarritoJuegos,
  },

  created() {
    this.cantidadProductos = this.obtenerCantidadProductos();
  },
  methods: {
    obtenerCantidadProductos() {
      const carrito = localStorage.getItem('carrito');
      if (carrito) {
        let cantidad = 0;
        for (const producto of JSON.parse(carrito)) {
          cantidad += producto.cantidad;
        }
        return cantidad;
      } else {
        return 0;
      }
    },
  },
  mounted() {
    this.$root.$on('juego-agregado', (cantidad) => {
      this.cantidadProductos = cantidad;
    });
  },
};
</script>


<template>
    <nav class="navbar navbar-expand-lg sticky-top" id="navbar">
        <div class="container">
               <!-- Botón de nav  -->
               <button 
                class="navbar-toggler" 
                type="button" 
                data-bs-toggle="offcanvas" 
                data-bs-target="#menuLateral">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="logo">
                <router-link to="/" class="navbar-brand text-light fw-bold fs-3">
                    <img src="../../assets/logo/logos.png" alt="Logo de Gamers Guild" class="img-fluid logo" />
                    Gamers Guild
                </router-link>
            </div>

            <section class="offcanvas offcanvas-start" id="menuLateral" tabindex="-1">
                <div class="offcanvas-header" data-bs-theme="white">
                    <h1 class="offcanvas-title fw-bold fs-3 mt-2 text-white">
                        <img src="../../assets/logo/logos.png" alt="Logo de Gamers Guild" class="img-fluid" />
                        Gamers Guild
                    </h1>   
                    <button 
                        class="btn-close mt-1 me-1" 
                        type="button" 
                        aria-label="Close"
                        data-bs-dismiss="offcanvas">
                    </button>
                </div>

                <div class="offcanvas-body d-flex flex-lg-row flex-column justify-content-lg-center">
                    <ul class="navbar-nav fs-5 justify-content-start">
                        <li class="nav-item p-1 py-md-1">
                            <router-link to="/" class="nav-link">Inicio</router-link>
                        </li>
                        <li class="nav-item p-1 py-md-1 borde-top">
                            <i class="bi-hearth-fill"></i> <router-link to="/formulario" class="nav-link">Agregar a deseados</router-link>
                        </li>
                        <li class="nav-item p-1 py-md-1 borde-top">
                            <router-link to="/deseados" class="nav-link">Lista de deseados</router-link>
                        </li>
                    </ul>
                </div>
            </section>
            <div class="d-flex flex-row justify-content-end align-content-center fs-5">
                <ul class="navbar-nav iconos">
                    <li class="nav-item fs-4 position-relative" @click="mostrarCarrito = !mostrarCarrito">
                        <button type="button" class="nav-link" to="#"> 
                            <i class="bi-cart-fill text-white"></i>
                            <span class="badge rounded-pill bg-danger position-absolute top-0 start-100 translate-middle">{{ cantidadProductos }}</span>
                        </button>
                    </li>
                </ul>
                <CarritoJuegos v-if="mostrarCarrito" :carrito="carrito" :total="total" :cantidadProductos="cantidadProductos"/>
            </div>
        </div>
    </nav>
</template>