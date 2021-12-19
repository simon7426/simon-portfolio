<template>
    <section id="SPOJ">
        <AnimateOnVisible name="fadeRight" >
            <div id="spoj">
                <div class="card mb-3" style="max-width: 720px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                        <a :href="profileLink"><img src="../assets/img/logo/spoj.jpeg" class="card-img" alt="SPOJ"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <hr />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm codeforces-box">
                                            <p v-if="solved" class="card-top-text">
                                                <number ref="solvedAnimation" :to="solved" :duration=1 />
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Solved</p>
                                            </span>
                                        </div>
                                        <div class="col-sm codeforces-box">
                                            <p v-if="submissions" class="card-top-text">
                                                <number ref="submissionAnimation" :to="submissions" :duration=1 />
                                            </p>
                                            <p v-else class="card-top-text">0</p>
                                            <span class="card-bottom">
                                                <p class="card-bottom-text">Submissions</p>
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
    name: "SPOJ",
    props: ['handle'],
    components: {
    },
    data() {
        return {
            solved: 0,
            submissions: 0,
            profileLink: "https://spoj.com/users/"+this.handle
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
        const info_url = 'https://simonislam.com/api/user/spoj/'+this.handle;
        
        const resp_info = await axios.get(info_url,config);
        const data = resp_info.data
        this.solved = data['solved']
        this.submissions = data['submission']
    }
}
</script>

<style scoped>
#spoj {
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