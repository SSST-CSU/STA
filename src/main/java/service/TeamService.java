package service;

import domain.Person;
import domain.Team;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/25.
 */
@Service()
@Transactional
public interface TeamService {

    /**
     * 添加一个团队信息
     *
     * @param team
     */

    public void add(Team team);

    /**
     * 查询团队名称是否存在
     *
     * @return
     */
    public boolean isTeamNameExist(String name);

    /**
     * 分页查询团队信息
     *
     * @param number
     * @return
     */

    public List<Team> retriveByPageNumber(String number);

    /**
     * 查询所有记录的个数
     *
     * @return
     */
    public int retriveCounts();

    /**
     * 查询分页之后总页数
     *
     * @return
     */
    public int retrivePageNumber();

    /**
     * 计算开始与结束页的位置
     *
     * @return
     */
    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);

    /**
     * 用户申请加入团队，判断是否准许该用户加入团队，
     * 1、用户为该队队长，则不允许加入该团队
     * 2、用户为该队队员，则不允许加入团队
     * 3、团队成员数量已经到达最大上限
     * 4、组队信息已经超过截止日期
     * 返回的是json字符串
     *
     * @param groupId
     * @param personId
     * @return
     */
    public String applyToJoinGroup(int groupId, int personId);

    /**
     * 查询用户发起的组队信息
     *
     * @param personId
     * @return
     */
    public List<Team> retriveRelesasedTeamsById(int personId);

    /**
     * 根据团队id查找团队信息
     *
     * @param id
     * @return
     */
    public Team retriveById(int id);


    /**
     * 将用户请出团队
     *
     * @param teamId
     * @param personId
     */
    public void getRidOfGroup(int teamId, int personId);

    /**
     * 解散团队
     *
     * @param teamId
     */
    public void removeTeam(int teamId);

    /**
     * 根据关键字分页查询团队信息
     *
     * @param targetPage
     * @param key
     * @return
     */
    public List<Team> retriveByPageAndKey(int targetPage, String key);

    /**
     * 根据关键字查询查询结果的总页数
     *
     * @param key
     * @return
     */
    public int retrivePageNumberByKey(String key);

    /**
     * 接受用户加入团队的申请
     */
    public String acceptApplication(int teamId, int personId);

    /**更新团队信息
     * @param team
     */
    public void update(Team team);

}
