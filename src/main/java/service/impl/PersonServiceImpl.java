package service.impl;

import dao.PersonDao;
import domain.Lecture;
import domain.Person;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PersonService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/22.
 */
@Service("PersonService")
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonDao personDao;

    @Override
    public Person login(String account, String password) {
        return personDao.retriveByAccountAndPassword(account, password);
    }

    @Override
    public Person retriveByAccount(String account) {
        return personDao.retriveByAccount(account);
    }

    @Override
    public void register(Person person) {
        personDao.add(person);
    }

    @Override
    public boolean isAccountExist(String name) {
        Boolean isExist = false;
        Person person = personDao.retriveByAccount(name);
        if (person == null) isExist = false;
        else isExist = true;
        return isExist;
    }

    @Override
    public Person retriveById(int id) {
        return personDao.retriveById(id);
    }

    @Override
    public Person savePersonInfo(Person person, String saveItem) {
        Person oldPerson = retriveByAccount(person.getAccount());

        if (saveItem.equals("personInfo")) {
            oldPerson.setClasses(person.getClasses());
            oldPerson.setQq(person.getQq());
            oldPerson.setTel(person.getTel());
            oldPerson.setMail(person.getMail());
            oldPerson.setWechat(person.getWechat());
            oldPerson.setHobby(person.getHobby());
            oldPerson.setSpeciality(person.getSpeciality());
            oldPerson.setIntroduce(person.getIntroduce());
        } else if (saveItem.equals("password")) {
            oldPerson.setPassword(person.getPassword());
        } else if (saveItem.equals("avatar")) {
            oldPerson.setProtrait(person.getProtrait());
        }
        personDao.update(oldPerson);
        return oldPerson;
    }

    @Override
    public int retriveCounts() {
        return personDao.retriveCounts();
    }

    @Override
    public int retriveCountsByKey(String key) {
        return personDao.retriveCountsByKey(key);
    }

    @Override
    public List<Person> retriveByPageNumber(String number) {
        return personDao.retriveByPageNumber(Integer.parseInt(number));
    }

    @Override
    public List<Person> retriveByPageAndKey(String number, String key) {
        return personDao.retrivePageAndKey(Integer.parseInt(number), key);
    }

    @Override
    public int retrivePageNumber() {
        return personDao.retrivePageNumber();
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        return personDao.retrivePageNumberByKey(key);
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

    @Override
    public void modifyUserPassword(String id, String password) {
        Person person = retriveById(Integer.parseInt(id));
        person.setPassword(password);
        personDao.update(person);
    }

    @Override
    public List<Person> retriveByDepartment(String name) {
        return personDao.retriveByDepartment(name);
    }

    @Override
    public String deletePerson(Person person) {

        personDao.delete(person);

        return "success";
    }
}
