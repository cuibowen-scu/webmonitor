package edu.scdx.entity;

public class AccessBean {

    String phone;
    int access_id;
    String access_name;
    String hostname;
    String port;
    String username;
    String password;
    String db_name;
    String table;
    String time_field;
    String action_field;

    public AccessBean(String phone, int access_id, String access_name, String hostname, String port, String username, String password, String db_name, String table, String time_field, String action_field) {
        this.phone = phone;
        this.access_id = access_id;
        this.access_name = access_name;
        this.hostname = hostname;
        this.port = port;
        this.username = username;
        this.password = password;
        this.db_name = db_name;
        this.table = table;
        this.time_field = time_field;
        this.action_field = action_field;
    }

    public AccessBean(String phone, String access_name, String hostname, String port, String username, String password, String db_name, String table, String time_field, String action_field) {
        this.phone = phone;
        this.access_name = access_name;
        this.hostname = hostname;
        this.port = port;
        this.username = username;
        this.password = password;
        this.db_name = db_name;
        this.table = table;
        this.time_field = time_field;
        this.action_field = action_field;
    }

    public AccessBean() {

    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAccess_id() {
        return access_id;
    }

    public void setAccess_id(int access_id) {
        this.access_id = access_id;
    }

    public String getAccess_name() {
        return access_name;
    }

    public void setAccess_name(String access_name) {
        this.access_name = access_name;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDb_name() {
        return db_name;
    }

    public void setDb_name(String db_name) {
        this.db_name = db_name;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getTime_field() {
        return time_field;
    }

    public void setTime_field(String time_field) {
        this.time_field = time_field;
    }

    public String getAction_field() {
        return action_field;
    }

    public void setAction_field(String action_field) {
        this.action_field = action_field;
    }

    @Override
    public String toString() {
        return "AccessBean{" +
                "phone='" + phone + '\'' +
                ", access_id=" + access_id +
                ", access_name='" + access_name + '\'' +
                ", hostname='" + hostname + '\'' +
                ", port='" + port + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", db_name='" + db_name + '\'' +
                ", table='" + table + '\'' +
                ", time_field='" + time_field + '\'' +
                ", action_field='" + action_field + '\'' +
                '}';
    }
}
