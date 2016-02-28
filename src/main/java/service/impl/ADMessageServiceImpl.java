package service.impl;

import dao.ADMessageDao;
import domain.ADMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ADMessageService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/25.
 */
@Service("ADMessageService")
public class ADMessageServiceImpl implements ADMessageService {

    @Autowired
    ADMessageDao adMessageDao;

    @Override
    public void add(ADMessage adMessage) {
        adMessageDao.add(adMessage);
    }

    @Override
    public void update(ADMessage adMessage) {
        adMessageDao.update(adMessage);
    }

    @Override
    public void delete(ADMessage adMessage) {
        adMessageDao.delete(adMessage);
    }

    @Override
    public ADMessage retriveById(String id) {
        return adMessageDao.retriveById(Integer.parseInt(id));
    }

    @Override
    public int retriveCounts() {
        return adMessageDao.retriveCounts();
    }

    @Override
    public int retriveCountsByKey(String key) {
        return adMessageDao.retriveCountsByKey(key);
    }

    @Override
    public List<ADMessage> retriveByPageNumber(String number) {
        return adMessageDao.retriveByPageNumber(Integer.parseInt(number));
    }

    @Override
    public List<ADMessage> retriveByPageAndKey(String number, String key) {
        return adMessageDao.retrivePageAndKey(Integer.parseInt(number),key);
    }

    @Override
    public int retrivePageNumber() {
        return adMessageDao.retrivePageNumber();
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        return adMessageDao.retrivePageNumberByKey(key);
    }

    @Override
    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber) {
        int start = targetPage - 2;
        int end = targetPage + 2;

        if (pageNumber > 5) {
            while (start < 1) {
                start++;
                end++;
            }
            while (end > pageNumber) {
                start--;
                end--;
            }
        } else {
            start = 1;
            end = pageNumber;
        }
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", start);
        map.put("end", end);
        return map;
    }
}
