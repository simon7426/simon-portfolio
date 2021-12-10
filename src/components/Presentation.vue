<template>
  <div class="paragraph">
    <h3>{{summary.title}}</h3>
    <div class="begin">{{summary.para_1}}</div>
    <p>{{summary.para_2}}</p>
  </div>
</template>

<script>
export default {
    name: 'Description',
    props: ['summary']
}
</script>

<style scoped lang="scss">
    @import '@/styles/constants.scss';

    .paragraph {
        color: map-get($colors, primary);
        .begin {
            color: map-get($colors, secondary);
        }
    }
</style>