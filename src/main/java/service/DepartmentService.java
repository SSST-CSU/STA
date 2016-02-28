package service;

import domain.Department;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by martsforever on 2016/2/25.
 */
@Service()
@Transactional
public interface DepartmentService {

    public Department retriveById(String id);

    public boolean update(Department department);

    public Department retriveByName(String name);

}

