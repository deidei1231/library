/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - db_libraryv2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_libraryv2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_libraryv2`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `pwd` varchar(16) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`pwd`,`tel`) values (101,'admin1','admin1','13633465455'),(102,'admin2','admin2','22222222222');

/*Table structure for table `appoint` */

DROP TABLE IF EXISTS `appoint`;

CREATE TABLE `appoint` (
  `book_name` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `appoint_date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stu_id` (`stu_id`),
  KEY `app_book_id` (`book_id`),
  CONSTRAINT `app_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `app_stu_id` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `appoint` */

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `sort` int(225) NOT NULL,
  `bookdesc` varchar(4096) NOT NULL,
  `count` int(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `book_sort` (`sort`),
  CONSTRAINT `book_sort` FOREIGN KEY (`sort`) REFERENCES `sort` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`author`,`sort`,`bookdesc`,`count`) values (1,'廖雪峰Java','廖雪峰',1,'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程',9),(2,'c++算法珠玑','c++1',3,'算法珠玑(C++版)——一个最精简的题库，本书的目标读者是准备去硅谷找工作的码农，也适用于在国内找工作的码农，以及刚接触ACM算法竞赛的新手。',10),(3,'Go入门指南','golang1',4,'在接触 Go 语言之后，对这门编程语言非常着迷，期间也陆陆续续开始一些帮助国内编程爱好者了解和发展 Go 语言的工作，比如开始录制视频教程《Go编程基础》。但由于目前国内并没有比较好的 Go 语言书籍，而国外的优秀书籍因为英文的缘故在一定程度上也为不少 Go 语言爱好者带来了一些学习上的困扰，不仅为了加快扩散 Go 爱好者的国内群体，本人在完成阅读这本名叫 《The Way to Go》 之后，决定每天抽出一点时间来进行翻译的工作，并且以开源的形式免费分享给有需要的 Go 语言爱好者。',10),(4,'Springboot 开源电子书','SpringBoot官方',1,'Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Spring Boot致力于在蓬勃发展的快速应用开发领域(rapid application development)成为领导者。',10),(5,'SpringCloud教程','SpringCloud官方',1,'Spring Cloud Tutorial 是一本关于 Spring Cloud 学习的开源书。利用业余时间写了本书，图文并茂，用大量实例带你一步一步走进 Spring Cloud 的世界。如有疏漏欢迎指正，欢迎提问。感谢您的参与！',10),(6,'Thinking in Java','陈昊鹏',1,'本书赢得了全球程序员的广泛赞誉，即使是最晦涩的概念，在Bruce Eckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到最高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。',10),(7,'深入理解Java虚拟机','周志明',1,'《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》内容简介：第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据最新的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和最佳实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。',10),(8,'JAVA核心技术','Cay S. Horstmann',1,'《JAVA核心技术(卷1):基础知识(原书第8版)》是《Java核心技术》的最新版，《Java核心技术》出版以来一直畅销不衰，深受读者青睐，每个新版本都尽可能快地跟上Java开发工具箱发展的步伐，而且每一版都重新改写了的部分内容，以便适应Java的最新特性。本版也不例外，它反遇了Java SE6的新特性。全书共14章，包括Java基本的程序结构、对象与类、继承、接口与内部类、图形程序设计、事件处理、Swing用户界面组件、部署应用程序和Applet、异常日志断言和调试、叙述方式深入浅出，并包含大量示例，从而帮助读者充分理解Java语言以及Java类型库的相关特性。',10),(9,'Python编程','埃里克·马瑟斯',2,'本书是一本针对所有层次的Python 读者而作的Python 入门书。全书分两部分：第一部分介绍用Python 编程所必须了解的基本概念，包括matplotlib、NumPy 和Pygal 等强大的Python 库和工具介绍，以及列表、字典、if 语句、类、文件与异常、代码测试等内容；第二部分将理论付诸实践，讲解如何开发三个项目，包括简单的Python 2D 游戏开发如何利用数据生成交互式的信息图，以及创建和定制简单的Web 应用，并帮读者解决常见编程问题和困惑。',10),(10,'Python深度学习','弗朗索瓦•肖莱',2,'本书由Keras之父、现任Google人工智能研究员的弗朗索瓦•肖莱（François Chollet）执笔，详尽介绍了用Python和Keras进行深度学习的探索实践，涉及计算机视觉、自然语言处理、生成式模型等应用。书中包含30多个代码示例，步骤讲解详细透彻。由于本书立足于人工智能的可达性和大众化，读者无须具备机器学习相关背景知识即可展开阅读。在学习完本书后，读者将具备搭建自己的深度学习环境、建立图像识别模型、生成图像和文字等能力。',10),(11,'利用Python进行数据分析',' Wes McKinney',2,'“科学计算和数据分析社区已经等待这本书很多年了：大量具体的实践建议，以及大量综合应用方法。本书在未来几年里肯定会成为Python领域中技术计算的权威指南。”',10),(12,'Python编程快速上手','Albert Sweigart',2,'如今，人们面临的大多数任务都可以通过编写计算机软件来完成。Python是一种解释型、面向对象、动态数据类型的高级程序设计语言。通过Python编程，我们能够解决现实生活中的很多任务。',10),(13,'Python学习手册（第4版）','Mark Lutz',2,'Google和YouTube由于Python的高可适应性、易于维护以及适合于快速开发而采用它。如果你想要编写高质量、高效的并且易于与其他语言和工具集成的代码，《Python学习手册：第4 版》将帮助你使用Python快速实现这一点，不管你是编程新手还是Python初学者。本书是易于掌握和自学的教程，根据作者Python专家Mark Lutz的著名培训课程编写而成。',10),(14,'Linux多线程服务端编程','陈硕',3,'本书主要讲述采用现代C++ 在x86-64 Linux 上编写多线程TCP 网络服务程序的主流常规技术，重点讲解一种适应性较强的多线程服务器的编程模型，即one loop per thread。这是在Linux 下以native 语言编写用户态高性能网络程序最成熟的模式，掌握之后可顺利地开发各类常见的服务端网络应用程序。本书以muduo 网络库为例，讲解这种编程模型的使用方法及注意事项。',10),(15,'C++ Primer 中文版','Stanley B. Lippman',3,'这本久负盛名的 C++经典教程，时隔八年之久，终迎来史无前例的重大升级。除令全球无数程序员从中受益，甚至为之迷醉的——C++ 大师 Stanley B. Lippman 的丰富实践经验，C++标准委员会原负责人 Josée Lajoie 对C++标准的深入理解，以及C++ 先驱 Barbara E. Moo 在 C++教学方面的真知灼见外，更是基于全新的 C++11标准进行了全面而彻底的内容更新。非常难能可贵的是，《C++ Primer 中文版(第5版)》所有示例均全部采用 C++11 标准改写，这在经典升级版中极其罕见——充分体现了 C++ 语言的重大进展及其全面实践。书中丰富的教学辅助内容、醒目的知识点提示，以及精心组织的编程示范，让这本书在 C++ 领域的权威地位更加不可动摇。无论是初学者入门，或是中、高级程序员提升，本书均为不容置疑的首选。',10),(16,'Thinking in C++','Bruce Eckel',3,'In the first edition of Thinking in C++, Bruce Eckel synthesized years of C++ teaching and programming experience into a beautifully structured course in making the most of the language. It became an instant classic, winning the 1995 Software Development Jolt Cola Award for best book of the year. Now, Eckel has thoroughly rewritten Thinking in C++ to reflect the final ANSI/ISO C++ standard. Every page has been revisited and rethought, with many new examples and exercises -- all designed to help you understand C++ \"down to the bare metal,\" so you can solve virtually any problem. Eckel starts with a detailed look at objects, showing how C++ programs can be constructed from off-the-shelf object libraries. This edition includes a new, chapter-length overview of the C features that are used in C++ -- plus a new CD-ROM containing an outstanding C seminar that covers all the foundations developers need before they can truly take advantage of C++. Eckel then walks through initialization and cleanup; function overloading and default arguments; constants; inline functions; name control; references and the copy constructor; operator overloading; and more. There are chapters on dynamic object creation; inheritance and composition; polymorphism and virtual functions, and templates. (Bonus coverage of string, templates, and the Standard Template Library, can be found at Eckel\'s web site.) Every chapter contains many modular, to-the-point examples, plus exercises based on Eckel\'s extensive experience teaching C++ seminars. Put simply, Eckel has made an outstanding book on C++ even better.',10),(17,'Go语言入门经典','(George.Ornbo)',4,'Go 语言是谷歌推出的一种全新的编程语言，旨在不损失应用程序性能的情况下降低代码的复杂性，具有“部署简单、并发性好、语言设计良好、执行性能良好”等优势，目前国内诸多IT公司均已采用Go语言开发项目。',10),(18,'Go程序设计语言','艾伦 A. A. 多诺万',4,'本书由《C程序设计语言》的作者Kernighan和谷歌公司Go团队主管Alan Donovan联袂撰写，是学习Go语言程序设计的指南。本书共13章，主要内容包括：Go的基础知识、基本结构、基本数据类型、复合数据类型、函数、方法、接口、goroutine、通道、共享变量的并发性、包、go工具、测试、反射等。',10),(19,'Go语言实战','布赖恩·克特森',4,'Go语言结合了底层系统语言的能力以及现代语言的高级特性，旨在降低构建简单、可靠、高效软件的门槛。本书向读者提供一个专注、全面且符合语言习惯的视角。Go语言实战同时关注语言的规范和实现，涉及的内容包括语法、类型系统、并发、管道、测试，以及其他一些主题。',10),(20,'Head First HTML与CSS','Eric Freeman',5,'是不是已经厌倦了那些深奥的HTML书？你可能在抱怨，只有成为专家之后才能读懂那些书。那么，找一本新修订的《Head First HTML与CSS（第2版）》吧，来真正学习HTML。你可能希望学会HTML和CSS来创建你想要的Web页面，从而能与朋友、家人、粉丝和狂热的顾客更有效地交流。你还希望使用最新的HTML5标准，能够保证随时间维护和扩展你的Web页面，使它们在所有浏览器和移动设备中都能正常工作。',10),(21,'HTML & CSS设计与构建网站','Jon Duckett',5,'欢迎您选择一种更高效的学习HTML和CSS的方式。不管您设计和建立新网站，还是想更好地控制现有网站，都可以在《HTML & CSS 设计与构建网站》一书的指导下创建出用户友好、令用户赏心悦目的Web内容。我们知道，编码是一项令人望而生畏的工作，而本书却采用有别于许多传统编程书籍的新颖编排方式，将使您收到事半功倍的学习效果。',10),(22,'响应式Web设计','Ben Frain',5,'随着iPad mini的发布，又一个新的屏幕尺寸诞生了。用不着全面统计，你就会发现移动互联网时代众多的屏幕规格，从智能手机的3、4、5英寸，到平板电脑的7、8、9、10英寸，再到笔记本和台式机的13至30英寸，绝非目前单一的固定或流式布局所能应付。于是，响应式设计应运而生，而且它也将成为移动互联网时代前端设计与开发人员的一门必修课。',10),(23,'Vue.js权威指南','张耀春',6,'Vue.js 是一个用来开发Web 界面的前端库。《Vue.js权威指南》致力于普及国内Vue.js 技术体系，让更多喜欢前端的人员了解和学习Vue.js。如果你对Vue.js 基础知识感兴趣，如果你对源码解析感兴趣，如果你对Vue.js 2.0感兴趣，如果你对主流打包工具感兴趣，如果你对如何实践感兴趣，《Vue.js权威指南》都是一本不容错过的以示例代码为引导、知识涵盖全面的最佳选择。《Vue.js权威指南》一共30 章，由浅入深地讲解了Vue.js 基本语法及源码解析。主要内容包括数据绑定、指令、表单控件绑定、过滤器、组件、表单验证、服务通信、路由和视图、vue-cli、测试开发和调试、源码解析及主流打包构建工具等。该书内容全面，讲解细致，示例丰富，适用于各层次的开发者。',10),(25,'Java项目开发案例','明日科技',1,'《Java项目开发案例全程实录》以进销存管理系统、企业内部通信系统、企业人事管理系统、酒店管理系统、图书馆管理系统、企业快信、欣想电子商城、医药管理系统、企业门户网站、BBS系统、手机网络游戏和棋牌游戏系统之网络五子棋12个实际项目开发程序为案例，从软件工程的角度出发，按照项目的开发顺序，系统、全面地介绍了J2SE、J2EE和J2ME项目的开发流程。从开发背景、需求分析、系统功能分析、数据库分析、数据库建模、网站开发，到网站发布或者程序打包与运行，每一过程都进行了详细的介绍。  《Java项目开发案例全程实录》案例涉及行业广泛，实用性非常强。通过对本书的学习，读者可以了解各个行业的特点，能够针对某一行业进行软件开发，也可以通过光盘中提供的案例源代码和数据库进行二次开发，以减少开发系统所需要的时间。  《Java项目开发案例全程实录》光盘提供12个项目开发完整案例的同步教学视频，12个项目开发完整案例及其源程序，《Java项目开发案例全程实录》的服务网站还提供了内容丰富的素材库、题库、模块库、案例库和本书的答疑服务。本书是一本项目开发案例方面的参考书，适合有基本编程知识但还没有项目开发经验的软件开发初学者使用，尤其适合高校在校生进行毕业设计、课题设计时做参考。',10);

/*Table structure for table `brrow` */

DROP TABLE IF EXISTS `brrow`;

CREATE TABLE `brrow` (
  `ret_check` int(11) NOT NULL DEFAULT '0',
  `add_check` int(11) NOT NULL DEFAULT '0' COMMENT '续借check',
  `brr_check` int(11) NOT NULL DEFAULT '0',
  `book_name` varchar(20) NOT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_id` int(10) NOT NULL,
  `book_id` int(11) NOT NULL,
  `brrow_date` varchar(10) NOT NULL,
  `return_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brr_stu_id` (`stu_id`),
  KEY `brr_book_id` (`book_id`),
  CONSTRAINT `brr_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `brr_stu_id` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;

/*Data for the table `brrow` */

insert  into `brrow`(`ret_check`,`add_check`,`brr_check`,`book_name`,`id`,`stu_id`,`book_id`,`brrow_date`,`return_date`) values (2,0,2,'廖雪峰Java',221,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'c++算法珠玑',222,100044,2,'2020/5/11','2020/5/11'),(2,0,2,'Go入门指南',223,100044,3,'2020/5/11','2020/5/11'),(2,0,2,'Springboot 开源电子书',224,100044,4,'2020/5/11','2020/5/11'),(2,0,2,'SpringCloud教程',225,100044,5,'2020/5/11','2020/5/11'),(2,0,2,'Thinking in Java',226,100044,6,'2020/5/11','2020/5/11'),(2,0,2,'深入理解Java虚拟机',227,100044,7,'2020/5/11','2020/5/11'),(2,0,2,'Go语言入门经典',228,100044,17,'2020/5/11','2020/5/11'),(2,0,2,'Go程序设计语言',229,100044,18,'2020/5/11','2020/5/11'),(2,0,2,'Go语言实战',230,100044,19,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',231,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'c++算法珠玑',232,100044,2,'2020/5/11','2020/5/11'),(2,0,2,'Go入门指南',233,100044,3,'2020/5/11','2020/5/11'),(2,0,2,'Springboot 开源电子书',234,100044,4,'2020/5/11','2020/5/11'),(2,0,2,'SpringCloud教程',235,100044,5,'2020/5/11','2020/5/11'),(2,0,2,'Thinking in Java',236,100044,6,'2020/5/11','2020/5/11'),(2,0,2,'深入理解Java虚拟机',237,100044,7,'2020/5/11','2020/5/11'),(2,0,2,'JAVA核心技术',238,100044,8,'2020/5/11','2020/5/11'),(2,0,2,'Python编程',239,100044,9,'2020/5/11','2020/5/11'),(2,0,2,'Python深度学习',240,100044,10,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',241,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'c++算法珠玑',242,100044,2,'2020/5/11','2020/5/11'),(2,0,2,'Go入门指南',243,100044,3,'2020/5/11','2020/5/11'),(2,0,2,'Springboot 开源电子书',244,100044,4,'2020/5/11','2020/5/11'),(2,0,2,'SpringCloud教程',245,100044,5,'2020/5/11','2020/5/11'),(2,0,2,'Thinking in Java',246,100044,6,'2020/5/11','2020/5/11'),(2,0,2,'深入理解Java虚拟机',247,100044,7,'2020/5/11','2020/5/11'),(2,0,2,'JAVA核心技术',248,100044,8,'2020/5/11','2020/5/11'),(2,0,2,'Python编程',249,100044,9,'2020/5/11','2020/5/11'),(2,0,2,'Python深度学习',250,100044,10,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',251,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'SpringCloud教程',252,100045,5,'2020/5/11','2020/5/11'),(2,0,2,'Thinking in Java',253,100045,6,'2020/5/11','2020/5/11'),(2,0,2,'深入理解Java虚拟机',254,100045,7,'2020/5/11','2020/5/11'),(2,0,2,'JAVA核心技术',255,100045,8,'2020/5/11','2020/5/11'),(2,0,2,'Python编程',256,100045,9,'2020/5/11','2020/5/11'),(2,0,2,'Python深度学习',257,100045,10,'2020/5/11','2020/5/11'),(2,0,2,'利用Python进行数据分析',258,100045,11,'2020/5/11','2020/5/11'),(2,0,2,'Python编程快速上手',259,100045,12,'2020/5/11','2020/5/11'),(2,0,2,'Python学习手册（第4版）',260,100045,13,'2020/5/11','2020/5/11'),(2,0,2,'Linux多线程服务端编程',261,100045,14,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',262,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',263,100045,1,'2020/5/11','2020/5/11'),(2,0,2,'Python学习手册（第4版）',264,100045,13,'2020/5/11','2020/5/11'),(2,0,2,'Linux多线程服务端编程',265,100045,14,'2020/5/11','2020/5/11'),(2,0,2,'C++ Primer 中文版',266,100045,15,'2020/5/11','2020/5/11'),(2,0,2,'Thinking in C++',267,100045,16,'2020/5/11','2020/5/11'),(2,0,2,'Go语言入门经典',268,100045,17,'2020/5/11','2020/5/11'),(2,0,2,'Go程序设计语言',269,100045,18,'2020/5/11','2020/5/11'),(2,0,2,'Go语言实战',270,100045,19,'2020/5/11','2020/5/11'),(2,0,2,'Head First HTML与CSS',271,100045,20,'2020/5/11','2020/5/11'),(2,0,2,'HTML & CSS设计与构建网站',272,100045,21,'2020/5/11','2020/5/11'),(2,0,2,'响应式Web设计',273,100045,22,'2020/5/11','2020/5/11'),(2,0,2,'Python学习手册（第4版）',274,100044,13,'2020/5/11','2020/5/11'),(2,0,2,'Linux多线程服务端编程',275,100044,14,'2020/5/11','2020/5/11'),(2,0,2,'利用Python进行数据分析',276,100044,11,'2020/5/11','2020/5/11'),(2,0,2,'Python编程快速上手',277,100044,12,'2020/5/11','2020/5/11'),(2,0,2,'Java项目开发案例',278,100044,25,'2020/5/11','2020/5/11'),(2,0,2,'Vue.js权威指南',279,100044,23,'2020/5/11','2020/5/11'),(2,0,2,'响应式Web设计',280,100044,22,'2020/5/11','2020/5/11'),(2,0,2,'HTML & CSS设计与构建网站',281,100044,21,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',282,100044,1,'2020/5/11','2020/5/11'),(2,0,2,'Go入门指南',283,100044,3,'2020/5/11','2020/5/11'),(2,0,2,'廖雪峰Java',284,100044,1,'2020/5/14','2020/5/14'),(2,0,2,'廖雪峰Java',285,100044,1,'2020/5/16','2020/5/16'),(2,0,2,'廖雪峰Java',286,100044,1,'2020/5/16','2020/5/16'),(2,0,2,'c++算法珠玑',287,100044,2,'2020/5/16','2020/5/16'),(2,0,2,'Springboot 开源电子书',288,100044,4,'2020/5/16','2020/5/16'),(2,0,2,'Go入门指南',289,100044,3,'2020/5/16','2020/5/16'),(2,0,2,'SpringCloud教程',290,100044,5,'2020/5/16','2020/5/16'),(2,0,2,'Thinking in Java',291,100044,6,'2020/5/16','2020/5/16'),(2,0,2,'Java项目开发案例',292,100044,25,'2020/5/16','2020/5/16'),(2,0,2,'JAVA核心技术',293,100044,8,'2020/5/16','2020/5/16'),(2,0,2,'深入理解Java虚拟机',294,100044,7,'2020/5/16','2020/5/16'),(2,0,2,'Vue.js权威指南',295,100044,23,'2020/5/16','2020/5/16'),(2,0,2,'廖雪峰Java',296,100044,1,'2020/6/1','2020/6/1'),(2,0,2,'c++算法珠玑',297,100044,2,'2020/6/1','2020/6/1'),(2,0,2,'Go入门指南',298,100044,3,'2020/6/1','2020/6/1'),(2,0,2,'Springboot 开源电子书',299,100044,4,'2020/6/1','2020/6/1'),(2,0,2,'廖雪峰Java',300,100044,1,'2020/6/1','2020/6/1'),(2,0,2,'廖雪峰Java',301,100044,1,'2020/6/1','2020/6/1'),(2,0,2,'廖雪峰Java',302,100044,1,'2020/6/1','2020/6/1'),(2,0,2,'廖雪峰Java',303,100044,1,'2020/6/1','2020/6/1'),(2,0,2,'廖雪峰Java',304,100044,1,'2020/6/1','2020/6/1'),(1,0,2,'廖雪峰Java',305,100044,1,'2020/4/1','2020/5/1');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `pwd` varchar(16) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`id`,`name`,`pwd`,`tel`) values (1001,'manager1','manager1','13633465455'),(1002,'manager2','manager2','13633465455'),(1005,'manager3','manager3','15353318792');

/*Table structure for table `sort` */

DROP TABLE IF EXISTS `sort`;

CREATE TABLE `sort` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `sort` */

insert  into `sort`(`id`,`name`) values (1,'java'),(2,'python'),(3,'c++'),(4,'golang'),(5,'html'),(6,'vue');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `time_out` int(1) NOT NULL DEFAULT '0',
  `brr_count` int(11) NOT NULL DEFAULT '10',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `pwd` varchar(16) NOT NULL,
  `card` varchar(1) DEFAULT '0',
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100050 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`time_out`,`brr_count`,`id`,`name`,`pwd`,`card`,`tel`) values (0,10,100039,'张三','zhangsan','1','13633465455'),(0,10,100040,'李四','lisi123','1','15552670125'),(0,10,100041,'王五','wangwu','1','13111111111'),(0,10,100042,'mys','mayunshen','1','17853318792'),(0,10,100043,'yinxiao','123456','1','14797346116'),(0,9,100044,'studentSuper','student1','1','15435452454'),(0,10,100045,'小明','student2','1','13809493023'),(0,10,100046,'yxd999','123456','0','15552670125'),(0,10,100047,'yxd123','123456','0','15552670125'),(0,10,100048,'yxd12345','123456','0','15552670125'),(0,10,100049,'yxd1234567','123456','0','15552670126');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
