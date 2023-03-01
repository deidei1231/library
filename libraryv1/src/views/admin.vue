// 管理员主页
<template>
  <div>
    <el-container style="height: 500px; border: 1px solid #eee" router>
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu :default-openeds="['0']">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-edit"></i>借书证管理
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1"><router-link to='/admAddCard'>添加借书证</router-link></el-menu-item>
              <el-menu-item index="1-1"><router-link to='/admDeleteCard'>删除借书证</router-link></el-menu-item>
              
            </el-menu-item-group>
          </el-submenu>
          
        </el-menu>
        <el-menu :default-openeds="['0']">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-tickets"></i>员工管理
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1"><router-link to='/admManLook'>查看员工</router-link></el-menu-item>
              <el-menu-item index="1-2"><router-link to='/admAddMan'>添加员工</router-link> </el-menu-item>
             </el-menu-item-group>
          </el-submenu>
          
        </el-menu>
        <el-menu :default-openeds="['0']">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-menu"></i>图书分类管理
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1"><router-link to='/admSortLook'>查看图书分类</router-link></el-menu-item>
              <el-menu-item index="1-2"><router-link to='/admAddSort'>添加分类</router-link> </el-menu-item>
             </el-menu-item-group>
          </el-submenu>
         
        </el-menu>
        <el-menu :default-openeds="['0']">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-message"></i>图书统计
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1"><router-link to='/admBrrInfo'>借阅书籍</router-link></el-menu-item>
              <el-menu-item index="1-2"><router-link to='/admRetInfo'>归还书籍</router-link> </el-menu-item>
              <el-menu-item index="1-3"><router-link to='/admTotalBrrInfo'>借阅排行榜</router-link> </el-menu-item>
             </el-menu-item-group>
          </el-submenu>
         
        </el-menu>
        <el-menu :default-openeds="['0']">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-setting"></i>设置
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1"><router-link to='/admInfo'>个人信息</router-link></el-menu-item>
             </el-menu-item-group>
          </el-submenu>
         
        </el-menu>
      </el-aside>

      <el-container>
        <el-header style="text-align: right; font-size: 12px">
          <span>{{this.global.admName}}</span>
          <el-dropdown>
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <router-link :to="{path:'/stuLog'}"><el-dropdown-item>退出</el-dropdown-item></router-link>
            </el-dropdown-menu>
          </el-dropdown>
        </el-header>

        <el-main>
          <!-- <el-table :data="tableData">
            <el-table-column prop="date" label="日期" width="140"></el-table-column>
            <el-table-column prop="name" label="姓名" width="120"></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
          </el-table> -->
           <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
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
a{
  text-decoration: none;
  color: black;
}
.router-link-active{
  text-decoration: none;
  color: black;
}
</style>

<script>
export default {
  
 
};
</script>