package dao;

import domain.Department;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/14.
 */
@Component
public interface DepartmentDAO extends BaseDao<Department> {
    /**
     * 添加一个部门信息
     *
     * @param department
     */
    public void add(Department department);

    /**
     * 根据部门名称查找部门信息
     *
     * @param name
     * @return
     */
    public Department retriveByName(String name);

    /**
     * 查找所有的部门部门信息
     *
     * @return
     */
    public List<Department> retriveAll();

    /**
     * 更新一个部门的信息
     *
     * @param department
     */
    public void update(Department department);

    /**
     * 删除一个部门
     *
     * @param department
     */
    public void delete(Department department);

    public Department retriveBuId(int id);

}
