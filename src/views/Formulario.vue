<script>

import mostrarNotificaciones from '../components/mostrarNotificaciones.vue';

export default {
  name: "Formulario-pag",

  data: function () {
    return {
      mostrarNotificacion: false,
      tipo: "",
      mensaje: "",

      errores: {
        titulo: '',
        comentario: '',
        lanzamiento: '',
        seleccionado: '',
        imagen: '',
      },

      data_form: {
        titulo: "",
        comentario: "",
        lanzamiento: "",
        seleccionado: [],
        imagen: "",
      },
      plataformas: ["Play 4", "Play 5"],
      formulario: [],
    }
  },

  components: {
    mostrarNotificaciones,
},

  methods: {
    readFileInput: function (ev) {
      const file = ev.target.files[0];

      if (file.size < 300000) {

        const fr = new FileReader();
        fr.addEventListener('load', () => {
          this.data_form.imagen = fr.result;
        });
        fr.readAsDataURL(file);
      }
    },

    guardar: function (data_form) {

      //Validaciones de los campos del form

      this.errores = {};

      if (data_form.titulo == '') {
        this.errores.titulo = 'El campo "Título" es obligatorio';
      } else if (data_form.titulo.length > 40) {
        this.errores.titulo = 'El campo "Título" no puede tener más de 40 caracteres';
      }

      if (data_form.lanzamiento == '') {
        this.errores.lanzamiento = 'El campo "Fecha de lanzamiento" es obligatorio';
      }
      
      if (data_form.comentario == '') {
        this.errores.comentario = 'El campo "Comentario" es obligatorio';
      }
      
      if (data_form.seleccionado == '') {
        this.errores.seleccionado = 'El campo "Seleccioná la plataforma" es obligatorio';
      }

      if (data_form.imagen == '') {
        this.errores.imagen = 'Debes de seleccionar una imagen para el juego';
      }

      if (Object.keys(this.errores).length === 0 ) {
        if (!localStorage.formulario) {
          this.formulario = []
        } else {
          this.formulario = JSON.parse(localStorage.getItem("formulario"))
        } 

        this.formulario.push(data_form);
        localStorage.setItem("formulario", JSON.stringify(this.formulario));

        this.mostrarNotificacion = true;
        this.tipo = "success";
        this.mensaje = "El juego se agregó correctamente a la lista de deseados.";

        setTimeout(() => {
          this.$router.push("/Deseados");
        }, 3000); 

        data_form = Object.assign({}, data_form, { fecha: new Date().getTime() })
        console.log(data_form)
      }  
    },

    clearAlert() {
      this.mostrarNotificacion = false
      this.tipo = "";
      this.mensaje = "";
    }
  },
}

</script>

<template>
  <div class="container">
    <mostrarNotificaciones 
      :mostrarNotificacion="mostrarNotificacion" 
      :tipo="tipo" 
      :mensaje="mensaje" 
      @close="clearAlert"
    />

    <div class="d-flex borde">
      <router-link to="/" class="mt-4 me-2 fs-2">
        <i class="bi-arrow-left-circle"></i>
      </router-link>
      <h2 class="display-1 mt-5 mb-1"><i class="bi bi-heart-fill"></i> Agregar a Deseados</h2>
    </div>
    
    <p>En el siguiente formulario cargá el juego que querés que agreguemos a nuestra página.</p>

    <v-form ref="formulario">
      <v-text-field v-model="data_form.titulo" label="Titulo" counter="40"></v-text-field>
      <p class="error-message">{{ errores.titulo }}</p>

      <v-textarea 
        label="Comentario" 
        v-model="data_form.comentario" 
        rows="2" row-height="20"></v-textarea>

      <p class="error-message">{{ errores.comentario }}</p>

      <v-text-field v-model="data_form.lanzamiento" label="Fecha de lanzamiento" type="date">
      </v-text-field>
      <p class="error-message">{{ errores.lanzamiento }}</p>

      <v-select 
        :items="plataformas" 
        label="Seleccioná la plataforma" 
        multiple v-model="data_form.seleccionado">
      </v-select>

      <p class="error-message">{{ errores.seleccionado }}</p>

      <div class="img">
        <label for="imagen">Imagen del Juego</label>
      </div>

      <input 
        id="imagen" 
        @change="readFileInput"
        type="file"
        placeholder="Seleccioná tu imagen"
        >

      <p class="error-message">{{ errores.imagen }}</p>

      <div class="imagen-preview" v-if="data_form.imagen !== ''">
        <img :src="data_form.imagen" class="img-fluid w-25" alt="Preview de la imagen seleccionada">
      </div>

  
      <div class="guardar float-end">
        <v-btn color="primary" @click="guardar(data_form)">
          Guardar
        </v-btn>
      </div>
    </v-form>
  </div>
</template>

