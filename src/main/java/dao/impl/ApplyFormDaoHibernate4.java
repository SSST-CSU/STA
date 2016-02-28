package dao.impl;

import dao.ApplyFormDao;
import domain.ADMessage;
import domain.ApplyForm;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/2/26.
 */
@Component
public class ApplyFormDaoHibernate4 extends BaseDaoHibernate4<ApplyForm> implements ApplyFormDao {
    @Override
    public void add(ApplyForm applyForm) {
        super.save(applyForm);
    }

    @Override
    public void update(ApplyForm applyForm) {
        super.update(applyForm);
    }

    @Override
    public void delete(ApplyForm applyForm) {
        super.delete(applyForm);
    }

    @Override
    public ApplyForm retriveById(int id) {
        return super.get(ApplyForm.class, id);
    }
}
