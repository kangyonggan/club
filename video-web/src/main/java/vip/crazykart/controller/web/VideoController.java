package vip.crazykart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import vip.crazykart.controller.BaseController;
import vip.crazykart.model.Dict;
import vip.crazykart.model.Video;
import vip.crazykart.service.DictService;
import vip.crazykart.service.VideoService;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
@Controller
@RequestMapping("video")
public class VideoController extends BaseController {

    @Autowired
    private VideoService videoService;

    @Autowired
    private DictService dictService;

    /**
     * 播放
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("{id:[\\d]+}")
    public String detail(@PathVariable("id") Long id, Model model) {
        Video video = videoService.findVideoByVideoId(id);
        Dict dict = dictService.findDictByDictTypeAndCode("VIDEO_TYPE", video.getType());

        model.addAttribute("video", video);
        model.addAttribute("currDict", dict);
        return "web/video/detail";
    }

}
