 <template>
  <header class="header parallax">
      <Banner />
  </header>
</template>

<script>
import data from "../data/data.json";
import Banner from "../components/Banner.vue";

export default {
  name: "LandingPage",
  components: {
    Banner,
  },
  props: {},
  data() {
    return {
      user: data.main.name.first +' '+ data.main.name.last,
    };
  },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

.header {
  padding: 20px;
  background-color: map-get($colors, dark);
}

.parallax {
  // background-image: url("../assets/img/bg.jpg");
  background-color: grey;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
}


@media only screen and (max-device-width: 1024px) {
  .parallax {
    background-attachment: scroll;
  }
}
</style>