<template>
    <div class="vue-tempalte" id="div1">
        
        <form method="post">
            <h3>Sign In</h3>
 
            <div class="form-group">
                <label>Email address</label>
                <input type="email" name="Email" class="form-control form-control-lg" v-model="info.Email"/>
            </div>
 
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="Password" class="form-control form-control-lg" v-model="info.Password"/>
            </div>
 
            <button type="submit" class="btn btn-dark btn-lg btn-block" id='boutton' @click="Send_Data">Sign In</button>
 
            <p class="forgot-password text-right mt-2 mb-4">
                <router-link to="/forgotpwd">Forgot password ?</router-link><br>
                <router-link to="/list_user">User list</router-link><br>
                <router-link to="/">Sign up</router-link>
            </p>
            <!-- <p>{{ }}</p> -->
            
 
        </form>
    </div>
</template>
 
<script>
    import axios from 'axios';
    export default {
        data() {
            return {
                info: {
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
                    .post('http://localhost/login.php', {
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
        margin-top: 270px;
        padding: 0;
        display: flex;
        margin-left: 600px;
        position: absolute;
        padding: 50px 50px 50px 50px;
        border-radius: 50px 50px 50px 50px;
    }
    #boutton{
        position: absolute;
        margin-top: 15px;
        padding: 5px;
        font-size: 15px;
    }
</style>