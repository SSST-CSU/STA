<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 16/1/20
  Time: 下午9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <link href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
    <link rel="stylesheet" href="css/button.css">
    <title>软院科协-从这里，改变世界</title>
    <style type="text/css" rel="stylesheet">
        /* portfolio section */
        #portfolio {
            background: #000000;
            text-align: center;
            padding-top: 80px;
            padding-bottom: 60px;
            font-family: title;
            color: #FFFFFF;
            font-size: 2.7em;
        }

        #portfolio h2 {
            padding-bottom: 20px;
        }

        #portfolio .col-md-4,
        #portfolio .col-md-3 {
            padding: 0;
            margin: 0;
        }

        #portfolio img {
            width: 100%;
            transition: all 0.4s ease-in;
            opacity: 0.8;
        }

        #portfolio img:hover {
            opacity: 1;
        }

        #portfolio .btn {
            margin-top: 30px;
        }

        .service {
            background: #fff;
            padding: 7em 0;
            font-family: title;
        }

        .service-head {
            text-align: center;
        }

        .service-head h3 {
            color: #000;
            font-size: 2.7em;
            margin-bottom: 14px;
            letter-spacing: 1.3px;
            font-weight: 600;
        }

        .service-head h4 {
            color: #000;
            font-size: 1.2em;
            word-spacing: 2px;
            letter-spacing: 1.2px;
            font-weight: 600;
        }

        .service-grids {
            margin-top: 6%;
        }

        .service-grid {
            text-align: center;
            padding: 0;
        }

        .service-grid h3 {
            color: #000;
            margin-top: 1.5em;
            font-weight: 600;
            font-size: 2.1em;
        }

        .service-grid h4 {
            color: #000;
            font-size: 1.2em;
            margin-top: 1em;
            word-spacing: 1.5px;
        }

        /*--teamwork--*/
        .teamwork {
            background: #000;
            padding: 5em 0;
            font-family: title;
        }

        .team-head h3 {
            color: #fff;
            font-size: 2.7em;
            letter-spacing: 1.3px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 10px;
        }

        .team-head h4 {
            color: #fff;
            font-size: 1.1em;
            word-spacing: 2px;
            letter-spacing: 1.2px;
            font-weight: 400;
            text-align: center;
        }

        /* --#flexiselDemo3 {
            display: none;
        }-- */
        .nbs-flexisel-container {
            position: relative;
            max-width: 100%;
        }

        .nbs-flexisel-inner {
            overflow: hidden;
            margin: 3em 0;
        }

        .nbs-flexisel-item > img {
            cursor: pointer;
            position: relative;
        }

        .nbs-flexisel-container {
            position: relative;
            max-width: 100%;
            margin-top: 6%;
        }

        .nbs-flexisel-ul {
            position: relative;
            width: 9999px;
            margin: 0px;
            padding: 0px;
            list-style-type: none;
            text-align: center;
        }

        .nbs-flexisel-inner {
            overflow: hidden;
            margin: 0 auto;
            width: 100%;
        }

        .nbs-flexisel-item {
            float: left;
            margin: 0px;
            padding: 0px;
            cursor: pointer;
            position: relative;
            display: inline-block;
        }

        .course_demo {
            padding: 3% 3% 3% 3%;
        }

        .nbs-flexisel-item img {
            width: 12vw;
            height: 12vw;
            cursor: pointer;
            position: relative;
            margin-bottom: 0px;
            display: inline;
            border-radius: 7px;
            -webkit-border-radius: 7px;
            -moz-border-radius: 7px;
            -o-border-radius: 7px;
        }

        /*** Navigation ***/
        .nbs-flexisel-nav-left,
        .nbs-flexisel-nav-right {
            width: 44px;
            height: 60px;
            position: absolute;
            cursor: pointer;
            z-index: 100;
        }

        .nbs-flexisel-nav-left {
            left: -7em;
            background: url(img/department/left.png) 0px 0px no-repeat;
        }

        .nbs-flexisel-nav-right {
            right: -7em;
            background: url(img/department/right.png) 0px 0px no-repeat;
        }

        .client h3 {
            color: #fff;
            font-weight: 600;
            font-size: 2.1em;
            margin-top: 1em;
        }

        .client h4 {
            color: #fff;
            font-size: 1.3em;
            margin-top: 0.5em;
            word-spacing: 1.5px;
            font-weight: 400;
        }

        .detail .carousel-indicators .active {
            background: #0bf397;
        }

        .detail {
            overflow: hidden;
            padding: 50px 0px 0px 0px;
            min-height: 500px;
        }

        .detail .title {
            margin-bottom: 80px;
            text-align: center;
        }

        .detail .features .row {
            margin-bottom: 40px;
        }

        .detail .carousel h1 {
            font-size: 3.8em;
        }

        .detail .carousel h1, .detail p {
            text-align: left;
            font-weight: 300;
        }

        .detail p {
            color: #aaa;
        }

        .detail .carousel-control {
            background: none;
        }

        .detail .app-screenshot {
            overflow: hidden;
            margin-right: auto;
            margin-left: auto;
            padding-top: 95px;
            width: 320px;
            height: 450px;
            background-size: 100%;
        }

        .detail .app-screenshot img {
            margin-right: auto;
            margin-left: auto;
            padding-left: 4px;
            width: 280px;
        }

        .detail .carousel-indicators {
            position: relative;
            bottom: 0;
            left: 0;
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: 0px;
            padding: 5px;
            padding-bottom: 8px;
            width: 100%;
            border-top: 1px solid #eee;
            background: #ffffff;
        }

        .detail .carousel-indicators .active {
            width: 45px;
            height: 5px;
            border: none;
            border-radius: 0px;
        }

        .detail .carousel-indicators li {
            display: inline-block;
            margin: 1px;
            width: 45px;
            height: 5px;
            border: none;
            border-radius: 0px;
            background: #eeeeee;
            text-indent: -999px;
            cursor: pointer;
        }

        @font-face {
            font-family: title;
            src: url("font/title.TTF");
        }

        .title {
            font-family: title;
            color: white;
        }

        .midContent {
            position: absolute;
            top: 35vh;
            text-align: center;
            width: 100%
        }

        .bgImg {
            height: 100%;
            width: 100%;
            z-index: -1;
        }

    </style>
</head>

<body>

<%@include file="header.jsp" %>


<div style="height: auto;width: 100%">
    <img src="img/department/background.jpg" class="bgImg" id="bg"/>

    <div class="midContent">
        <h1 class="title" style="font-size: 50px;margin-top: 0px;margin-bottom: 0px;color: #030303"
            data-am-scrollspy="{animation:'scale-down'}">${requestScope.department.name}</h1>

        <div><p style="margin-top: 5vh;margin-bottom: 5vh"><b class="title" style="font-size: 20px;color: #085c9f"
                                                              data-am-scrollspy="{animation:'scale-down',delay: 300}">${requestScope.department.introduce}</b>
        </p></div>
        <div><p style="margin-top: 5vh;margin-bottom: 5vh"><b class="title" style="font-size: 20px;color: #085c9f"
                                                              data-am-scrollspy="{animation:'scale-down',delay: 300}">${requestScope.department.destination}</b>
        </p></div>
    </div>
    <div id="teamwork" class="teamwork">
        <div class="container">
            <div class="team-head">
                <h3>部门成员</h3>
                <h4>${requestScope.department.name}</h4>
            </div>
            <div class="clients">
                <div class="course_demo1">
                    <ul id="flexiselDemo1">
                        <c:choose>
                        <c:when test="${empty requestScope.members}">
                        <tr>
                            <th colspan="6">还没有部员加入！</th>
                        </tr>
                        </c:when>
                        <c:when test="${!empty requestScope.members}">
                        <c:forEach var="member" items="${requestScope.members}" varStatus="status">
                        <li>
                            <div class="client">
                                <img src="${requestScope.path}${member.protrait}" style="width: 10vw; height: 10vw"/>

                                <h3>${member.job}</h3>
                                <h4>${member.name}</h4>
                            </div>
                        </li>
                        </c:forEach>
                        </c:when>
                        </c:choose>
                </div>
                <link rel="stylesheet" href="css/department/flexslider.css" type="text/css" media="screen"/>
                <script type="text/javascript">
                    $(window).load(function () {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="js/department/jquery.flexisel.js"></script>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#joinUs").on("mouseenter", function () {
            $("#joinUs").css("color", "#00a8e6")
        })
        $("#joinUs").on("mouseleave", function () {
            $("#joinUs").css("color", "white")
        })
    </script>


    <div id="service" class="service">
        <div class="container">
            <div class="service-head">
                <h3>部门职责</h3>
                <h4>WHAT WE DO?</h4>
            </div>
            <div class="service-grids">

                <c:choose>
                    <c:when test="${empty requestScope.attaches}">
                        <tr>
                            <th colspan="6">还没有添加部门职责！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty requestScope.attaches}">
                        <c:forEach var="attach" items="${requestScope.attaches}" varStatus="status">
                            <c:if test="${attach.type == 'responsibility'}">
                                <div class="col-md-4 service-grid">
                                    <h4>${attach.content}</h4>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <!-- portfolio section -->
    <div id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-sm-12">
                    <h2>成果</h2>
                </div>
            </div>
            <div class="service-grids">

                <c:choose>
                    <c:when test="${empty requestScope.attaches}">
                        <tr>
                            <th colspan="6">还没有添加部门职责！</th>
                        </tr>
                    </c:when>
                    <c:when test="${!empty requestScope.attaches}">
                        <c:forEach var="attach" items="${requestScope.attaches}" varStatus="status">
                            <c:if test="${attach.type == 'responsibility'}">
                                <div class="col-md-12 service-grid">
                                    <p style="color: #fff;font-size: 2.1rem">${attach.content}</p>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <div class="clearfix"></div>
            </div>
            <div class="row mt30">

                <div class="col-md-4 col-sm-4 col-xs-6">
                    <img src="img/department/portfolio-img1.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-6">
                    <img src="img/department/portfolio-img2.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-6">
                    <img src="img/department/portfolio-img3.jpg" alt="portfolio img"></a>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-6">
                    <img src="img/department/portfolio-img4.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <img src="img/department/portfolio-img5.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <img src="img/department/portfolio-img6.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <img src="img/department/portfolio-img7.jpg" alt="portfolio img"></a>
                </div>
                <div class="col-md-12 col-sm-12">
                    <a rel="nofollow" href="index.jsp" class="btn btn-info">View More</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
</body>

</html>
