package dao.impl;

import dao.AdminDao;
import domain.Admin;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/26.
 */
@Component
public class AdminDaohibernate4 extends BaseDaoHibernate4<Admin> implements AdminDao {
    @Override
    public void add(Admin admin) {
        super.save(admin);
    }

    @Override
    public void update(Admin admin) {
        super.update(admin);
    }

    @Override
    public void delete(Admin admin) {
        super.delete(admin);
    }

    @Override
    public Admin retriveById(int id) {
        return super.get(Admin.class, id);
    }

    @Override
    public List<Admin> retriveAll() {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Admin order by id desc ");

        return query.list();
    }

    @Override
    public Admin adminLogin(String account, String passwrod) {

        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Admin where account = ? and password = ?");
        query.setString(0,account);
        query.setString(1,passwrod);

        List<Admin> admins = query.list();
        if (admins.size() > 0) return admins.get(0);
        else return null;
    }
}
