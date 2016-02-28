package dao;

import domain.Lecture;
import domain.Person;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/14.
 */
@Component
public interface PersonDao extends BaseDao<Person> {
    /**
     * 添加一个会员信息
     *
     * @param person
     */
    public void add(Person person);

    /**
     * 根据会员账号查找会员信息
     *
     * @param account
     */
    public Person retriveByAccount(String account);


    /**
     * 根据用户名以及密码查找用户信息
     *
     * @param account
     * @param password
     * @return
     */
    public Person retriveByAccountAndPassword(String account, String password);

    /**
     * 根据会员名称查找会员信息
     *
     * @param name
     * @return
     */
    public List<Person> retriveByName(String name);

    /**
     * 查找所有会员的信息
     *
     * @return
     */
    public List<Person> retriveAll();

    /**
     * 更新一个会员的信息
     *
     * @param person
     */
    public void update(Person person);

    /**
     * 删除一个会员的信息
     *
     * @param person
     */
    public void delete(Person person);

    /**
     * 根据会员id查找会员信息
     *
     * @param id
     */
    public Person retriveById(int id);


    public List<Person> retriveByPageNumber(int number);

    /**
     * 根据关键字分页查询讲座信息
     *
     * @param number
     * @param key
     * @return
     */
    public List<Person> retrivePageAndKey(int number, String key);


    /**
     * 查询数据库中总的记录的个数
     *
     * @return
     */
    public int retriveCounts();

    /**
     * 查询分页之后的总的页数
     *
     * @return
     */
    public int retrivePageNumber();

    /**
     * 查询根据关键字查询得到结果的总记录的个数
     *
     * @param key
     * @return
     */
    public int retriveCountsByKey(String key);

    /**
     * 根据关键字查询团队信息的总页数
     *
     * @param key
     * @return
     */
    public int retrivePageNumberByKey(String key);

    public List<Person> retriveByDepartment(String name);

}
