<template>
    <section id="Codeforces">
        <AnimateOnVisible name="fadeRight" >
            <div id="codeforces">
                <div class="card mb-3" style="max-width: 720px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                            <a :href="profileLink"><img src="https://s3.brilliant.com.bd/simon_portfolio/img/logo/codeforces.png" class="card-img" alt="Codeforces"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }} (<span class="card-subtitle" v-bind:style="{ color: rankColor }">{{ maxRank }}</span>)</h5>
                                <hr />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm codeforces-box">
                                            <p v-if="maxRating" class="card-top-text">
                                                <number ref="maxRatingAnimation" :to="maxRating" :duration=1 easing="Back.easeOut"/>
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Ratings</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p v-if="solveCnt" class="card-top-text">
                                                <number ref="solveAnimation" :to="solveCnt" :duration=1 easing="Back.easeOut"/>
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Solved</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p v-if="contributions" class="card-top-text">
                                                <number ref="contributionAnimation" :to="contributions" :duration=1 easing="Back.ease"/>
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">
                                                    Contributions
                                                </p>
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
    name: "Codeforces",
    props: ['handle'],
    components: {
    },
    data() {
        return {
            maxRating: 0,
            maxRank: "",
            rankColor: "",
            solveCnt: 0,
            profileLink: "https://codeforces.com/profile/"+this.handle,
            contributions: 0,
        }
    },
    async created() {
        let config = {
            headers: {
                'Accept': 'application/json'
            }
        }
        const codeforces_url = 'http://localhost:8000/api/user/codeforces/' + this.handle;
        const resp_info = await axios.get(codeforces_url,config)
        const data = resp_info.data
        this.maxRating = data['rating']
        this.maxRank = data['rank']
        this.rankColor = data['rank_color']
        this.contributions = data['contribution']
        this.solveCnt = data['solved']
    }
}
</script>

<style scoped>
#codeforces {
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
    font-size: 2rem;
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