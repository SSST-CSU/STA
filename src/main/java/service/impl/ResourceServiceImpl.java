package service.impl;

import dao.ResourceDAO;
import domain.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ResourceService;
import util.upload.FileUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/1.
 */
@Service("ResourceService")
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    ResourceDAO resourceDao;

    @Override
    public Resource retriveById(int id) {
        return resourceDao.retriveById(id);
    }

    @Override
    public void add(Resource resource) {
        resourceDao.save(resource);
    }

    @Override
    public List<Resource> retriveByPageNumber(String number) {
        int targetPage = Integer.parseInt(number);
        return resourceDao.retriveByPageNumber(targetPage);
    }

    @Override
    public int retriveCounts() {
        return resourceDao.retriveCounts();
    }

    @Override
    public List<Resource> retriveByPageAndKey(String number, String key) {
        int targetPage = Integer.parseInt(number);
        return resourceDao.retriveByPageAndKey(targetPage, key);
    }

    @Override
    public int retriveCountsByKey(String key) {
        return resourceDao.retriveCountsByKey(key);
    }

    @Override
    public void update(Resource resource) {
        resourceDao.update(resource);
    }

    @Override
    public void delete(Resource resource, String filePath) {
        FileUtil.deleteFile(filePath);
        resourceDao.delete(resource);
    }

    @Override
    public int retrivePageNumber() {
        return resourceDao.retrivePageNumber();
    }

    @Override
    public int retrivePageNumberOfKey(String key) {
        return resourceDao.retrivePageNumberOfKey(key);
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
    public String resourceDownload(String resourceId) {
        int id = Integer.parseInt(resourceId);
        Resource resource = resourceDao.retriveById(id);
        resource.setDownloadTimes(resource.getDownloadTimes() + 1);
        update(resource);
        return resource.getDownloadUrl();
    }

}
