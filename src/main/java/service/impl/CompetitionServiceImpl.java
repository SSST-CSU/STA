package service.impl;

import dao.CompetitionDAO;
import domain.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CompetitionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Service("CompetitionService")
public class CompetitionServiceImpl implements CompetitionService {

    @Autowired
    private CompetitionDAO competitionDAO;

    @Override
    public void add(Competition competition) {
        competitionDAO.save(competition);
    }

    @Override
    public void update(Competition competition) {
        competitionDAO.update(competition);
    }

    @Override
    public void delete(Competition competition) {
        competitionDAO.delete(competition);
    }

    @Override
    public Competition retriveById(String id) {
        return competitionDAO.retriveById(Integer.parseInt(id));
    }

    @Override
    public int retriveCounts() {
        return competitionDAO.retriveCounts();
    }

    @Override
    public int retriveCountsByKey(String key) {
        return competitionDAO.retriveCountsByKey(key);
    }

    @Override
    public List<Competition> retriveByPageNumber(String number) {
        return competitionDAO.retriveByPageNumber(Integer.parseInt(number));
    }

    @Override
    public List<Competition> retriveByPageAndKey(String number, String key) {
        return competitionDAO.retrivePageAndKey(Integer.parseInt(number),key);
    }

    @Override
    public int retrivePageNumber() {
        return competitionDAO.retrivePageNumber();
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        return competitionDAO.retrivePageNumberByKey(key);
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
