<template>
    <section id="Leetcode">
        <AnimateOnVisible name="fadeRight" >
            <div id="leetcode">
                <div class="card mb-3" style="max-width: 720px; height: 250px;">
                    <div class="row no-gutters">
                        <div class="col-md-4 center">
                        <a :href="profileLink"><img src="../assets/img/logo/Leetcode.png" class="card-img" alt="Leetcode"></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title card-main-title">{{ handle }}</h5>
                                <hr />
                                <p class="card-text">Total Solve: {{ totalSolve }}</p>
                                <p class="card-text easy">Easy: {{ easySolve }}</p>
                                <p class="card-text medium">Medium: {{ midSolve }}</p>
                                <p class="card-text hard">Hard: {{ hardSolve }}</p>
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
        const info_url = 'http://127.0.0.1:8000/user?username='+this.handle;
        
        const resp_info = await axios.get(info_url,config);
        const data = resp_info.data
        this.totalSolve = data['All']['count']
        this.easySolve = data['Easy']['count']
        this.midSolve = data['Medium']['count']
        this.hardSolve = data['Hard']['count']
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
.easy {
    color: green;
}
.medium {
    color: gold;
}
.hard {
    color: red;
}
</style>