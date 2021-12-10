<template>
    <div class="name">
        <div class="wrapper-name">
            <AnimateOnVisible name="fadeDown" ::duration="1">
                <h1 class="display-text">{{ name.first }} {{ name.last }}</h1>
            </AnimateOnVisible>
            <hr />
            <h2 id="typewriter"></h2>
        </div>
    </div>
</template>

<script>
import AnimateOnVisible from "../components/AnimateOnVisible.vue";
import data from "../data/data.json";
import Typewriter from "typewriter-effect/dist/core";

var titles = data.main.titles;

export default {
  name: "Banner",
  components: {
      AnimateOnVisible,
  },
  data() {
    return {
      name: data.main.name,
      titles: data.main.titles,
    };
  },
  mounted: function() {
    new Typewriter("#typewriter", {
      strings: titles,
      autoStart: true,
      loop: true,
      deleteSpeed: 5,
    });
  },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

.name {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  margin: 0 auto;
  z-index: 400;

  .wrapper-name {
    width: 250px;
  }

  h1 {
    font-size: 2.3rem;
    padding: 2px 10px;
    text-align: center;
    text-transform: uppercase;
    color: black;
  }
  h2 {
    font-size: 1.6rem;
    padding: 2px 10px;
    text-align: center;
    text-transform: uppercase;
    color: black;
  }

  p {
    font-size: 1.5rem;
    text-align: center;
    margin: 5px auto;
    color: black;
  }

  hr {
    border: 1px solid whitesmoke;
  }
}

@media (min-width: #{map-get($breakpoints, small)}) {
  .name {
    .wrapper-name {
      width: 55%;
    }
    h1 {
      font-size: 2.8rem;
      padding: 4% 8%;
    }
    p {
      font-size: 2rem;
    }
  }
}
@media (min-width: #{map-get($breakpoints, medium)}) {
  .name {
    .wrapper-name {
      width: 450px;
    }
    h1 {
      font-size: 4rem;
      padding: 4% 10%;
    }
    p {
      font-size: 2.5rem;
    }
  }
}

</style>
