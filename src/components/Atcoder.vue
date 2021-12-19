<template>
    <section id="Atcoder">
        <AnimateOnVisible name="fadeRight" >
            <div id="atcoder">
                <div class="card mb-3" style="max-width: 720px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                        <a :href="profileLink"><img src="../assets/img/logo/atcoder.png" class="card-img" alt="Atcoder"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <hr />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm codeforces-box">
                                            <p v-if="currentRating" class="card-top-text">
                                                <number ref="currentRatingAnimation" :to="currentRating" :duration=1 />
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Ratings</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p v-if="maxRating" class="card-top-text">
                                                <number ref="maxRatingAnimation" :to="maxRating" :duration=1 />
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Max Ratings</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p v-if="participated" class="card-top-text">
                                                <number ref="participationAnimation" :to="participated" :duration=1 />
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Rated Contest</p>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AnimateOnVisible>
    </section>
</template>

<script>
import axios from 'axios';
export default {
    name: "Atcoder",
    props: ['handle'],
    components: {
    },
    data() {
        return {
            currentRating: 0,
            maxRating: 0,
            participated: 0,
            profileLink: "https://atcoder.jp/users/"+this.handle
        }
    },
    methods: {
    }
    ,
    async created() {
        let config = {
            headers: {
                'Accept': 'application/json'
            }
        };
        const info_url = 'http://localhost:5000/api/user/atcoder/'+this.handle;
        
        const resp_info = await axios.get(info_url,config);
        const data = resp_info.data
        this.currentRating = data['rating']
        this.maxRating = data['max_rating']
        this.participated = data['participated']
        // if(this.currentRating)
        //     this.$refs.currentRatingAnimation.play();
        // if(this.maxRating)
        //     this.$refs.maxRatingAnimation.play();
        // if(this.participated)
        //     this.$refs.participationAnimation.play();
    }
}
</script>

<style scoped>
#atcoder {
    text-align: left;
}
.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        border-radius: 16px;
}
.card-main-title {
    font-size: 2rem;
    font-weight: 500;
}
.card-subtitle {
    font-size: 1.5rem;
    color: blue;
}

.card-img{
    margin: 0 auto; /* Added */
    padding: 2rem;
    float: none; /* Added */
}
img {
    max-width: 100%;
    max-height: 100%;
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
.easy {
    color: green;
}
.medium {
    color: rgb(251, 140, 0);
}
.hard {
    color: red;
}

.codeforces-box {
    margin: 1rem 1rem;
    border: 1px solid #ccc;
    padding: 2.5rem 1rem;
    border-radius: 16px;
    height: 15rem;
}
.card-bottom-text {
    text-align: center;
    font-size: 1.5rem;
    font-weight: 300;
}
.card-top-text {
    text-align: center;
    font-size: 3.5rem;
    font-weight: 500;
}
</style>