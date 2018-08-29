package vip.crazykart.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vip.crazykart.controller.BaseController;

/**
 * @author kangyonggan
 * @since 8/6/18
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

    /**
     * 首页
     *
     * @return
     */
    @GetMapping
    public String index() {
        return "web/index";
    }

}
