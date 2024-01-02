# 信学网学生学籍管理系统
![license](https://img.shields.io/badge/license-Apache--license--2.0-yellow)
![SpringBoot](https://img.shields.io/badge/SpringBoot-2.4.1-green)
![Language](https://img.shields.io/badge/language-java-brightgreen)
![author](https://img.shields.io/badge/author-YyyHc404-red)
![GitHub Repo stars](https://img.shields.io/github/stars/Zzyucbul/stu3)
![GitHub Repo forks](https://img.shields.io/github/forks/Zzyucbul/stu3?log=)
![GitHub watchers](https://img.shields.io/github/watchers/Zzyucbul/stu3)


---
# 📒 更新日志:     
>## 🍁 2023.12.20 



删除了 院系模块 中添加页面的"学校选择"下拉框，添加院系时会将使用学校管理员账号所管理学校的id(role表字段为 schoolId).

添加了 学生模块 中学生主页修改密码、修改手机号功能

更新了 学校管理员各页面的信息显示，表格将根据管理员管理所属院校筛选显示

调整了 各页面的显示

> ## 🍁2023.12.21
添加了 管理员管理模块 的学校管理员首页
添加了 登录页面 中 忘记密码 功能
修改了 首页的展示方式，即默认为首页面包屑


### ❓ _出现的问题_:
在前后端分离场景，Controller记得添加@ResponseBody

在设计阶段没有充分考虑，导致管理员表缺少许多必要的字段，所以缺少用户模块的管理员管理的许多功能

使用了Shior之后，无论访问后端的哪个接口都需要先认证，否则会跳到登录页面

>## 🍁2023.12.26
添加了 通过邮箱进行验证功能,出于时间原因没有添加修改密码时使用邮箱验证的页面
### ❓_出现的问题_:
应当设计一个匿名用户，即访问网站时的默认身份,可以解决在2023.12.21[出现的问题](#❓-出现的问题) 中的认证问题

>## 🍁2024.1.2
将项目容器化并编排

需要在自己的linux环境中创建/app/mysql和/app/redis文件夹按照compose文件创建和添加对应的子文件
需要把compose放到该项目的上一层文件夹即 stu3同级目录

### ❓_出现的问题_:
目前不知道什么原因在linux上部署服务器响应的中文数据是乱码，我试过将mysql和linux本地的编码改为utf8也是不行，可能是需要调整
java中的响应编码

### 备忘录:
    管理员添加接口      UserController
    权限添加接口        permissionController






