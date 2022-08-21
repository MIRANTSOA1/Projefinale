<template>
    <div class="vue-tempalte" id="div1">
        <form>
            <h3>Forgot Password</h3>
 
            <div class="form-group">
                <label>Email address</label>
                <input type="email" class="form-control form-control-lg" />
            </div>
 
            <button type="submit" class="btn btn-dark btn-lg btn-block" id="boutton">Reset password</button>
 
        </form>
    </div>
</template>
 
<script>
    export default {
        data() {
            return {}
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
        padding: 50px 50px 80px 50px;
        border-radius: 50px 50px 50px 50px;
    }
    #boutton{
        position: absolute;
        margin-top: 15px;
        padding: 5px;
        font-size: 15px;
    }
</style>