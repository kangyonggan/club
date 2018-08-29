package vip.crazykart.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Table(name = "tb_video")
@Data
public class Video {
    /**
     * 视频ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long videoId;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String summary;

    /**
     * 分类
     */
    private String type;

    /**
     * 作者
     */
    @Column(name = "user_id")
    private Long userId;

    /**
     * 地图
     */
    @Column(name = "map_code")
    private String mapCode;

    /**
     * 播放次数
     */
    private Integer hits;

    /**
     * 是否推荐
     */
    @Column(name = "is_top")
    private Byte isTop;

    /**
     * 视频封面
     */
    private String cover;

    /**
     * 视频路径
     */
    private String src;

    /**
     * 审批状态:{N:待审批, R:已拒绝, Y:已审批}
     */
    private String status;

    /**
     * 审批意见
     */
    @Column(name = "reply_msg")
    private String replyMsg;

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
}