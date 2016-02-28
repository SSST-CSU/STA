package dao;

import domain.ADMessage;
import domain.Attach;
import domain.Competition;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/25.
 */
@Component
public interface ADMessageDao extends BaseDao<ADMessage>{

    public void add(ADMessage adMessage);

    public void update(ADMessage adMessage);

    public void delete(ADMessage adMessage);

    public ADMessage retriveById(int id);


    public List<ADMessage> retriveByPageNumber(int number);

    public List<ADMessage> retrivePageAndKey(int number, String key);

    public int retriveCounts();

    public int retrivePageNumber();

    public int retriveCountsByKey(String key);

    public int retrivePageNumberByKey(String key);


}
