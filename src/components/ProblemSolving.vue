<template>
  <section id="skills" class="light-section">
    <div class="container-fluid">
      <Title class="title" :title="heading" :description="description" />
      <div class="problemSolveFlex">
        <ul v-for="(site,index) in sites" :key="index" class="problemSolveFlexItem">
          <li>
            <component :is="site.component" :handle="site.handle" />
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
import data from "../data/data.json";
import Codeforces from "../components/Codeforces.vue"
import Leetcode from "../components/Leetcode.vue"
import Title from "../components/Title.vue"
import Atcoder from  "../components/Atcoder.vue"
import Lightoj from "../components/Lightoj.vue"
import SPOJ from "../components/SPOJ.vue"
import Vjudge from "../components/Vjudge.vue"

export default {
  name: "ProblemSolving",
  props: {},
  components: {
    Codeforces,
    Leetcode,
    Atcoder,
    Lightoj,
    SPOJ,
    Vjudge,
    Title
  },
  data() {
    return {
      sites: data.problemSolving.sites,
      heading: data.problemSolving.heading,
      description: data.problemSolving.description,
      currentSite: data.problemSolving.currentSite,
      currentHandle: data.problemSolving.currentHandle,
    };
  },
  computed: {
    filteredSkills() {
      var sites = data.problemSolving.sites;
      var currentSite = this.currentSite;
      var filtered = sites.filter(function(x) {
        if (x.name === currentSite) {
          return x;
        }
      });

      // console.log(filtered);
      return filtered;
    },
    filteredHandle() {
      var sites = data.problemSolving.sites;
      var currentSite = this.currentSite;
      var filtered = sites.filter(function(x) {
        if (x.name === currentSite) {
          return x;
        }
      });

      // console.log(filtered);
      return filtered[0].handle;
    }
  },
  methods: {
    setName(event) {
      // console.log(event);
      this.currentSite = event.target.dataset.category;
    },
  },
};
</script>

<style scoped lang="scss">
.light-section {
  background-color: #f0f0f0;
  color: #222222; }
  .light-section a {
    color: #747474; }

section {
  // min-height: 60%;
  width: 100%;
  background-size: cover;
  text-align: center;
  position: relative;
  padding: 1rem; }
  section .container-fluid {
    padding: 1rem;
    margin: 4rem auto; }
    section .container-fluid .flex-col {
      padding: 1rem; }
  section .list-group-item {
    background-color: inherit; }

.section-header {
  padding-bottom: 1.5rem; }

.filters a {
  cursor: pointer;
  padding: 1.5rem; }

.filters .filter {
  margin: 0 auto;
  padding-bottom: 1.5rem; }

.filters .active {
  text-decoration: underline;
  text-underline-offset: 0.5rem;
  text-decoration-color: #ed2024;
  text-decoration-thickness: 0.375rem;
  color: #ed2024; }

#skills #skill-container {
  margin: 2rem auto;
  padding: 0;
  max-width: 600px; }
  #skills #skill-container .skill-content {
    margin-top: 1rem; }

// .problemSolveFlex {
//   padding: 0 15rem;
//   display: flex;
//   flex-wrap: wrap;
// }
// .problemSolveFlexItem {
//   flex: 50%;
// }

@media screen and (min-width: 1600px) {
  .problemSolveFlex {
    padding: 0 15rem;
  }
}

@media screen and (min-width: 1300px) {
  .problemSolveFlex {
    display: flex;
    flex-wrap: wrap;
  }
  .problemSolveFlexItem {
    flex: 50%;
  }
}

</style>
