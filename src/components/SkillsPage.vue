<template>
    <section id="skills">
        <div class="section-content">
            <div class="container-fluid">
                <div class="row d-flex flex-wrap align-items-center">
                    <div class="col-md-2 m-auto pb-4" v-for="post  in this.skills[0].skillList" :key="post.name">
                        <AnimateOnVisible name="fadeRight" >
                            <img id="imgLogo" class="img-responsive mx-auto d-block" :src="getImgUrl(post.img)" :alt="post.name"/>
                            <div id="divAlt" class="altCaption text-center">{{post.name}}</div>
                        </AnimateOnVisible>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: 'SkillsPage',
        components: {
        },
        props: ['skills', 'key'],
        methods: {
            getImgUrl(img) {
                return require('../assets/img/logo/'+img);
            },
        },
    }
</script>

<style scoped lang="scss">
    @import '@/styles/constants.scss';

    #skills {
        background-color: lighten(map-get($colors, dark), 100%);
    }

    @media(min-width: #{map-get($breakpoints, medium)}) {
        .section-content {
            width: 80%;
            margin: 0 auto;
        }
    }

    img{
        max-width: 120px;
    }

    .altCaption{
        color: map-get($colors, secondary);
        margin-top: 1rem;
    }

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
        padding: 2rem; }
    section .list-group-item {
        background-color: inherit; }
</style>