package dao.impl;

import dao.AttachDao;
import domain.Attach;
import domain.Competition;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/24.
 */
@Component
public class AttachDaohibernate4 extends BaseDaoHibernate4<Attach> implements AttachDao {
    /**
     * 添加一个附加信息
     *
     * @param attach
     */
    @Override
    public void add(Attach attach) {
        super.save(attach);
    }

    /**
     * 更新一个附加的信息
     *
     * @param attach
     */
    @Override
    public void update(Attach attach) {
        super.update(attach);
    }

    /**
     * 删除一个附加信息
     *
     * @param attach
     */
    @Override
    public void delete(Attach attach) {
        super.delete(attach);
    }

    /**
     * 根据附加消息id查找附加消息信息
     *
     * @param id
     */
    @Override
    public Attach retriveById(int id) {
        return super.get(Attach.class,id);
    }

    /**
     * 根据部门名称查找附加消息
     *
     * @param name
     * @return
     */
    @Override
    public List<Attach> retriveByDepartmentName(String name) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Attach where mark = ?");
        query.setString(0,name);
        return query.list();
    }
}
