<script>

// Componentes
import CarouselImg from '../components/CarouselImg.vue';
import mostrarNotificaciones from "../components/mostrarNotificaciones.vue";

export default {
  name: 'Inicio-pag',

  components: {
    CarouselImg,
    mostrarNotificaciones,
  },

  data() {
    return {
      carrito: [],
      juegos: [],
      mostrarNotificacion: false,
      tipo: "",
      mensaje: "",
      total: 0,
    }
  },

  methods: {
    /**
     * Añade un producto al carrito de compras.
     * @param {*} juego 
     */
    agregarAlCarrito(juego) {
      const index = this.carrito.findIndex(producto => producto.id === juego.id);

      if(index !== -1) {
        this.carrito[index].cantidad +=1;
        this.carrito[index].precioTotal += juego.precio;
      }else {
        juego.cantidad = 1;
        juego.precioTotal = juego.precio;
        this.carrito.push(juego);
      }

      localStorage.setItem('carrito', JSON.stringify(this.carrito));

      this.actualizarCantidadProductos();

      this.mostrarNotificacion = true;
      this.tipo = "success";
      this.mensaje = `${juego.titulo} fue añadido al carrito exitosamente.`; 
    },

    actualizarCantidadProductos() {
      this.cantidadProductos = this.carrito.reduce((total, juego) => total + juego.cantidad, 0);
    },
    
    /**
     * Guarda un producto en localStorage.
     */
    creado() {
      const carrito = localStorage.getItem('carrito');
      this.carrito = carrito ? JSON.parse(carrito) : [];
      this.actualizarCantidadProductos();
    },
    
    /**
     * Notificaciones de éxito o error para el usuario.
     */
    clearAlert() {
      this.mostrarNotificacion = false;
      this.tipo = "";
      this.mensaje = "";
    },

    getRutaImg(img) {
      return `https://gamersguild.000webhostapp.com/api/${img}`;
    }

  },

  mounted() {
    fetch("https://gamersguild.000webhostapp.com/api/traerTodos.php")
  
    .then(response => response.json())
          .then(response => {
            this.juegos = response;
            console.log(typeof response)
            
          localStorage.setItem("dato",JSON.stringify(this.juegos))
         
          })
          .catch( err => console.error(err),
            this.juegos = JSON.parse(localStorage.getItem("dato"))  
            )

    this.creado();
  }
};
</script>

<template>
  <div class="container-fluid">
    <mostrarNotificaciones 
      :mostrarNotificacion="mostrarNotificacion" 
      :tipo="tipo" 
      :mensaje="mensaje" 
      @close="clearAlert" 
      class="container"
    />
    <CarouselImg/>

    <section class="container-fluid beneficios">
      <div class="row">
        <div class="col-md-4 col-12">
          <div class="d-flex align-items-center justify-content-center">
            <i class="bi bi-currency-dollar fs-1 me-5"></i>
            <div>
              <p class="mb-0 text-red pt-5">Descuento del 20%</p>
              <p class="text-white text-center">Por transferencia</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-12">
          <div class="d-flex align-items-center justify-content-center">
            <i class="bi-credit-card fs-1 me-5"></i>
            <div>
              <p class="mb-0 text-red pt-5">Hasta 12 cuotas sin interés</p>
              <p class="text-white text-center">Con tarjetas de crédito</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-12">
          <div class="d-flex align-items-center justify-content-center">
            <i class="bi-truck fs-1 me-5"></i>
            <div>
              <p class="mb-0 text-red pt-5">Enviamos tu compra</p>
              <p class="text-white text-center">Entregas a todo el país</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="container-fluid mt-5">
      <div class="row text-center">
        <article class="col-md-4 col-12">
          <img src="../assets/img/juegosFisicos.jpg" alt="Juegos Físicos" class="img-fluid">
        </article>
        <article class="col-md-4 col-12">
          <img src="../assets/img/juegosDigitales.jpg" alt="Juegos Digitales" class="img-fluid">
        </article>
        <article class="col-md-4 col-12">
          <img src="../assets/img/psnPlus.jpg" alt="Psn Plus" class="img-fluid">
        </article>
      </div>
    </section>

    <section class="destacados-container">
      <h2 class="destacados-titulo borde">
        <i class="bi bi-star-fill"></i> Destacados
      </h2>
      <v-row>
        <v-col lg="4" md="6" sm="12" v-for="juego in juegos" :key="juego.id">
          <v-card elevation="10" outlined class="center" height="auto">
            <v-img :src="getRutaImg(juego.img)" :alt="juego.alt" :height="450" aspect-ratio="16/9"></v-img>
            <v-card-title primary-title>
              <div>
                <h3 class="headline display-1">{{ juego.titulo }}</h3>
                <div class="mt-3">
                  <span :class="[juego.estado === 'Disponible' ? 'disponible' : 'stock-bajo']">{{ juego.estado }}</span>
                  <p>${{ juego.precio }}</p>
                  <p class="rojo"><i class="bi bi-credit-card-fill"></i> 12 cuotas sin interés de ${{ juego.precioCuotas }}</p>
                  <v-btn rouded elevation="2" color="primary" @click="agregarAlCarrito(juego)">
                    <i class="bi bi-cart-fill"></i> Agregar
                  </v-btn>
                </div>
              </div>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </section>

    <section>
      <img src="../assets/img/1-slide-1689699888110-6672219145-834c95efe5cd903442e7d05b5c2c97a91689699890-1920-1920.jpg" alt="FC 24" class="img-fluid w-100">
    </section>

    <section class="informacion container-fluid">
      <div class="row justify-content-center">
        <router-link to="#" class="col-md-4 col-12 text-dark text-decoration-none">
          <article class="d-flex flex-column p-4">
            <div class="text-center">
              <i class="bi-truck text-dark fs-1 "></i>
            </div>
            <div class="d-flex flex-column">
              <span class="text-center fw-bold">Realizamos envíos</span>
              <small class="text-center">Conocé nuestros medios de envios disponibles</small>
            </div>
          </article>
        </router-link>
        
        <router-link to="#" class="col-md-4 col-12 text-dark text-decoration-none">
          <article class="d-flex flex-column p-4">
            <div class="text-center">
              <i class="bi-credit-card-2-front fs-1"></i>
            </div>
            <div class="d-flex flex-column">
              <span class="text-center fw-bold">Pagá tus compras aquí</span>
              <small class="text-center">Conocé todos los medios de pagos disponibles</small>
            </div>
          </article>
        </router-link>

        <router-link to="#" class="col-md-4 col-12 text-dark text-decoration-none">
          <article class="d-flex flex-column p-4">
            <div class="text-center">
              <i class="bi-telephone text-dark fs-1 "></i>
            </div>
            <div class="d-flex flex-column">
              <span class="text-center fw-bold">Soporte</span>
              <small class="text-center">Comunicate con nosotros</small>
            </div>
          </article>
        </router-link>
      </div>
    </section>
  </div>
</template>

