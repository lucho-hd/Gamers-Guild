<script>
import NavBar from './components/layout/NavBar.vue';
import VueFooter from './components/layout/vueFooter.vue'

export default {
   components:{
    NavBar,
    VueFooter
   },
};
</script>

<template>
  <v-app>
    <NavBar/>
    <v-main>
      <v-container fluid>
        <transition mode="out-in" enter-active-class="animate__animated animate__fadeInLeft">
          <router-view></router-view>
        </transition>
      </v-container>
    </v-main>
    <vueFooter/>
 </v-app>
</template>

