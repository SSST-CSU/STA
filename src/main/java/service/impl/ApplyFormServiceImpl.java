package service.impl;

import dao.ApplyFormDao;
import domain.ApplyForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ApplyFormService;

/**
 * Created by martsforever on 2016/2/26.
 */
@Service("ApplyFormService")
public class ApplyFormServiceImpl implements ApplyFormService {

    @Autowired
    ApplyFormDao applyFormDao;

    @Override
    public void add(ApplyForm applyForm) {
        applyFormDao.add(applyForm);
    }

    @Override
    public void update(ApplyForm applyForm) {
        applyFormDao.update(applyForm);
    }

    @Override
    public void delete(ApplyForm applyForm) {
        applyFormDao.delete(applyForm);
    }

    @Override
    public ApplyForm retriveById(String id) {
        return applyFormDao.retriveById(Integer.parseInt(id));
    }
}
