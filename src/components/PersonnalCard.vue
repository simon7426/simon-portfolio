<template>
  <div>
    <h3>{{ contact.name }}</h3>
    <div class="data"><strong>E-mail:</strong> {{ contact.email }}</div>
    <div class="data"><strong>Phone:</strong> {{ contact.phone }}</div>
    <div class="data"><strong>City:</strong> {{ contact.city }}</div>
    <div class="data"><strong>Languages:</strong> {{ contact.languages }}</div>
    <SocialBar :links="links"/>
  </div>
</template>

<script>
import SocialBar from './SocialBar.vue'

export default {
    name: 'PersonnalCard',
    props: ['contact', 'links'],
    components: {
        SocialBar,
    }
}
</script>

<style scoped lang="scss">
    @import '@/styles/constants.scss';

    .data {
        margin-bottom: 15px;
    }
</style>