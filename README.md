# smartcampus

开发环境及工具

    jdk1.8 + mysql5.7 + tomcat + IDEA

系统架构

    Spring+Springmvc+Maven+Mybatis+BootStrap
    
导入IDEA 
    
    方式一：
    
      已经安装github，可以直接Fork此仓库，打开Intellij IDEA-->File-->New-->Project from Version Control-->Git
      URL地址选择 https://github.com/你的github账户名/smartcampus.git 待所有架包下载导入完成即可
    
    方式二：
    
      下载仓库到本地并解压，打开Intellij IDEA-->Open（选择项目解压路径），找到porm.xml文件并打开，待所有架包下载导入完成即可
      
  导入数据库
  
     1.直接导入选择smartcampus.sql
     2.手动执行要以文本方式打开手动建库xx.sql，复制语句执行
     
  修改数据库连接配置
  
      路径为项目 resources/jdbc.properties
    
    
    