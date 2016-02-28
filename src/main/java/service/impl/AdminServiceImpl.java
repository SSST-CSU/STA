package service.impl;

import dao.AdminDao;
import domain.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdminService;

import java.util.List;

/**
 * Created by martsforever on 2016/2/26.
 */
@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public void add(Admin admin) {
        adminDao.add(admin);
    }

    @Override
    public void update(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public void delete(Admin admin) {
        adminDao.delete(admin);
    }

    @Override
    public Admin retriveById(int id) {
        return adminDao.retriveById(id);
    }

    @Override
    public List<Admin> retriveAll() {
        return adminDao.retriveAll();
    }

    @Override
    public Admin adminLogin(String account, String passwrod) {
        return adminDao.adminLogin(account, passwrod);
    }
}
