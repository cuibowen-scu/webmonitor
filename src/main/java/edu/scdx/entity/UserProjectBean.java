package edu.scdx.entity;

public class UserProjectBean {
    private String phone;
    private int project_id;
    private String project_name;

    private String hostname;
    private String port;
    private String username;
    private String password;
    private String db_name;

    private String cpu_need_warn;
    private String mem_need_warn;
    private String disk_need_warn;

    private double cpu_warn_num;
    private double mem_warn_num;
    private double disk_warn_num;

    public UserProjectBean(String phone, int project_id, String project_name, String hostname, String port, String username, String password, String db_name, String cpu_need_warn, String mem_need_warn, String disk_need_warn, double cpu_warn_num, double mem_warn_num, double disk_warn_num) {
        this.phone = phone;
        this.project_id = project_id;
        this.project_name = project_name;
        this.hostname = hostname;
        this.port = port;
        this.username = username;
        this.password = password;
        this.db_name = db_name;
        this.cpu_need_warn = cpu_need_warn;
        this.mem_need_warn = mem_need_warn;
        this.disk_need_warn = disk_need_warn;
        this.cpu_warn_num = cpu_warn_num;
        this.mem_warn_num = mem_warn_num;
        this.disk_warn_num = disk_warn_num;
    }

    public UserProjectBean() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
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

    public String getCpu_need_warn() {
        return cpu_need_warn;
    }

    public void setCpu_need_warn(String cpu_need_warn) {
        this.cpu_need_warn = cpu_need_warn;
    }

    public String getMem_need_warn() {
        return mem_need_warn;
    }

    public void setMem_need_warn(String mem_need_warn) {
        this.mem_need_warn = mem_need_warn;
    }

    public String getDisk_need_warn() {
        return disk_need_warn;
    }

    public void setDisk_need_warn(String disk_need_warn) {
        this.disk_need_warn = disk_need_warn;
    }

    public double getCpu_warn_num() {
        return cpu_warn_num;
    }

    public void setCpu_warn_num(double cpu_warn_num) {
        this.cpu_warn_num = cpu_warn_num;
    }

    public double getMem_warn_num() {
        return mem_warn_num;
    }

    public void setMem_warn_num(double mem_warn_num) {
        this.mem_warn_num = mem_warn_num;
    }

    public double getDisk_warn_num() {
        return disk_warn_num;
    }

    public void setDisk_warn_num(double disk_warn_num) {
        this.disk_warn_num = disk_warn_num;
    }

    @Override
    public String toString() {
        return "UserProjectBean{" +
                "phone='" + phone + '\'' +
                ", project_id=" + project_id +
                ", project_name='" + project_name + '\'' +
                ", hostname='" + hostname + '\'' +
                ", port='" + port + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", db_name='" + db_name + '\'' +
                ", cpu_need_warn='" + cpu_need_warn + '\'' +
                ", mem_need_warn='" + mem_need_warn + '\'' +
                ", disk_need_warn='" + disk_need_warn + '\'' +
                ", cpu_warn_num=" + cpu_warn_num +
                ", mem_warn_num=" + mem_warn_num +
                ", disk_warn_num=" + disk_warn_num +
                '}';
    }
}
