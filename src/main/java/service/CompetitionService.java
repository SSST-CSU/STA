package service;

import domain.Competition;
import domain.Lecture;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Service()
@Transactional
public interface CompetitionService {

    public void add(Competition lecture);

    public void update(Competition lecture);

    public void delete(Competition lecture);

    public Competition retriveById(String id);

    public int retriveCounts();

    public int retriveCountsByKey(String key);

    public List<Competition> retriveByPageNumber(String number);

    public List<Competition> retriveByPageAndKey(String number, String key);

    public int retrivePageNumber();

    public int retrivePageNumberOfKey(String key);

    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);

}
