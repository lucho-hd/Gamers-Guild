<script>
export default {
  props: {
    mostrarNotificacion: {
      type: Boolean,
      required: true,
  },
  tipo: {
    type: String,
    required: true,
  },
  mensaje: {
    type: String,
    required: true,
  },
},
};
</script>

<template>
  <div v-if="mostrarNotificacion" :class="['sticky-top alert alert-dismissible alert-' + tipo]">
    <div class="text-center fs-5" role="alert">
      <p><i class="bi-check-circle-fill"></i> {{ mensaje }}</p>

      <button 
        class="btn-close" 
        type="button" 
        data-bs-dismiss="alert" 
        aria-label="Close" 
        @click="$emit('close')">
      </button>
    </div>
  </div>
</template>