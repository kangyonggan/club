<#assign title="首页"/>

<@override name="style">
<link rel="stylesheet" href="${ctx}/libs/jquery3dlb/css/public.css"/>
<link rel="stylesheet" href="${ctx}/libs/jquery3dlb/css/index.css"/>
</@override>

<@override name="breadcrumbs">
<li>${title}</li>
</@override>

<@override name="main">
<!--轮播-->
<div class="lb_gl">
    <div class="container">
        <h1 class="turn_3d">最新视频</h1>
        <div class="pictureSlider poster-main">
            <div class="poster-btn poster-prev-btn"></div>
            <ul id="new-videos" class="poster-list">
                <#list 1..7 as i>
                    <li class="poster-item  zturn-item">
                        <p class="xxgy">无转超级起步简明教程</p>
                        <div class="for_btn">
                            <img src="${ctx}/app/images/${i}.jpg" width="100%">
                            <a href="#" class="in_page">
                                <img src="${ctx}/libs/jquery3dlb/images/iconin.png"/>
                            </a>
                        </div>

                        <div class="students_star">
                            <p class="cell_list">
                                <span class="lf">作者：<span class="darks">东方骄子-康帝</span>
                                </span>
                                <span class="rt">日期：<span class="darks">2018-08-29</span>
                                </span>
                            </p>
                            <div class="zwjs">
                                正所谓好的开头，是成功的一般，一步先步步先！每局都会有起步，所以练习超级起步是必不可少的
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
</@override>

<@override name="script">
    <script src="${ctx}/libs/jquery3dlb/js/zturn.js"></script>
    <script>
        $(function () {
            new zturn({
                id: "new-videos",
                opacity: 0.9,
                width: 382,
                Awidth: 1024,
                scale: 0.9,
                auto: true,
                turning: 2000
            })
        })
    </script>
</@override>

<@extends name="layout.ftl"/>