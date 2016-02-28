package service;

import domain.ADMessage;
import domain.ApplyForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by martsforever on 2016/2/26.
 */
@Service()
@Transactional
public interface ApplyFormService {
    public void add(ApplyForm applyForm);

    public void update(ApplyForm applyForm);

    public void delete(ApplyForm applyForm);

    public ApplyForm retriveById(String id);
}
