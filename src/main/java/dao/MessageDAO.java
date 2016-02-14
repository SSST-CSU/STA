package dao;

import domain.Message;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/13.
 */
@Component
public interface MessageDAO extends BaseDao<Message> {

    public void add(Message message);
    public void delete(Message message);
    public void update(Message message);
    public Message retriveById(int id);
    public List<Message> retriveAllByPersonId(int personId);
    public List<Message> retriveByPageAndPersonId(int targetPage,int personId);
    public int retriveCountsByPageAndPersonId(int personId);
    public int retrivePageNumberByPageAndPersonId(int personId);

}
