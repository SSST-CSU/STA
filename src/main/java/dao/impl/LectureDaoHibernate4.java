package dao.impl;

import dao.LectureDAO;
import domain.Lecture;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.util.List;

/**
 * Created by martsforever on 2016/1/24.
 */
@Component
public class LectureDaoHibernate4 extends BaseDaoHibernate4<Lecture> implements LectureDAO {

    private int pageSize;

    public LectureDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_LECTURE;
    }

    @Override
    public void add(Lecture lecture) {
        super.save(lecture);
    }

    @Override
    public Lecture retriveByName(String name) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Lecture where name = ?");
        query.setString(0, name);
        List<Lecture> lectures = query.list();
        if (lectures.size() > 0) return lectures.get(0);
        else return null;
    }

    @Override
    public List<Lecture> retriveAll() {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Lecture");
        List<Lecture> lectures = query.list();
        return lectures;
    }

    @Override
    public void update(Lecture lecture) {
        super.update(lecture);
    }

    @Override
    public void delete(Lecture lecture) {
        super.delete(lecture);
    }

    /**
     * 根据讲座id查找讲座信息
     *
     * @param id
     */
    @Override
    public Lecture retriveById(int id) {
        return super.get(Lecture.class, id);
    }

    /**
     * 分页查询团队信息
     *
     * @param number
     * @return
     */
    @Override
    public List<Lecture> retriveByPageNumber(int number) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Lecture order by id desc");
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
    public List<Lecture> retrivePageAndKey(int number, String key) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Lecture where name like ? order by id desc");
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
        Query query = session.createQuery("select count(id) from Lecture");
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
        Query query = session.createQuery("select count(id) from Lecture where name like ?");
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
