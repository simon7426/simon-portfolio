<template>
    <section id="Codeforces">
        <AnimateOnVisible name="fadeRight" >
            <div id="codeforces">
                <div class="card mb-3" style="max-width: 720px; height: 250px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                            <a :href="profileLink"><img src="../assets/img/logo/codeforces.png" class="card-img" alt="Codeforces"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <h6 class="card-title card-subtitle">{{ maxRank }}</h6>
                                <hr />
                                <p class="card-text">Max Rating: {{ maxRating }}</p>
                                <p class="card-text">Total Solved: {{ solveCnt }}</p>
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
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
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
</style>