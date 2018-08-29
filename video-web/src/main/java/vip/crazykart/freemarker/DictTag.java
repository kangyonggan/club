package vip.crazykart.freemarker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import vip.crazykart.model.Dict;
import vip.crazykart.service.DictService;

import java.util.List;

/**
 * @author kangyonggan
 * @since 5/4/18
 */
@Component
public class DictTag extends AbstractFunctionTag {

    @Autowired
    private DictService dictService;

    /**
     * 获取字典列表, 根据type
     *
     * @param arguments 参数
     * @return 返回字典列表
     */
    public List<Dict> list(List arguments) {
        if (!hasLessTwoArgs(arguments)) {
            throw new RuntimeException("获取字典列表必须指定字典类型dict_type！");
        }
        String dictType = arguments.get(1).toString();
        return dictService.findDictsByDictType(dictType);
    }

}
