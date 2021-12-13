<template>
  <transition name="fade" tag="div" class="wrapper" mode="out-in">
    <div class="wrapper" id="app">
      <LandingPage />
      <Description />
      <Experience />
      <Skills />
      <Projects />
      <problem-solving />
      <Footer />
    </div>
  </transition>
</template>

<script>
import LandingPage from "./components/LandingPage.vue";
import Description from "./components/Description.vue";
import Experience from "./components/Experience.vue";
import Skills from "./components/Skills.vue";
import Projects from "./components/Projects.vue";
import ProblemSolving from "./components/ProblemSolving.vue"
import Footer from "./components/Footer.vue";

export default {
  name: "App",
  components: {
    LandingPage,
    Description,
    Experience,
    Skills,
    Projects,
    ProblemSolving,
    Footer,
  },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

#app {
  font-family: Montserrat-Regular, serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.wrapper {
  height: 100%;
}
</style>
