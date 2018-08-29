<div class="lb_gl">
    <div class="container">
        <h1 class="turn_3d">${videoType}</h1>
        <div class="pictureSlider poster-main">
            <div class="poster-btn poster-prev-btn"></div>
            <ul id="${videosId}" class="poster-list">
            <#list videos as video>
                <li class="poster-item zturn-item">
                    <p class="xxgy" title="${video.title}">
                        <@ca.substring video.title 9/>
                    </p>
                    <div class="for_btn">
                        <a href="${ctx}/video/${video.videoId}">
                            <img src="${ctx}/${video.cover}" width="100%">
                        </a>
                        <a href="#" class="in_page">
                            <img src="${ctx}/libs/jquery3dlb/images/iconin.png"/>
                        </a>
                    </div>

                    <div class="students_star">
                        <p class="cell_list">
                                <span class="lf">作者：<span class="darks">
                                    <@ca.substring video.name!'' 7/>
                                </span>
                                </span>
                            <span class="rt">日期：<span class="darks">${video.createdTime?date}</span>
                                </span>
                        </p>
                        <div class="zwjs">
                        ${video.summary}
                        </div>
                    </div>
                </li>
            </#list>
            </ul>
        </div>
    </div>
</div>