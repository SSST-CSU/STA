package dao;

import domain.Attach;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/24.
 */
@Component
public interface AttachDao extends BaseDao<Attach> {
    /**
     * 添加一个附加信息
     */
    public void add(Attach attach);

    /**
     * 更新一个附加的信息
     */
    public void update(Attach attach);

    /**
     * 删除一个附加信息
     */
    public void delete(Attach attach);

    /**
     *根据附加消息id查找附加消息信息
     *
     * @param id
     */
    public Attach retriveById(int id);

    /**根据部门名称查找附加消息
     * @param name
     * @return
     */
    public List<Attach> retriveByDepartmentName(String name);

}
