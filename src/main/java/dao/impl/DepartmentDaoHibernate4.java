package dao.impl;

import dao.DepartmentDAO;
import domain.Department;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class DepartmentDaoHibernate4 extends BaseDaoHibernate4<Department> implements DepartmentDAO {
    @Override
    public void add(Department department) {
        super.save(department);
    }

    @Override
    public Department retriveByName(String name) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Department where name = ?");
        query.setString(0, name);
        List<Department> departments = query.list();
        if (departments.size() > 0) return departments.get(0);
        else return null;
    }

    @Override
    public List<Department> retriveAll() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Department");
        List<Department> departments = query.list();
        return departments;
    }

    @Override
    public void update(Department department) {
        super.update(department);
    }

    @Override
    public void delete(Department department) {
        super.delete(department);
    }

    @Override
    public Department retriveBuId(int id) {
        return super.get(Department.class, id);
    }
}
