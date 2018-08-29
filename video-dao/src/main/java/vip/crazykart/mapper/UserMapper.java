package vip.crazykart.mapper;

import com.kangyonggan.common.mybatis.MyMapper;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import tk.mybatis.mapper.provider.SqlServerProvider;
import vip.crazykart.model.User;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Mapper
public interface UserMapper extends MyMapper<User> {

    /**
     * 重新指定主键
     *
     * @param user
     * @return
     */
    @Options(useGeneratedKeys = true, keyProperty = "userId")
    @InsertProvider(type = SqlServerProvider.class, method = "dynamicSQL")
    @Override
    int insertSelective(User user);

}