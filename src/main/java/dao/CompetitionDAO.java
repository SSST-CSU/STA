package dao;

import dao.BaseDao;
import domain.Competition;
import domain.Lecture;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/1/13.
 */
@Component
public interface CompetitionDAO extends BaseDao<Competition> {
    /**添加一个比赛信息
     * @param competition
     */
    public void add(Competition competition);

    /**根据比赛名称查询一个比赛的信息
     * @param name 比赛的名称
     * @return
     */
    public Competition retriveByName(String name);

    /**查找所有比赛信息
     * @return
     */
    public List<Competition> retriveAll();

    /**更新一个比赛的信息
     * @param competition
     */
    public void update(Competition competition);

    /**删除一个比赛信息
     * @param competition
     */
    public void delete(Competition competition);

    /**
     * 根据讲座id查找讲座信息
     *
     * @param id
     */
    public Competition retriveById(int id);

    /**分页查询团队信息
     * @param number
     * @return
     */
    public List<Competition> retriveByPageNumber(int number);

    /**根据关键字分页查询讲座信息
     * @param number
     * @param key
     * @return
     */
    public List<Competition> retrivePageAndKey(int number, String key);


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
