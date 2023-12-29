<script>
import OfertaDePlay     from '../assets/img/imgs-carousel/oferta-de-play-4-2x1.jpg';
import OfertasDigitales from '../assets/img/imgs-carousel/ofertas-digitales-playstation.jpg';

  export default {
    data () {
      return {
        items: [
          {
            src: OfertaDePlay,
          },
          {
            src: OfertasDigitales,
          },
        ],
      }
    },
  }
</script>

<template>
  <section class="carousel">
    <v-carousel>
      <v-carousel-item
        v-for="(item,i) in items"
        :key="i"
        :src="item.src"
        cover
        >
      </v-carousel-item>
    </v-carousel>
  </section>
</template>
  
