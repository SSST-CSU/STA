package service;

import domain.Lecture;
import domain.Person;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/20.
 */
@Service()
@Transactional
public interface LectureService {

    public void add(Lecture lecture);

    public void update(Lecture lecture);

    public void delete(Lecture lecture);

    public Lecture retriveById(String id);

    public int retriveCounts();

    public int retriveCountsByKey(String key);

    public List<Lecture> retriveByPageNumber(String number);

    public List<Lecture> retriveByPageAndKey(String number, String key);

    public int retrivePageNumber();

    public int retrivePageNumberOfKey(String key);

    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);

    public String applyToJoinLecture(Person person, Lecture lecture);

    public HSSFWorkbook exportParticipants(List<Person> persons);
}
