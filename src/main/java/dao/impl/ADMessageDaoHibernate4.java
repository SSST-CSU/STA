package dao.impl;

import dao.ADMessageDao;
import domain.ADMessage;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/2/25.
 */
@Component
public class ADMessageDaoHibernate4 extends BaseDaoHibernate4<ADMessage> implements ADMessageDao {

    int pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_ADMIN_MESSAGE;

    @Override
    public void add(ADMessage adMessage) {
        super.save(adMessage);
    }

    @Override
    public void update(ADMessage adMessage) {
        super.update(adMessage);
    }

    @Override
    public void delete(ADMessage adMessage) {
        super.delete(adMessage);
    }

    @Override
    public ADMessage retriveById(int id) {
        return super.get(ADMessage.class,id);
    }

    @Override
    public List<ADMessage> retriveByPageNumber(int number) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from ADMessage order by id desc");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Override
    public List<ADMessage> retrivePageAndKey(int number, String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from ADMessage where type like ? order by id desc");
        query.setString(0, "%" + key + "%");
        query.setFirstResult((number - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Override
    public int retriveCounts() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from ADMessage");
        int result = Integer.parseInt(query.uniqueResult().toString());
        session.close();
        return result;
    }

    @Override
    public int retrivePageNumber() {
        int count = retriveCounts();
        int pagenumber = (count / pageSize);
        if (count % pageSize != 0 && count > 0) {
            pagenumber++;
        }
        return pagenumber;
    }

    @Override
    public int retriveCountsByKey(String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from ADMessage where type like ?");
        query.setString(0, "%" + key + "%");
        int result = Integer.parseInt(query.uniqueResult().toString());
        return result;
    }

    @Override
    public int retrivePageNumberByKey(String key) {
        int count = retriveCountsByKey(key);
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }
}
