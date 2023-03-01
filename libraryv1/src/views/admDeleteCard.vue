// 管理员删除借书证

<template>
  <div>
    <el-table
      :data="tableData.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      border
      style="width: 100%"
    >
      <el-table-column fixed prop="id" label="学生账号" width="250"></el-table-column>
      <el-table-column prop="name" label="学生昵称" width="250"></el-table-column>
      <el-table-column prop="tel" label="手机号" width="250"></el-table-column>
      <el-table-column fixed="right" label="操作" width="250">
        <template slot-scope="scope">
          <el-button @click="agreeCard(scope.row)" type="text" size="small">删除借书证</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @current-change="change"
      background
      layout="prev, pager, next"
      :page-size="pageSize"
      :total="tableData.length"
    ></el-pagination>
  </div>
</template>

<script>
export default {
  inject: ["reload"],

  methods: {
    agreeCard(row) {
      var _row = row;
      _row.card = "0";
      //   console.log(_row);
      const _this = this;
      _this
        .$confirm("确认删除借书证吗, 是否继续?", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        })
        .then(() => {
          _this.$axios
            .put("http://localhost:8081/students/update", _row)
            .then(function(resp) {
              _this.$message({
                type: "success",
                message: "成功删除借书证"
              });
              _this.reload();
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消"
          });
        });
    },

    change(currentPage) {
      this.currentPage = currentPage;
    }
  },
  created() {
    const _this = this;
    if (this.global.admCount == "") {
      _this.$message({
        message: "请重新登录！"
      });
      _this.$router.push("/stuLog");
    } else {
      _this.$axios
        .get("http://localhost:8081/students/searchByCard?keyword=1")
        .then(function(resp) {
          _this.tableData = resp.data;
        });
    }
  },

  data() {
    return {
      pageSize: 5,
      total: 10,
      currentPage: 1,
      tableData: [
        {
          id: "",
          name: "",
          pwd: "",
          card: "",
          brrCount: "",
          tel: "",
          timeOut:""
        }
      ]
    };
  }
};
</script>