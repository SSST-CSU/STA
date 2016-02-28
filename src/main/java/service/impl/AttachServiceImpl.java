package service.impl;

import dao.AttachDao;
import domain.Attach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AttachService;

import java.util.List;

/**
 * Created by martsforever on 2016/2/24.
 */
@Service("AttachService")
public class AttachServiceImpl implements AttachService {

    @Autowired
    AttachDao attachDao;

    @Override
    public void add(Attach attach) {
        attachDao.add(attach);
    }

    @Override
    public void update(Attach attach) {
        attachDao.update(attach);
    }

    @Override
    public void delete(Attach attach) {
        attachDao.delete(attach);
    }

    @Override
    public Attach retriveById(String id) {
        return attachDao.retriveById(Integer.parseInt(id));
    }

    @Override
    public List<Attach> retriveByDepartmentName(String name) {
        return attachDao.retriveByDepartmentName(name);
    }
}
