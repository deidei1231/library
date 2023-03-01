// 登录页面
<template>
  <div>
    <div class="nav">
      <i
        style="font-size:50px; color:#409EFF; line-height:80px;text-indent:50px"
        class="el-icon-upload"
      >
        <span style="font-size:40px;">图书馆</span>
      </i>
    </div>
    <div class="stuLog">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="账号">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input type="password" v-model="form.pwd"></el-input>
        </el-form-item>
        <el-form-item label="验证码">
          <el-input v-model="form.token"></el-input>
        </el-form-item>
        <div
          style="width:50px;height=50px;background-color:grey;position:relative;top:-50px;left:350px"
        >{{token}}</div>
        <el-form-item label="身份">
          <el-radio-group v-model="radio2">
            <el-radio :label="3">学生</el-radio>
            <el-radio :label="6">人员</el-radio>
            <el-radio :label="9">管理员</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item style="margin:50px 50px">
          <el-button type="primary" @click="onLog">立即登录</el-button>
          <el-button type="primary" @click="onRegistry">立即注册</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      token: "",
      form: {
        name: "",
        pwd: "",
        token: ""
      },
      radio2: 3,
      _tempStuInfo: {}
    };
  },
  methods: {
    makeToken() {
      var code = "";
      const codeLength = 4; //验证码的长度
      const random = new Array(
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z"
      ); //随机数
      for (let i = 0; i < codeLength; i++) {
        //循环操作
        let index = Math.floor(Math.random() * 36); 

        code += random[index]; 
      }
      this.token = code;
    },

    onLog() {
      // console.log(this.global.stuCount);
      // console.log(this.form.name)
      const _this = this;
      if(this.form.token!=this.token){
        _this.$message({
          message:"验证码错误"
        })
        this.makeToken();
      }else if (this.radio2 == 3) {
        // console.log("1")
        this.$axios
          .get("http://localhost:8081/students/findById/" + this.form.name)
          .then(function(resp) {
            // console.log(resp);
            // 保存stu  Info
            _this._tempStuInfo = resp.data;
            // console.log(_this._tempStuInfo)
            if (_this.form.pwd == resp.data.pwd) {
              // console.log("success!");
              _this.global.setStuCount(_this.form.name);
              // console.log(_this.global.stuCount);
              //  保存全局用户name
              _this.global.setStuName(resp.data.name);
              // 保存用户 brrCount
              _this.global.setStuBrrCount(resp.data.brrCount);
              _this.global.setStuTimeOut(resp.data.timeOut);
              _this.global.setStuCard(resp.data.card);
              // console.log(resp.data.name)
              // console.log(_this.global.stuName);
              // console.log(resp.data.brrCount)
              _this.$axios
                .get(
                  "http://localhost:8081/brrows/searchByStuId?keyword=" +
                    _this.global.stuCount
                )
                .then(function(resp) {
                  // console.log(resp);
                  // console.log(_this._tempStuInfo)
                  var _timeOutFlag = false;
                  for (var i = 0; i < resp.data.length; i++) {
                    // console.log(resp.data[i].id)
                    if (
                      resp.data[i].retCheck != 2 &&
                      resp.data[i].brrCheck == 2
                    ) {
                      var _nowDate = new Date();
                      var _retDate = new Date(resp.data[i].returnDate);
                      var _nowDateStamp = Date.parse(_nowDate);
                      var _retDateStamp = Date.parse(_retDate);
                      if (_retDateStamp - _nowDateStamp < 0) {
                        _timeOutFlag = true;
                      }
                    }
                  }
                  if (_timeOutFlag) {
                    _this._tempStuInfo.timeOut = 1;
                    _this.$axios
                      .put(
                        "http://localhost:8081/students/update",
                        _this._tempStuInfo
                      )
                      .then(function(resp) {
                        _this.global.setStuTimeOut(_this._tempStuInfo.timeOut);
                      });
                  }
                });
              _this.$router.push({ path: "/student" });
            } else {
              alert("你输入的账号或密码错误！");
              _this.makeToken()
            }
          });
      } else if (this.radio2 == 6) {
        // console.log("1")
        this.$axios
          .get("http://localhost:8081/managers/findById/" + this.form.name)
          .then(function(resp) {
            // console.log(resp);
            if (_this.form.pwd == resp.data.pwd) {
              // console.log("success!");
              // 保存全局用户id
              _this.global.setManCount(_this.form.name);
              //  保存全局用户name
              _this.global.setManName(resp.data.name);
              // console.log(resp)
              // console.log(_this.global.manCount);
              _this.$router.push({ path: "/manager" });
            } else {
              alert("你输入的账号或密码错误！");
              _this.makeToken();
            }
          });
      } else if (this.radio2 == 9) {
        // console.log("1")
        this.$axios
          .get("http://localhost:8081/admins/findById/" + this.form.name)
          .then(function(resp) {
            // console.log(resp);

            // 2020年4月7日23:35:14  做到这里了
            // console.log(resp);
            if (_this.form.pwd == resp.data.pwd) {
              // console.log("success!");
              _this.global.setAdmCount(_this.form.name);
              // console.log(_this.global.admCount);
              //  保存全局用户name
              _this.global.setAdmName(resp.data.name);

              _this.$router.push({ path: "/admin" });
            } else {
              alert("你输入的账号或密码错误！");
              _this.makeToken();
            }
          });
      }
    },
    onRegistry() {
      // console.log("regsitry");
      if (this.radio2 == 3) {
        this.$router.push({ path: "/stuRegistry" });
      }
    }
  },
  created(){
    this.makeToken();
  }
};
</script>

<style lang="">
* {
  padding: 0;
  margin: 0;
}
.stuLog {
  width: 30%;
  margin: 100px auto;
}
.nav {
  width: 100%;
  height: 80px;
  background-color: #f8f8f8;
}
</style>