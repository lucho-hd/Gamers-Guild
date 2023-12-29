<script>
// Medios de pago
import amex from '../../assets/medios-de-pago/amex.png';
import banelco from '../../assets/medios-de-pago/banelco.png';
import cabal from '../../assets/medios-de-pago/cabal.png';
import mastercard from '../../assets/medios-de-pago/mastercard.png';
import mercadopago from '../../assets/medios-de-pago/mercadopago.png';
import pagofacil from '../../assets/medios-de-pago/pagofacil.png';
import rapipago from '../../assets/medios-de-pago/rapipago.png';
import naranja from '../../assets/medios-de-pago/tarjeta-naranja.png';
import visa from '../../assets/medios-de-pago/visa.png';

export default {
    data: () => ({
        iconos: [ 
            {
                nombre:"mdi-youtube", 
                link: "https://www.youtube.com/", 
            },
            {
                nombre: "mdi-twitter", 
                link: "https://twitter.com/home"
            },
            {
                nombre: "mdi-instagram" ,
                link:  "https://www.instagram.com/",
            },
            {
                nombre: "mdi-twitch",
                link: "https://www.twitch.tv/",
            },
        ],
        
        tarjetas: [amex, banelco, cabal, mastercard, mercadopago, pagofacil, rapipago, naranja, visa],
    })
}
</script>


<template>
    <v-footer dark padless class="mt-5">
        <v-card flat tile class="black white--text pt-12 pb-12 px-5 align-center justify-content-center" width="100%">
            <v-row>
                <v-col lg="3" md="6" sm="12" xs="12">
                    <v-card-text class="white--text pt-0">
                        <h4>Gamers Guild</h4>
                    </v-card-text>
                    <v-card-text class="grey--text pt-0">
                        Tienda de juegos para PS4 y PS5 con excelente
                        servicio al cliente. Precios bajos y gran variedad de
                        productos disponibles.
                    </v-card-text>
                    <v-card-text class="footerNav">
                        <ul>
                            <li class="nav-item"><i class="bi-geo-alt text-white"></i> Av. Cabildo 2280, Local 30, Galería Río de la Plata, CABA</li>
                            <li class="nav-item"><i class="bi-envelope text-white"></i> info@GG.com.ar</li>
                            <li class="nav-item"><i class="bi-whatsapp text-white"></i> +5491137882409</li>
                            <li class="nav-item"><i class="bi-clock"></i> Lunes a Sábados de 11:30 a 19:30</li>
                        </ul>
                    </v-card-text>
                </v-col>

                <v-col lg="3" md="6" sm="12" xs="12" class="footerNav">
                    <h4>Ayuda</h4>
                    <ul class="pt-3">
                        <li class="nav-item"> <a class="nav-link" href="#">Estado del pedido</a></li>
                        <li class="nav-item"> <a class="nav-link" href="#">Contáctanos</a></li>
                    </ul>
                </v-col>

                <v-col lg="3" md="6" sm="12" xs="12">
                    <h4> Síguenos en nuestras redes </h4>
                    <v-card-text class="pt-0 d-flex">
                        <v-btn v-for="icono in iconos" :key="icono.nombre" class="mx-1 white--text" icon>
                            <a :href="icono.link" target="_blank" class="text-white">
                                <v-icon size="24px" v-bind="icono.link">
                                    {{ icono.nombre }}
                                </v-icon>
                            </a>
                        </v-btn>
                    </v-card-text>
                </v-col>

                <v-col lg="3" md="6" sm="12" xs="12">
                    <v-card-text class="mx-1 white--text pt-0">
                        <h4> Medios de Pago </h4>
                        <v-toolbar flat color="transparent">
                            <div class="mx-1" v-for="tarjeta in tarjetas" :key="tarjeta">
                                <img :src="tarjeta" alt="Medios de pago">
                            </div>
                        </v-toolbar>
                    </v-card-text>
                </v-col>
            </v-row>
        </v-card>

        <div class="copy container-fluid">
            <p class="pt-3 mt-3">&copy; Gamers Guild 2023 | Todos los derechos reservados</p>
        </div>
    </v-footer>
</template>