package service;

import domain.ADMessage;
import domain.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by martsforever on 2016/2/26.
 */
@Service()
@Transactional
public interface AdminService {

    public void add(Admin admin);

    public void update(Admin admin);

    public void delete(Admin admin);

    public Admin retriveById(int id);


    public List<Admin> retriveAll();

    public Admin adminLogin(String account, String passwrod);

}


