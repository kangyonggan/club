package vip.crazykart.service;

import vip.crazykart.model.Dict;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
public interface DictService {

    /**
     * 根据字典类型查找字典
     *
     * @param dictType
     * @return
     */
    List<Dict> findDictsByDictType(String dictType);

    /**
     * 查找字典
     *
     * @param type
     * @param code
     * @return
     */
    Dict findDictByDictTypeAndCode(String type, String code);
}
