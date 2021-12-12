<template>
  <section id="skills" class="light-section">
    <div class="container-fluid">
      <h1 class="section-header">{{ heading }}</h1>

      <!-- start of filters  -->
      <div class="row filters">
        <ul
          class="list-inline mx-auto"
          data-aos="fade-right"
          data-aos-duration="1000"
        >
          <li
            v-for="item in skills"
            :key="item.category"
            class="list-inline-item filter"
          >
            <a
              class="nav-item"
              :class="item.category === currentCategory ? 'active' : null"
              :data-category="item.category"
              @click="setCategory"
              >{{ item.category }}</a
            >
          </li>
        </ul>
      </div>
      <!-- end of filters  -->
      <SkillsPage :skills="filteredSkills" />


      <!-- start of skill container  -->
      <!-- <div
        id="skill-container"
        data-aos="fade-right"
        data-aos-duration="1000"
        v-for="item in filteredSkills"
        :key="item.category"
      >
        <div class="category-heading">
          <h2><i :class="item.faClass"></i> {{ item.category }}</h2>
          <h3 :v-if="item.subtitle !== ''">{{ item.subtitle }}</h3>
        </div> -->

        <!-- <div class="skill-content"> -->
          <!-- start of skill bars  -->
          <!-- <div v-if="item.skillList.length !== 0" class="skillbars">
            <div
              class="skill"
              v-for="skill in item.skillList"
              :key="skill.name"
            >
              <h3 class="skill-name" v-html="skill.name"></h3>
              <div class="outer-bar">
                <div :class="'inner-bar level--' + skill.level"></div>
              </div>
            </div>
          </div> -->
          <!-- end of skill bars  -->
        <!-- </div> -->
      <!-- </div> -->
      <!-- end of skill container  -->
    </div>
    <!-- end of main container  -->
    <!-- <Arrow /> -->
  </section>
</template>

<script>
import data from "../data/data.json";
import SkillsPage from "../components/SkillsPage.vue"
// import Arrow from "../components/Arrow.vue";

export default {
  name: "Skills",
  props: {},
  components: {
    // Arrow,
    SkillsPage
  },
  data() {
    return {
      skills: data.skills.categories,
      heading: data.skills.title,
      currentCategory: data.skills.defaultCategory,
    };
  },
  computed: {
    filteredSkills() {
      var skills = data.skills.categories;
      var category = this.currentCategory;
      var filtered = skills.filter(function(x) {
        if (x.category === category) {
          return x;
        }
      });

      console.log(filtered);

      return filtered;
    },
  },
  methods: {
    setCategory(event) {
      this.currentCategory = event.target.dataset.category;
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
  min-height: 100%;
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

</style>
