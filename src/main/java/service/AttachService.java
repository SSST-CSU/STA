package service;

import domain.Attach;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by martsforever on 2016/2/24.
 */
@Service()
@Transactional
public interface AttachService {

    public void add(Attach attach);

    public void update(Attach attach);

    public void delete(Attach attach);

    public Attach retriveById(String id);

    public List<Attach> retriveByDepartmentName(String name);

}
