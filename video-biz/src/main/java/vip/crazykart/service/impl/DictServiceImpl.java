package vip.crazykart.service.impl;

import com.github.ofofs.jca.annotation.Log;
import com.kangyonggan.common.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import vip.crazykart.constants.YesNo;
import vip.crazykart.model.Dict;
import vip.crazykart.service.DictService;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
@Service
public class DictServiceImpl extends BaseService<Dict> implements DictService {

    @Override
    @Log
    public List<Dict> findDictsByDictType(String dictType) {
        Example example = new Example(Dict.class);
        example.createCriteria().andEqualTo("isDeleted", YesNo.NO.getCode()).andEqualTo("dictType", dictType);

        example.setOrderByClause("sort asc");
        return myMapper.selectByExample(example);
    }

}
