package edu.scdx.entity;

public class ServerPerformance {

    int project_id;
    String time_min;
    String if_cpu_need_warn;
    String if_mem_need_warn;
    String if_disk_need_warn;
    double cpu_warn_num;
    double mem_warn_num;
    double disk_warn_num;
    double cpu_usage;
    double mem_usage;
    double disk_usage;
    String if_cpu_warned;
    String if_mem_warned;
    String if_disk_warned;

    public ServerPerformance(int project_id, String time_min, String if_cpu_need_warn, String if_mem_need_warn, String if_disk_need_warn, double cpu_warn_num, double mem_warn_num, double disk_warn_num, double cpu_usage, double mem_usage, double disk_usage, String if_cpu_warned, String if_mem_warned, String if_disk_warned) {
        this.project_id = project_id;
        this.time_min = time_min;
        this.if_cpu_need_warn = if_cpu_need_warn;
        this.if_mem_need_warn = if_mem_need_warn;
        this.if_disk_need_warn = if_disk_need_warn;
        this.cpu_warn_num = cpu_warn_num;
        this.mem_warn_num = mem_warn_num;
        this.disk_warn_num = disk_warn_num;
        this.cpu_usage = cpu_usage;
        this.mem_usage = mem_usage;
        this.disk_usage = disk_usage;
        this.if_cpu_warned = if_cpu_warned;
        this.if_mem_warned = if_mem_warned;
        this.if_disk_warned = if_disk_warned;
    }

    public ServerPerformance() {
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getTime_min() {
        return time_min;
    }

    public void setTime_min(String time_min) {
        this.time_min = time_min;
    }

    public String getIf_cpu_need_warn() {
        return if_cpu_need_warn;
    }

    public void setIf_cpu_need_warn(String if_cpu_need_warn) {
        this.if_cpu_need_warn = if_cpu_need_warn;
    }

    public String getIf_mem_need_warn() {
        return if_mem_need_warn;
    }

    public void setIf_mem_need_warn(String if_mem_need_warn) {
        this.if_mem_need_warn = if_mem_need_warn;
    }

    public String getIf_disk_need_warn() {
        return if_disk_need_warn;
    }

    public void setIf_disk_need_warn(String if_disk_need_warn) {
        this.if_disk_need_warn = if_disk_need_warn;
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

    public double getCpu_usage() {
        return cpu_usage;
    }

    public void setCpu_usage(double cpu_usage) {
        this.cpu_usage = cpu_usage;
    }

    public double getMem_usage() {
        return mem_usage;
    }

    public void setMem_usage(double mem_usage) {
        this.mem_usage = mem_usage;
    }

    public double getDisk_usage() {
        return disk_usage;
    }

    public void setDisk_usage(double disk_usage) {
        this.disk_usage = disk_usage;
    }

    public String getIf_cpu_warned() {
        return if_cpu_warned;
    }

    public void setIf_cpu_warned(String if_cpu_warned) {
        this.if_cpu_warned = if_cpu_warned;
    }

    public String getIf_mem_warned() {
        return if_mem_warned;
    }

    public void setIf_mem_warned(String if_mem_warned) {
        this.if_mem_warned = if_mem_warned;
    }

    public String getIf_disk_warned() {
        return if_disk_warned;
    }

    public void setIf_disk_warned(String if_disk_warned) {
        this.if_disk_warned = if_disk_warned;
    }

    @Override
    public String toString() {
        return "ServerPerformance{" +
                "project_id=" + project_id +
                ", time_min='" + time_min + '\'' +
                ", if_cpu_need_warn='" + if_cpu_need_warn + '\'' +
                ", if_mem_need_warn='" + if_mem_need_warn + '\'' +
                ", if_disk_need_warn='" + if_disk_need_warn + '\'' +
                ", cpu_warn_num=" + cpu_warn_num +
                ", mem_warn_num=" + mem_warn_num +
                ", disk_warn_num=" + disk_warn_num +
                ", cpu_usage=" + cpu_usage +
                ", mem_usage=" + mem_usage +
                ", disk_usage=" + disk_usage +
                ", if_cpu_warned='" + if_cpu_warned + '\'' +
                ", if_mem_warned='" + if_mem_warned + '\'' +
                ", if_disk_warned='" + if_disk_warned + '\'' +
                '}';
    }
}
