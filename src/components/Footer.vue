<template>
  <footer class="footer">
    <div>
        <font-awesome-icon class="copyright-icon" icon="copyright"/> 
        2022 {{ name }} 
    </div>
    <SocialBar :links="links"/>
  </footer>
</template>

<script>
import data from "../data/data.json";
import SocialBar from './SocialBar'
export default {
  name: 'Footer',
  props: {},
  components: {
    SocialBar,
  },
  data() {
    return {
      name: data.main.name.first + ' ' + data.main.name.last,
      links: data.links,
    }
  }
}
</script>

<style scoped lang="scss">
  @import '@/styles/constants.scss';

  $bg-footer: map-get($colors, primary) !default;

  .footer {
    padding: 10px 20px 10px 20px;
    background-color: $bg-footer;
    color: map-get($colors, light);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .copyright-icon{
      font-size: 1.5rem;
      vertical-align: middle;
  }

  .social-wrap {
    float: right;
    .icon {
      font-size: 2.8rem;
      &:hover {
        color: map-get($colors, light);
      }
    }
  }

  li{
      margin-bottom: 0 !important;
  }

</style>