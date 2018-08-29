package vip.crazykart.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import vip.crazykart.controller.BaseController;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
@Controller
@RequestMapping("video")
public class VideoController extends BaseController {

    /**
     * 播放
     *
     * @param id
     * @return
     */
    @RequestMapping("{id:[\\d]+}")
    public String detail(@PathVariable("id") Long id) {
        return "web/video/detail";
    }

}
