<template>
    <section id="Codeforces">
        <AnimateOnVisible name="fadeRight" >
            <div id="codeforces">
                <div class="card mb-3" style="max-width: 720px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                            <a :href="profileLink"><img src="../assets/img/logo/codeforces.png" class="card-img" alt="Codeforces"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <h6 class="card-title card-subtitle">{{ maxRank }}</h6>
                                <hr />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="maxRatingAnimation" :to="maxRating" :duration=1 />
                                            </p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Max Ratings</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="solveAnimation" :to="solveCnt" :duration=1 />
                                            </p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Solved</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="contributionAnimation" :to="contributions" :duration=1 />
                                            </p>
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
            solveCnt: 0,
            status: [],
            profileLink: "https://codeforces.com/profile/"+this.handle,
            contributions: 0,
        }
    },
    methods: {
        formatProblem(problem){
            const contestId = problem.problem.contestId.toString();
            const index = problem.problem.index;
            const name = problem.problem.name;
            const date = problem.creationTimeSeconds;
            return contestId+index+' '+name+' '+ date;
        }
    }
    ,
    async created() {
        let config = {
            headers: {
                'Accept': 'application/json'
            }
        }

        const info_url = 'https://codeforces.com/api/user.info?handles=' + this.handle;
        const status_url = 'https://codeforces.com/api/user.status?handle=' + this.handle;
        const resp_info = await axios.get(info_url,config)
        const info = resp_info.data.result[0]
        this.maxRating = info['maxRating']
        this.maxRank = info['maxRank']
        const resp_status = await axios.get(status_url, config)
        const status = resp_status.data.result
        this.status = status.filter((x)=> {
            if (x.verdict === 'OK'){
                return x
            }
        })
        this.solveCnt = this.status.length
        this.status = this.status.slice(0,11)
        this.$refs.maxRatingAnimation.play();
        this.$refs.solveAnimation.play();
        this.$refs.contributionAnimation.play();
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