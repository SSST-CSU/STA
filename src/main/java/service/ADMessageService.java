package service;

import domain.ADMessage;
import domain.Competition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/25.
 */
@Service()
@Transactional
public interface ADMessageService {

    public void add(ADMessage adMessage);

    public void update(ADMessage adMessage);

    public void delete(ADMessage adMessage);

    public ADMessage retriveById(String id);

    public int retriveCounts();

    public int retriveCountsByKey(String key);

    public List<ADMessage> retriveByPageNumber(String number);

    public List<ADMessage> retriveByPageAndKey(String number, String key);

    public int retrivePageNumber();

    public int retrivePageNumberOfKey(String key);

    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);


}
