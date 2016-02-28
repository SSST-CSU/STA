package dao;

import domain.ADMessage;
import domain.Admin;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by martsforever on 2016/2/26.
 */
@Component
public interface AdminDao extends BaseDao<Admin> {

    public void add(Admin admin);

    public void update(Admin admin);

    public void delete(Admin admin);

    public Admin retriveById(int id);


    public List<Admin> retriveAll();

    Admin adminLogin(String account, String passwrod);
}
