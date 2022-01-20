<template>
  <div>
    <h3>{{ contact.name }}</h3>
    <div class="data"><strong>E-mail:</strong> {{ contact.email }}</div>
    <div class="data"><strong>Phone:</strong> {{ contact.phone }}</div>
    <div class="data"><strong>City:</strong> {{ contact.city }}</div>
    <div class="data"><strong>Languages:</strong> {{ contact.languages }}</div>
    <SocialBar :links="links"/>
    <div class="button" v-on:click="resumeClick">Resume</div>
  </div>
</template>

<script>
import SocialBar from './SocialBar.vue'

export default {
    name: 'PersonnalCard',
    props: ['contact', 'links'],
    components: {
        SocialBar,
    },
    methods: {
      resumeClick() {
        window.open(this.links.resume, "_blank");
      }
    }
}
</script>

<style scoped lang="scss">
    @import '@/styles/constants.scss';

    .data {
      margin-bottom: 15px;
    }
    .button {
      width: 15rem;
      background-color: #3c6e71;
      border: none;
      color: white;
      padding: 1rem 1rem;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      border-radius: 1rem;
      font-size: 1.25rem;
      transition-duration: 0.4s;
    }
    .button:hover {
      background-color: map-get($colors, light); /* Green */
      color: black;
      cursor: pointer;
      box-shadow: 0 1rem 1rem 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    }
    .button:active {
      background-color: map-get($colors, light);
      box-shadow: 0 .5rem #666;
      transform: translateY(.25rem);
    }
</style>