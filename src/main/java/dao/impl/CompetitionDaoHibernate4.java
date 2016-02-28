package dao.impl;

import dao.CompetitionDAO;
import domain.Competition;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class CompetitionDaoHibernate4 extends BaseDaoHibernate4<Competition> implements CompetitionDAO {

    int pageSize;

    public CompetitionDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_COMPETITION;
    }

    @Override
    public void add(Competition competition) {
        super.save(competition);
    }

    @Override
    public Competition retriveByName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Competition where name = ?");
        query.setString(0, name);
        List<Competition> competitions = query.list();
        if (competitions.size() > 0) {
            return competitions.get(0);
        } else return null;
    }

    @Override
    public List<Competition> retriveAll() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Competition");
        List<Competition> competitions = query.list();
        return competitions;
    }

    @Override
    public void update(Competition competition) {
        super.update(competition);
    }

    @Override
    public void delete(Competition competition) {
        super.delete(competition);
    }

    /**
     * 根据讲座id查找讲座信息
     *
     * @param id
     */
    @Override
    public Competition retriveById(int id) {
        return super.get(Competition.class,id);
    }

    /**
     * 分页查询团队信息
     *
     * @param number
     * @return
     */
    @Override
    public List<Competition> retriveByPageNumber(int number) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Competition order by id desc");
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
    public List<Competition> retrivePageAndKey(int number, String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Competition where name like ? order by id desc");
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
        Query query = session.createQuery("select count(id) from Competition");
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
        Query query = session.createQuery("select count(id) from Competition where name like ?");
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
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }
}
