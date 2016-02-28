package dao;


import domain.Lecture;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/17.
 */
@Component
public interface LectureDAO extends BaseDao<Lecture> {
    /**
     * 添加一个讲座信息
     *
     * @param lecture
     */
    public void add(Lecture lecture);

    /**
     * 根据讲座名称查找讲座信息
     *
     * @param name
     * @return
     */
    public Lecture retriveByName(String name);

    /**
     * 查找所有讲座的信息
     *
     * @return
     */
    public List<Lecture> retriveAll();

    /**
     * 更新一个讲座的信息
     *
     * @param lecture
     */
    public void update(Lecture lecture);

    /**
     * 删除一个讲座信息
     *
     * @param lecture
     */
    public void delete(Lecture lecture);


    /**
     * 根据讲座id查找讲座信息
     *
     * @param id
     */
    public Lecture retriveById(int id);

    /**分页查询团队信息
     * @param number
     * @return
     */
    public List<Lecture> retriveByPageNumber(int number);

    /**根据关键字分页查询讲座信息
     * @param number
     * @param key
     * @return
     */
    public List<Lecture> retrivePageAndKey(int number,String key);


    /**查询数据库中总的记录的个数
     * @return
     */
    public int retriveCounts();

    /**查询分页之后的总的页数
     * @return
     */
    public int retrivePageNumber();

    /**查询根据关键字查询得到结果的总记录的个数
     * @param key
     * @return
     */
    public int retriveCountsByKey(String key);

    /**根据关键字查询团队信息的总页数
     * @param key
     * @return
     */
    public int retrivePageNumberByKey(String key);
}
