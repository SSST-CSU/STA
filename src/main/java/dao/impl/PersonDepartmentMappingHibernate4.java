package dao.impl;

import dao.PersonDepartmentMapping;
import domain.Department;
import domain.Person;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class PersonDepartmentMappingHibernate4 extends BaseDaoHibernate4 implements PersonDepartmentMapping {
    @Override
    public void addMapping(Department department, Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Department d = (Department) session.get(Department.class, department.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        d.getMenberList().add(p);
        p.getDepartments().add(d);

        transaction.commit();
    }

    @Override
    public void deleteMapping(Department department, Person person) {
        Session session = getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Department d = (Department) session.get(Department.class, department.getId());
        Person p = (Person) session.get(Person.class, person.getId());

        d.getMenberList().remove(p);
        p.getDepartments().remove(d);

        transaction.commit();
    }
}
