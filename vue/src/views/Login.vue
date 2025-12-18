<template>
  <div class="login-container">
    <!-- <div style="margin-right: 150px; min-width: 300px">
      <img alt="" src="../assets/bg.svg" style="width: 700px"/>
    </div>
    <div style="width: 400px; margin: 150px auto">
      <div style="color: black; font-size: 30px; text-align: left; padding: 30px 0">宿舍管理系统</div>
      <el-form ref="form" :model="form" :rules="rules" size="large">
        <el-form-item prop="username">
          <el-input v-model="form.username" clearable prefix-icon="avatar"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="form.password" prefix-icon="lock" show-password></el-input>
        </el-form-item>
        <el-form-item :model="form" prop="identity">
          <el-radio v-model="form.identity" label="stu" style="color: grey">学生</el-radio>
          <el-radio v-model="form.identity" label="dormManager" style="color: grey">宿舍管理员</el-radio>
          <el-radio v-model="form.identity" label="admin" style="color: grey">系统管理员</el-radio>
        </el-form-item>
        <el-form-item>
          <el-button :disabled="!disabled" style="width: 20%" type="primary" @click="login">登 录</el-button>
        </el-form-item>
      </el-form>
    </div> -->


    <div style="width: 1000px;height: 420px;border-radius: 10px;overflow: hidden;display: flex;justify-content: space-between;">
      <!-- <div style="width: 400px;height: 450px;background-image: url(../assets/img/dorm.png);background-size: cover;">

      </div> -->
        <img alt="" style="background-size: cover;background: rgba(0,0,0,0.02);" src="../assets/img/dorm.png" width="550" height="420"/>


        <div style="flex:1; height: 420px;background: #F4F4F4;">
          <div style="color: black; font-size: 30px; text-align:center;margin: 20px 0;">宿舍管理系统</div>
          <el-form ref="form" :model="form" :rules="rules" size="large">
            <el-form-item prop="username" style="padding: 0 20px;box-sizing: border-box;">
              <el-input v-model="form.username" clearable prefix-icon="avatar" ></el-input>
            </el-form-item>
            <el-form-item prop="password" style="padding: 0 20px;box-sizing: border-box;">
              <el-input v-model="form.password" prefix-icon="lock" show-password ></el-input>
            </el-form-item>
            <el-form-item :model="form" prop="identity" style="padding-left: 40px;">
              <el-radio v-model="form.identity" label="stu" style="color: #333333">学生</el-radio>
              <el-radio v-model="form.identity" label="dormManager" style="color: #333333">宿舍管理员</el-radio>
              <el-radio v-model="form.identity" label="admin" style="color: #333333">系统管理员</el-radio>
            </el-form-item>
            <el-form-item>
              <el-button :disabled="!disabled" style="width: 40%;margin: 0 auto;" type="primary" @click="login">登 录</el-button>
            </el-form-item>
          </el-form>
        </div>
    </div>
  </div>
</template>
<script src="@/assets/js/Login.js"></script>
<style scoped>@import '../assets/css/Login.css';</style>