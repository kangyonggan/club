package vip.crazykart.service.impl;

import com.github.ofofs.jca.annotation.Log;
import com.github.pagehelper.PageHelper;
import com.kangyonggan.common.BaseService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import vip.crazykart.constants.Status;
import vip.crazykart.constants.YesNo;
import vip.crazykart.model.Video;
import vip.crazykart.service.VideoService;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/29/18
 */
@Service
public class VideoServiceImpl extends BaseService<Video> implements VideoService {

    @Override
    @Log
    public List<Video> findHotVideos() {
        Example example = new Example(Video.class);
        example.createCriteria().andEqualTo("status", Status.Y.getCode()).andEqualTo("isDeleted", YesNo.NO.getCode());

        example.setOrderByClause("hits desc");
        PageHelper.startPage(1, 10);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public List<Video> findNewVideos() {
        Example example = new Example(Video.class);
        example.createCriteria().andEqualTo("status", Status.Y.getCode()).andEqualTo("isDeleted", YesNo.NO.getCode());

        example.setOrderByClause("video_id desc");
        PageHelper.startPage(1, 10);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public List<Video> findTopVideos() {
        Example example = new Example(Video.class);
        example.createCriteria().andEqualTo("status", Status.Y.getCode())
                .andEqualTo("isDeleted", YesNo.NO.getCode()).andEqualTo("isTop", YesNo.YES.getCode());

        example.setOrderByClause("video_id desc");
        PageHelper.startPage(1, 10);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public Video findVideoByVideoId(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }
}
