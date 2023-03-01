// 员工个人信息
<template>
  <div class="stuInfo">
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <el-form-item label="用户名称" prop="name">
        <el-input v-model="ruleForm.name"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="pwd">
        <el-input v-model="ruleForm.pwd"></el-input>
      </el-form-item>
      <el-form-item label="手机号码" prop="tel">
        <el-input v-model="ruleForm.tel"></el-input>
      </el-form-item>

      <el-form-item style="margin-left:50px;margin-top:30px">
        <el-button type="primary" @click="submitForm()">修改</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  inject: ["reload"],

  data() {
    return {
      ruleForm: {
        id: "",
        name: "",
        pwd: "",

        tel: ""
      },
      rules: {
        name: [
          { required: true, message: "请输入用户名称", trigger: "blur" },
          { min: 2, max: 12, message: "长度在 2 到 12 个字符", trigger: "blur" }
        ],
        pwd: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, max: 16, message: "长度在 6 到 16 个字符", trigger: "blur" }
        ],
        tel: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          { min: 11, max: 11, message: "长度 11 个字符", trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    submitForm() {
      // console.log(this)
      const _this = this;

      // 验证 信息合法  如果模块优化就更好了
      var nameReg = /^[\u4e00-\u9fa5]|[A-Z]|[a-z]|[0-9]{2,12}$/;
      var pwdReg = /^[A-Z]|[a-z]|[0-9]{6,20}$/;
      var telReg = /^[1]([3-9])[0-9]{9}$/;
      // 给student对象  id
      this.ruleForm.id = this.global.manCount;
      if (
        nameReg.test(_this.ruleForm.name) &&
        pwdReg.test(_this.ruleForm.pwd) &&
        telReg.test(_this.ruleForm.tel)
      ) {
        // 修改信息
        _this.$axios
          .put("http://localhost:8081/managers/update", this.ruleForm)
          .then(function(resp) {
            // console.log(resp);
          });
        _this.$message({
          message: "修改成功",
          type: "success"
        });
        _this.reload();
      } else {
        _this.$message({
          message: "你输入的信息格式不对请输入正确的信息",
          type: "warning"
        });
      }
    }
  },
  created() {
    // console.log(this.global.stuCount)
    const _this = this;
    if (this.global.manCount == "") {
      _this.$message({
        message: "请重新登录"
      });
      _this.$router.push("/stuLog");
    } else{
_this.$axios
      .get("http://localhost:8081/managers/findById/" + _this.global.manCount)
      .then(function(resp) {
        // console.log(resp)
        _this.ruleForm.name = resp.data.name;
        _this.ruleForm.pwd = resp.data.pwd;
        _this.ruleForm.tel = resp.data.tel;
      });
    // console.log("created")
    }
    
  }
};
</script>
<style >
.stuInfo {
  width: 30%;
  margin: 30px auto;
}
</style>