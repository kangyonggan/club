package vip.crazykart.service;

import vip.crazykart.model.Video;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
public interface VideoService {

    /**
     * 热门视频
     *
     * @return
     */
    List<Video> findHotVideos();

    /**
     * 最新视频
     *
     * @return
     */
    List<Video> findNewVideos();

    /**
     * 站长推荐
     *
     * @return
     */
    List<Video> findTopVideos();

    /**
     * 查找视频
     *
     * @param id
     * @return
     */
    Video findVideoByVideoId(Long id);
}
