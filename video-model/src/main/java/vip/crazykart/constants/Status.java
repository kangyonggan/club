package vip.crazykart.constants;

import lombok.Getter;
import vip.crazykart.annotation.Enum;

/**
 * 审批状态枚举
 *
 * @author kangyonggan
 * @since 8/9/18
 */
@Enum
public enum Status {

    /**
     * 待审批
     */
    N("N", "待审批"),

    /**
     * 已拒绝
     */
    R("R", "已拒绝"),

    /**
     * 已审批
     */
    Y("Y", "已审批");

    /**
     * 代码
     */
    @Getter
    private final String code;

    /**
     * 名称
     */
    @Getter
    private final String name;

    Status(String code, String name) {
        this.code = code;
        this.name = name;
    }
}