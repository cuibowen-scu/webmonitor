package edu.scdx.service;

import edu.scdx.entity.AccessBean;
import edu.scdx.entity.AccessField;

import java.util.List;

public interface AccessService {
    List<AccessBean> getAccessList(String phone);

    AccessBean getAccessInfo(String phone, int accessId);

    List<AccessField> getAccessFields(AccessBean accessBean);

    int getAccessId();

    void addAccess(AccessBean accessBean);
}
