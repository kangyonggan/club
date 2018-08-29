package vip.crazykart.mapper;

import com.kangyonggan.common.mybatis.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import vip.crazykart.model.Role;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/8/18
 */
@Mapper
public interface RoleMapper extends MyMapper<Role> {

}