package dao.impl;

import dao.PersonDao;
import domain.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/1/22.
 */
@Component("PersonDaoHibernate4")
public class PersonDaoHibernate4 extends BaseDaoHibernate4<Person> implements PersonDao {

    private int pageSize;

    public PersonDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_ADMIN_USER;
    }

    @Override
    public void add(Person person) {
        super.save(person);
    }

    @Override
    public Person retriveByAccount(String account) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person where account = ?");
        query.setString(0, account);

        List<Person> persons = query.list();

        if (persons.size() > 0)
            return persons.get(0);
        else return null;

    }

    @Override
    public Person retriveByAccountAndPassword(String account, String password) {
        Person person = null;

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person where account = ? and password = ?");
        query.setString(0, account);
        query.setString(1, password);

        List<Person> persons = query.list();
        if (persons.size() > 0)
            person = persons.get(0);

        return person;
    }

    @Override
    public List<Person> retriveByName(String name) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person where name like ?");//from PersonInfo where name = ?XXX
        query.setString(0, "%" + name + "%");//这里是模糊查询，表示查询名字里面只要有这个名字就算一个查询结果
        List<Person> persons = query.list();
        if (persons.size() > 0)
            return persons;
        else return null;
    }

    @Override
    public List<Person> retriveAll() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person");
        List<Person> persons = query.list();
        if (persons.size() > 0)
            return persons;
        else return null;
    }

    @Override
    public void update(Person person) {
        super.update(person);
    }

    @Override
    public void delete(Person person) {
        super.delete(person);
    }

    @Override
    public Person retriveById(int id) {
        return super.get(Person.class, id);
    }

    @Override
    public List<Person> retriveByPageNumber(int number) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person order by id desc");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();

    }

    /**
     * 根据关键字分页查询讲座信息
     *
     * @param number
     * @param key
     * @return
     */
    @Override
    public List<Person> retrivePageAndKey(int number, String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person where name like ? order by id desc");
        query.setString(0, "%" + key + "%");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    /**
     * 查询数据库中总的记录的个数
     *
     * @return
     */
    @Override
    public int retriveCounts() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Person");
        int result = Integer.parseInt(query.uniqueResult().toString());
        session.close();
        return result;
    }

    /**
     * 查询分页之后的总的页数
     *
     * @return
     */
    @Override
    public int retrivePageNumber() {
        int count = retriveCounts();
        int pagenumber = (count / pageSize);
        if (count % pageSize != 0 && count > 0) {
            pagenumber++;
        }
        return pagenumber;
    }

    /**
     * 查询根据关键字查询得到结果的总记录的个数
     *
     * @param key
     * @return
     */
    @Override
    public int retriveCountsByKey(String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Person where name like ?");
        query.setString(0, "%" + key + "%");
        int result = Integer.parseInt(query.uniqueResult().toString());
        return result;
    }

    /**
     * 根据关键字查询团队信息的总页数
     *
     * @param key
     * @return
     */
    @Override
    public int retrivePageNumberByKey(String key) {
        int count = retriveCountsByKey(key);
        int pagenumber = (count / pageSize);
        if (count % pageSize != 0 && count > 0) {
            pagenumber++;
        }
        return pagenumber;
    }

    @Override
    public List<Person> retriveByDepartment(String name) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Person where department = ?");
        query.setString(0,name);

        return query.list();
    }
}
