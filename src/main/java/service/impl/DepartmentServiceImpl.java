package service.impl;

import dao.DepartmentDAO;
import domain.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.DepartmentService;

/**
 * Created by martsforever on 2016/2/25.
 */
@Service("DepartmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentDAO departmentDAO;

    @Override
    public Department retriveById(String id) {
        return departmentDAO.retriveBuId(Integer.parseInt(id));
    }

    @Override
    public boolean update(Department department) {
        boolean flag = false;
        departmentDAO.update(department);
        flag = true;
        return flag;
    }

    @Override
    public Department retriveByName(String name) {
        return departmentDAO.retriveByName(name);
    }
}
