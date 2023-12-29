<script>
export default {
  data() {
    return {
      productosCarrito: [],

      errores: {
        nombre: '',
        apellido: '',
        celular: '',
        email: '',
        dni: '',
      },

      form_data: {
        nombre: '',
        apellido: '',
        celular: '',
        email: '',
        dni: '',
      },

      enviando: false,
    };
  },

  computed: {
    total() {
      return this.productosCarrito.reduce((total, producto) => total + parseFloat(producto.precioTotal), 0);
    },
  },

  created() {
    const carritoLocal = localStorage.getItem("carrito");
    if (carritoLocal) {
      this.productosCarrito = JSON.parse(carritoLocal);
    }
  },

  methods: {
    validarEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    },

    enviar(form_data) {
      this.errores = {};

      if (form_data.nombre == '') {
        this.errores.nombre = 'El campo "Nombre" es obligatorio';
      } else if (form_data.nombre.length < 4) {
        this.errores.nombre = 'El campo "Nombre" debe tener al menos 4 caracteres';
      }

      if (form_data.apellido == '') {
        this.errores.apellido = 'El campo "Apellido" es obligatorio';
      } else if (form_data.apellido.length < 4) {
        this.errores.apellido = 'El campo "Apellido" debe tener al menos 4 caracteres';
      }

      if (form_data.celular == '') {
        this.errores.celular = 'El campo "Celular" es obligatorio';
      } else if (form_data.celular.length !== 10) {
        this.errores.celular = 'El campo "Celular" debe estar formado por 10 dígitos';
      }

      if (form_data.email == '') {
        this.errores.email = 'El campo "Email" es obligatorio';
      } else if (!this.validarEmail(form_data.email)) {
        this.errores.email = 'Por favor ingresá un email válido';
      }

      if (form_data.dni == '') {
        this.errores.dni = 'El campo "DNI" es obligatorio';
      } else if (form_data.dni.length !== 8) {
        this.errores.dni = 'El campo "DNI" debe estar formado por 8 dígitos';
      }

      if (Object.keys(this.errores).length === 0) {
        this.enviando = true;

        setTimeout(() => {
          this.enviando = false; 
          this.$router.push("/compra-exitosa");
          
          this.productosCarrito = [];
          localStorage.removeItem('carrito');
        }, 3000);
      }
    },
  },
};
</script>


<template>
    <section class="container-fluid">
      <div class="d-flex">
        <router-link to="/" class="mt-5 fs-2 me-3"><i class="bi-arrow-left-circle"></i></router-link>
        <h2 class="fs-1 my-5">Resumen de compra</h2>
      </div>
        <div class="row gap-5 mx-5">
            <div class="col-md-5 bg-white rounded border p-3 mt-5">
                <h3 class="my-5">Tus Datos</h3>
                <form action="#" method="post" class="row">
                    <div class="col-md-6 mt-3">
                        <label for="nombre" class="form-label required">Nombre</label>
                        <input 
                            type="text"
                            id="nombre"
                            name="nombre"
                            class="form-control"
                            v-model="form_data.nombre"
                        >
                        <p class="error-message">{{ errores.nombre }}</p>
                    </div>
                    <div class="col-md-6 col-12 mt-3">
                        <label for="apellido" class="form-label required">Apellido</label>
                        <input 
                            type="text"
                            id="apellido"
                            name="apellido"
                            class="form-control"
                            v-model="form_data.apellido"
                        >
                        <p class="error-message">{{ errores.apellido }}</p>
                    </div>
                    <div class="col-md-6 col-12 mt-3">
                        <label for="celular" class="form-label required">Celular</label>
                        <input 
                            type="number"
                            id="celular"
                            name="celular"
                            class="form-control"
                            v-model="form_data.celular"
                        >
                        <p class="error-message">{{ errores.celular }}</p>
                    </div>
                    <div class="col-md-6 col-12 mt-3">
                        <label for="email" class="form-label required">Email</label>
                        <input 
                            type="email"
                            id="email"
                            name="email"
                            class="form-control"
                            v-model="form_data.email"
                        >
                        <p class="error-message">{{ errores.email }}</p>
                    </div>
                    <div class="col-12 mt-3">
                        <label for="dni" class="form-label required">DNI</label>
                        <input 
                            type="number"
                            id="dni"
                            name="dni"
                            class="form-control"
                            v-model="form_data.dni"
                        >
                        <p class="error-message">{{ errores.dni }}</p>
                    </div>
             
                    <div class="col-12 mt-3">
                        <label for="aclaracion" class="form-label">Aclaración del pedido/envio (opcional)</label>
                        <textarea 
                            name="aclaracion" 
                            id="aclaracion" 
                            class="form-control"
                            rows="3"
                            cols="12"
                            ></textarea>
                    </div>
                </form>
            </div>
            <div class="col-md-5 bg-white border p-3 rounded mt-5">
                <h3 class="my-5">Tu pedido</h3>
                <table class="tabla-checkout mb-2">
                    <thead class="border-bottom">
                        <th class="pb-3">Producto</th>
                        <th class="pb-3">Cantidad</th>
                        <th class="pb-3">Total</th>
                    </thead>
                    <tbody class="tabla-checkout-productos" v-for="producto in productosCarrito" :key="producto.id">
                        <tr>
                            <td>{{ producto.titulo }}</td>
                            <td>{{ producto.cantidad }}</td>
                            <td>${{ producto.precio }}</td>
                        </tr>
                    </tbody>
                    <tbody class="border-top">
                        <tr>
                            <th class="pt-5">Subtotal</th>
                            <td></td>
                            <td>${{ total }}</td>
                        </tr>
                    </tbody>
                    <tfoot class="border-bottom">
                        <tr>
                            <th class="fs-5 pt-5 pb-5">Total</th>
                            <td></td>
                            <td class="pt-5 fs-3 pb-5">${{ total }}</td>
                        </tr>
                    </tfoot>
                </table>

                <h4 class="my-5 fs-5">Forma de pago</h4>

                <div class="mt-3">
                    <ul class="efectivo my-3 py-3 border">
                        <li class="form-check my-1">
                            <input type="radio" id="efectivo" class="form-check-input" checked>
                            <label for="efectivo" class="form-check-label">Efectivo</label>
                        </li>
                        <p class="mp-text">Únicamente válido para retirar en la sucursal.</p>
                    </ul>
                </div>

                <div class="metodo-de-envio">
                    <h4 class="fs-5 my-5">Método de envio</h4>
                    <div class="mt-3">
                        <ul class="envio my-3 py-3 border">
                            <li class="form-check my-1">
                                <input type="radio" id="sucursal" class="form-check-input" checked>
                                <label for="sucursal" class="form-check-label">Retiro en sucursal</label>
                            </li>
                            <p class="mp-text">Se puede retirar una vez recibida la confirmación de que los productos están en la sucursal, por lo general notificamos dentro de las 24 hs. de realizada la compra.</p>
                        </ul>
                    </div>
                </div>

                <div class="d-grid mb-2"> 
                    <button type="button" class="btn btn-primary text-white" @click="enviar(form_data)" :disabled="enviando">
                      <div v-if="enviando" class="d-flex justify-content-center">
                        <span class="spinner-border spinner-border-sm mt-1" role="status" aria-hidden="true"></span>
                        <span class="ms-2">Procesando pedido</span>
                      </div>
                      <span v-else>Confimar pedido</span>
                    </button>
                </div>
            </div>
        </div>
    </section>
</template>