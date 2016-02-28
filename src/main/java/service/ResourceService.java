package service;

import domain.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/1.
 */
@Service()
@Transactional
public interface ResourceService {

    public Resource retriveById(int id);

    /**
     * 添加一个资源的信息
     *
     * @param resource
     */
    public void add(Resource resource);

    /**
     * 分页查询所有资源的信息
     *
     * @param number
     */
    public List<Resource> retriveByPageNumber(String number);

    /**
     * 查询所有资源的个数
     *
     * @return
     */
    public int retriveCounts();

    /**
     * 根据关键字分页查询资源信息
     *
     * @param number
     * @param key
     */
    public List<Resource> retriveByPageAndKey(String number, String key);

    /**
     * 查询根据关键字查询得到的结果的个数
     *
     * @param key
     * @return
     */
    public int retriveCountsByKey(String key);

    /**
     * 更新一个资源的信息
     *
     * @param resource
     */
    public void update(Resource resource);

    /**
     * 删除一个资源的信息
     *
     * @param resource
     */
    public void delete(Resource resource,String filePath);

    /**查询分页后的总页数
     * @return
     */
    public int retrivePageNumber();

    /**根据关键字分页查询后的总页数
     * @param key
     * @return
     */
    public int retrivePageNumberOfKey(String key);

    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber);

    /**
     *资源被下载，更新下载次数
     */
    public String resourceDownload(String resourceId);
}
