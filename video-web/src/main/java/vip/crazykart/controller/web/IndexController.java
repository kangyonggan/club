package vip.crazykart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vip.crazykart.controller.BaseController;
import vip.crazykart.model.Video;
import vip.crazykart.service.VideoService;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/6/18
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

    @Autowired
    private VideoService videoService;

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @GetMapping
    public String index(Model model) {
        // 热门视频
        List<Video> hotVideos = videoService.findHotVideos();
        // 最新视频
        List<Video> newVideos = videoService.findNewVideos();
        // 站长推荐
        List<Video> topVideos = videoService.findTopVideos();

        model.addAttribute("hotVideos", hotVideos);
        model.addAttribute("newVideos", newVideos);
        model.addAttribute("topVideos", topVideos);
        return "web/index";
    }

}
