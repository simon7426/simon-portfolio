<template>
    <section id="Leetcode">
        <AnimateOnVisible name="fadeRight" >
            <div id="leetcode">
                <div class="card mb-3" style="max-width: 720px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                        <a :href="profileLink"><img src="../assets/img/logo/Leetcode.png" class="card-img" alt="Leetcode"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <hr />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="easySolveAnimation" :to="easySolve" :duration=1 />
                                            </p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text easy">Easy</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="mediumSolveAnimation" :to="midSolve" :duration=1 />
                                            </p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text medium">Medium</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p class="card-top-text">
                                                <number ref="hardSolveAnimation" :to="hardSolve" :duration=1 />
                                            </p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text hard">Hard</p>
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
    name: "Leetcode",
    props: ['handle'],
    components: {
    },
    data() {
        return {
            totalSolve: 0,
            easySolve: 0,
            midSolve: 0,
            hardSolve: 0,
            profileLink: "https://leetcode.com/"+this.handle
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
        const info_url = 'http://simonislam.com/api/user?username='+this.handle;
        
        const resp_info = await axios.get(info_url,config);
        const data = resp_info.data
        this.totalSolve = data['All']['count']
        this.easySolve = data['Easy']['count']
        this.midSolve = data['Medium']['count']
        this.hardSolve = data['Hard']['count']
        this.$refs.easySolveAnimation.play();
        this.$refs.mediumSolveAnimation.play();
        this.$refs.hardSolveAnimation.play();
    }
}
</script>

<style scoped>
#leetcode {
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