 <template>
  <div class="social-wrap">
    <ul>
      <li>
        <a :href="links.facebook" target="_blank" alt="facebook" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'facebook-square']" />
        </a>
      </li>
      <li>
        <a :href="links.twitter" target="_blank" alt="twitter" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'twitter-square']" />
        </a>
      </li>
      <li>
        <a :href="links.linkedin" target="_blank" alt="linkedin" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'linkedin']" />
        </a>
      </li>
      <li>
        <a :href="links.reddit" target="_blank" alt="reddit" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'reddit-square']" />
        </a>
      </li>
      <li>
        <a :href="links.github" target="_blank" alt="github" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'github-square']" />
        </a>
      </li>
      <li>
        <a :href="links.github" target="_blank" alt="gitlab" rel="noopener noreferrer">
          <font-awesome-icon class="icon" :icon="['fab', 'gitlab']" />
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
    export default {
        name: 'SocialBar',
        props: ['links'],
    }
</script>

<style scoped lang="scss">
  @import '@/styles/constants.scss';
 .social-wrap {
    li {
      display: inline-block;
      margin-right: 10px;
    }
    .icon {
      font-size: 3rem;
    }
  }
</style>