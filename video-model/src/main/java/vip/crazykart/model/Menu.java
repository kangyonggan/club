package vip.crazykart.model;

import com.github.ofofs.jca.annotation.Serial;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Table(name = "tb_menu")
@Data
@Serial
public class Menu {
    /**
     * 主键, 自增
     */
    @Id
    @Column(name = "menu_id")
    private Long menuId;

    /**
     * 菜单代码
     */
    @Column(name = "menu_code")
    private String menuCode;

    /**
     * 菜单名称
     */
    @Column(name = "menu_name")
    private String menuName;

    /**
     * 父菜单代码
     */
    @Column(name = "parent_code")
    private String parentCode;

    /**
     * 菜单地址
     */
    private String url;

    /**
     * 菜单排序(从0开始)
     */
    private Integer sort;

    /**
     * 菜单图标的样式
     */
    private String icon;

    /**
     * 逻辑删除:{0:未删除, 1:已删除}
     */
    @Column(name = "is_deleted")
    private Byte isDeleted;

    /**
     * 创建时间
     */
    @Column(name = "created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @Column(name = "updated_time")
    private Date updatedTime;

    /**
     * 子节点
     */
    @Transient
    private List<Menu> leaf;

    /**
     * 父菜单ID
     */
    @Transient
    private Long pid;
}