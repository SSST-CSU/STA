package service;

import domain.Lecture;
import domain.Person;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/22.
 */
@Service()
@Transactional
public interface PersonService {

    /**
     * 根据用户名密码进行登录，登录成功则返回用户信息，失败返回null值
     *
     * @param account
     * @param password
     * @return
     */
    public Person login(String account, String password);

    /**
     * 根据用户账号获取用户信息
     *
     * @param account
     * @return
     */
    public Person retriveByAccount(String account);


    /**
     * 注册用户信息
     *
     * @param person
     */
    public void register(Person person);

    /**
     * 判断用户名是否存在
     *
     * @param name
     * @return
     */
    public boolean isAccountExist(String name);

    /**
     * 根据用户id查找用户信息
     *
     * @param id
     * @return
     */
    public Person retriveById(int id);

    /**
     * 更改用户基本信息
     *
     * @param person
     */
    public Person savePersonInfo(Person person, String saveItem);

    public int retriveCounts();

    public int retriveCountsByKey(String key);

    public List<Person> retriveByPageNumber(String number);

    public List<Person> retriveByPageAndKey(String number, String key);

    public int retrivePageNumber();

    public int retrivePageNumberOfKey(String key);

    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);

    public void modifyUserPassword(String id, String password);

    public List<Person> retriveByDepartment(String name);

    public String deletePerson(Person person);

}
