package dao.impl;

import dao.MessageDAO;
import domain.Message;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import util.ConstantUtil;

import java.io.Serializable;
import java.util.List;

/**
 * Created by martsforever on 2016/2/13.
 */
@Component
public class MessageDaoHibernate4 extends BaseDaoHibernate4<Message> implements MessageDAO{

    private int pageSize;

    public MessageDaoHibernate4() {
        pageSize = ConstantUtil.NUMBER_OF_RECORDS_IN_SITE_MESSAGE;
    }

    @Override
    public void add(Message message) {
        super.save(message);
    }

    @Override
    public Message retriveById(int id) {
        return super.get(Message.class,id);
    }

    @Override
    public List<Message> retriveAllByPersonId(int personId) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Message where receiverId = ? order by id desc ");
        query.setInteger(0, personId);
        return query.list();
    }

    @Override
    public List<Message> retriveByPageAndPersonId(int targetPage, int personId) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Message where receiverId = ? order by id desc ");
        query.setInteger(0,personId);
        query.setFirstResult((targetPage-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    @Override
    public int retriveCountsByPageAndPersonId(int personId) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("select count(id) from Message where receiverId = ?");
        query.setInteger(0,personId);
        return Integer.parseInt(query.uniqueResult().toString());
    }

    @Override
    public int retrivePageNumberByPageAndPersonId(int personId) {
        int count = retriveCountsByPageAndPersonId(personId);
        int pagenumber = (count/pageSize);
        if (count%pageSize != 0 && count > 0){
            pagenumber ++;
        }
        return pagenumber;
    }
}
