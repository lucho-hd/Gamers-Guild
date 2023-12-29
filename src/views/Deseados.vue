
<script>

import mostrarNotificaciones from "../components/mostrarNotificaciones.vue";

export default {
  name: "Favoritos-Pag",

  components: {
    mostrarNotificaciones
  },

  data() {
    return {
      local: [],
      mostrarNotificacion: false,
      tipo: "",
      mensaje: "",
    }
  },

  mounted: function () {
    this.ver_data();
  },

  methods: {
    ver_data: function () {
      if (localStorage.formulario) {
        this.local = JSON.parse(localStorage.getItem("formulario"))
      }
    },

    eliminarJuego(juego) {
      const index = this.local.indexOf(juego);

      if (index !== -1) {
        this.local.splice(index, 1);
        localStorage.setItem("formulario", JSON.stringify(this.local));
      }

      this.mostrarNotificacion = true;
      this.tipo = "success";
      this.mensaje = `${juego.titulo} fue eliminado correctamente.`;
    },

    clearAlert() {
      this.mostrarNotificacion = false; 
      this.tipo = "";
      this.mensaje = ""
    }
  }
};
</script>

<template>
  <section>
    <mostrarNotificaciones 
      :mostrarNotificacion="mostrarNotificacion" 
      :tipo="tipo" 
      :mensaje="mensaje" 
      @close="clearAlert" 
      class="container"
    />
    <div class="d-flex borde">
      <router-link to="/formulario" class="me-3 mt-4">
        <i class="bi-arrow-left-circle fs-1"></i>
      </router-link>
      <h2 class="fs-1 my-5"><i class="bi bi-heart-fill"></i> Lista de Deseados</h2>
    </div>
    <v-container>
      <template v-if="local.length === 0">
        <p>Todavía no has agregado ningún juego a tu lista de deseados.</p>
      </template>
      <template v-else>
        <v-row v-for="juego in local" :key="juego.fecha">
          <v-col sm="6" md>
            <v-card elevation="10" outlined class="center d-flex p-12">
              <v-img :src="juego.imagen" :alt="juego.titulo" max-height="300px" max-width="400px"></v-img>
              <v-card-title primary-title>
                <div>
                  <h2 class="my-1 titulo">{{ juego.titulo }}</h2>
                  <p class="my-5">Comentario: {{ juego.comentario }}</p>
                  <p class="my-5">Fecha de lanzamiento: {{ juego.lanzamiento }}</p>
                  <p>Disponible para: <span class="normal badge bg-dark mx-1" v-for="plataforma in juego.seleccionado" :key="plataforma"> {{ plataforma }} </span></p>
                  <v-btn class="d-grid text-white" rounded elevation="2" color="red" @click="eliminarJuego(juego)" ><i class="bi bi-trash-fill"></i>
                    Eliminar
                  </v-btn>
                </div>
              </v-card-title>
            </v-card>
          </v-col>
        </v-row>
      </template>
    </v-container>
  </section>
</template>

