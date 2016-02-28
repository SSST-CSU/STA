package dao;

import domain.ADMessage;
import domain.ApplyForm;
import org.springframework.stereotype.Component;

/**
 * Created by martsforever on 2016/2/26.
 */
@Component
public interface ApplyFormDao extends BaseDao<ApplyForm> {

    public void add(ApplyForm applyForm);

    public void update(ApplyForm applyForm);

    public void delete(ApplyForm applyForm);

    public ApplyForm retriveById(int id);

}
