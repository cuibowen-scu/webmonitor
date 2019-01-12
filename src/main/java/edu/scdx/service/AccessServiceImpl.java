package edu.scdx.service;

import edu.scdx.dao.AccessMapper;
import edu.scdx.entity.AccessBean;
import edu.scdx.entity.AccessField;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccessServiceImpl implements AccessService {

    @Autowired
    private AccessMapper accessMapper;

    public AccessMapper getAccessMapper() {
        return accessMapper;
    }

    public void setAccessMapper(AccessMapper accessMapper) {
        this.accessMapper = accessMapper;
    }

    @Override
    public List<AccessBean> getAccessList(String phone) {
        return accessMapper.getAccessList(phone);
    }

    @Override
    public AccessBean getAccessInfo(String phone, int accessId) {
        return accessMapper.getAccessInfo(phone, accessId);
    }

    @Override
    public List<AccessField> getAccessFields(AccessBean accessBean) {
        return DBUtil.getAccessFields(accessBean);
    }

    @Override
    public int getAccessId() {
        return accessMapper.getAccessId();
    }

    @Override
    public void addAccess(AccessBean accessBean) {
        accessMapper.addAccess(accessBean);
    }
}
