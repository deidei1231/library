// 员工主页
<template>
  <div>
    <div>
      <el-container style="height: 500px; border: 1px solid #eee" router>
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
          <el-menu :default-openeds="['2']">
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-message"></i>图书
              </template>
              <el-menu-item-group>
                <el-submenu index="1-1">
                  <template slot="title">
                    <i class="el-icon-d-arrow-right"></i>图书管理
                  </template>
                  <el-menu-item-group>
                    <el-menu-item index="1-1-1">
                      <router-link to="/manBookLook">图书查看</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-1-2">
                      <router-link to="/manAddBook">增加图书</router-link>
                    </el-menu-item>
                  </el-menu-item-group>
                </el-submenu>
                <el-submenu index="1-2">
                  <template slot="title">
                    <i class="el-icon-d-arrow-right"></i>图书审核
                  </template>
                  <el-menu-item-group>
                    <el-menu-item index="1-2-1">
                      <router-link to="/manBrrCheck">借阅审核</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-2-2">
                      <router-link to="/manAddCheck">续借审核</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-2-3">
                      <router-link to="/manRetCheck">归还审核</router-link>
                    </el-menu-item>
                  </el-menu-item-group>
                </el-submenu>
                <el-submenu index="1-3">
                  <template slot="title">
                    <i class="el-icon-d-arrow-right"></i>图书统计
                  </template>
                  <el-menu-item-group>
                    <el-menu-item index="1-3-1">
                      <router-link to="/manBrrInfo">借出书籍</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-3-2">
                      <router-link to="/manRetInfo">归还书籍</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-3-3">
                      <router-link to="/manAppointInfo">预约书籍信息</router-link>
                    </el-menu-item>
                    <el-menu-item index="1-3-4">
                      <router-link to="/manBrrTotalInfo">借阅排行榜</router-link>
                    </el-menu-item>
                  </el-menu-item-group>
                </el-submenu>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title">
                <i class="el-icon-star-off"></i>设置
              </template>
              <el-menu-item-group>
                <el-menu-item index="2-1">
                  <router-link to="/manInfo">个人信息</router-link>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-aside>

        <el-container>
          <el-header style="height:50px;text-align: right; font-size: 12px">
            

            <span>{{this.global.manName}}</span>
            <el-dropdown>
              <i class="el-icon-setting" style="margin-right: 15px"></i>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>
                  <router-link :to="{path:'stuLog'}">退出</router-link>
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </el-header>

          <el-main style="z-index=200">
            <!-- <el-table :data="tableData">
            <el-table-column prop="date" label="日期" width="140"></el-table-column>
            <el-table-column prop="name" label="姓名" width="120"></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
            </el-table>-->
            <router-view></router-view>
          </el-main>
        </el-container>
      </el-container>
    </div>
  </div>
</template>



<style>
.el-header {
  background-color: #f8f8f8;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
a {
  text-decoration: none;
  color: black;
}
.router-link-active {
  text-decoration: none;
  color: black;
}
</style>

<script>
export default {};
</script>