<template>
    <div class="vue-tempalte" id="div1">
        <form method="post">
            <h3>Sign Up</h3>
 
            <div class="form-group">
                <label>Matricule</label>
                <input type="text" name="Matricule" class="form-control form-control-lg" v-model="info.Matricule"/>
            </div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="Name" class="form-control form-control-lg" v-model="info.Name"/>
            </div>
 
            <div class="form-group">
                <label>Email address</label>
                <input type="email" name="Email" class="form-control form-control-lg" v-model="info.Email"/>
            </div>
 
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="Password" class="form-control form-control-lg" v-model="info.Password"/>
            </div>
 
            <button type="submit" class="btn btn-dark btn-lg btn-block" id="boutton" @click="Send_Data">Sign Up</button>
                <br></br>
            <p class="forgot-password text-right">
                Already registered 
                <router-link :to="{name: 'login'}">sign in?</router-link>
            </p>
        </form>
    </div>
</template>
 
<script>
    import axios from 'axios';
    export default {
        data() {
            return {
                info: {
                    Matricule:"",
                    Name:"",
                    Email: "",
                    Password: ""
                }
            }
        },
        methods: {
            Send_Data(e) {
                e.preventDefault();
                console.log("Data sended!!!");

                axios
                    .post('http://localhost/api.php', {
                    Matricule: this.info.Matricule,
                    Name: this.info.Name,
                    Email: this.info.Email,
                    Password: this.info.Password
                    })
                    .then(function (response) {
                    console.log(response);
                    })
                    .catch(function (error) {
                    console.log(error);
                    }); 
            },
        }
    }
</script>
<style>
    #div1{
        background-color: rgba(125, 184, 86, 0.904);
        margin-top: 200px;
        padding: 0;
        display: flex;
        margin-left: 600px;
        position: absolute;
        padding: 70px 70px 70px 70px;
        border-radius: 50px 50px 50px 50px;
    }
    #boutton{
        position: absolute;
        margin-top: 15px;
        padding: 5px;
        font-size: 15px;
    }
</style>