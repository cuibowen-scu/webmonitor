package edu.scdx.util;

import com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException;
import edu.scdx.entity.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DBUtil {

    public static List<TimeCostBean> getProjectMethodTimeCosts(String methodId, UserProjectBean project) {
        try {
            String userHostName = project.getHostname();
            String userPost = project.getPort();
            String username = project.getUsername();
            String password = project.getPassword();
            String userDbName = project.getDb_name();
            String userDbUrl = "jdbc:mysql://" + userHostName + ":" + userPost + "/" + userDbName;
            String THIS_TABLE_NAME = "time_cost";

            for (int i = 0; i < 3; i++) {
                Statement statement = null;
                Connection conn = null;
                String sql = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(userDbUrl, username, password);
                    statement = conn.createStatement();
                    sql = "select * from " + THIS_TABLE_NAME + " where method_id = " + methodId + " order by `start_user_time` desc";
                    ResultSet rs = statement.executeQuery(sql);
                    List<TimeCostBean> list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(new TimeCostBean(rs.getInt("project_id"), rs.getInt("method_id"), rs.getString("class_name"),
                                rs.getString("method_name"), rs.getLong("start_nano_time"), rs.getString("start_user_time"),
                                rs.getLong("end_nano_time"), rs.getString("if_cost_need_warn"), rs.getInt("cost_warn_num"),
                                rs.getInt("cost"), rs.getString("if_warned")));
                    }
                    statement.close();
                    conn.close();

                    return list;
                } catch (Exception e) {
                    Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "fetch from mysql Exception:" + e + ",sql args:" + sql);
                } finally {
                    try {
                        if (statement != null) statement.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close PreparedStatement Exception:" + e + ",sql args:" + sql);
                    }
                    try {
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close mysql conn Exception:" + e + ",sql args:" + sql);
                    }
                }
            }
            return new ArrayList<>();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    public static List<ParamsBean> getProjectMethodParam(String methodId, UserProjectBean project) {
        try {
            String userHostName = project.getHostname();
            String userPost = project.getPort();
            String username = project.getUsername();
            String password = project.getPassword();
            String userDbName = project.getDb_name();
            String userDbUrl = "jdbc:mysql://" + userHostName + ":" + userPost + "/" + userDbName;
            String THIS_TABLE_NAME = "params";

            for (int i = 0; i < 3; i++) {
                Statement statement = null;
                Connection conn = null;
                String sql = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(userDbUrl, username, password);
                    statement = conn.createStatement();
                    sql = "select * from " + THIS_TABLE_NAME + " where method_id = " + methodId + " order by `time_s` desc";
                    ResultSet rs = statement.executeQuery(sql);
                    List<ParamsBean> list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(new ParamsBean(rs.getInt("project_id"), rs.getInt("method_id"),
                                rs.getString("method_class"), rs.getString("method_name"),
                                rs.getString("time_s"), rs.getString("content")));
                    }
                    statement.close();
                    conn.close();
                    return list;
                } catch (Exception e) {
                    Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "fetch from mysql Exception:" + e + ",sql args:" + sql);
                } finally {
                    try {
                        if (statement != null) statement.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close PreparedStatement Exception:" + e + ",sql args:" + sql);
                    }
                    try {
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close mysql conn Exception:" + e + ",sql args:" + sql);
                    }
                }
            }
            return new ArrayList<>();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    public static List<ServerPerformance> getServerState(String projectId, UserProjectBean project, int size) {
        try {
            String userHostName = project.getHostname();
            String userPost = project.getPort();
            String username = project.getUsername();
            String password = project.getPassword();
            String userDbName = project.getDb_name();
            String userDbUrl = "jdbc:mysql://" + userHostName + ":" + userPost + "/" + userDbName;
            String THIS_TABLE_NAME = "server_performance";

            for (int i = 0; i < 3; i++) {
                Statement statement = null;
                Connection conn = null;
                String sql = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(userDbUrl, username, password);
                    statement = conn.createStatement();
                    sql = "select * from " + THIS_TABLE_NAME + " where project_id = " + projectId + " order by `time_min` desc ";
                    if (1 == size) {
                        sql += " limit 1 ";
                    }
                    ResultSet rs = statement.executeQuery(sql);
                    List<ServerPerformance> states = new ArrayList<>();
                    while (rs.next()) {
                        states.add(new ServerPerformance(
                                rs.getInt("project_id"), rs.getString("time_min"), rs.getString("if_cpu_need_warn"),
                                rs.getString("if_mem_need_warn"), rs.getString("if_disk_need_warn"), rs.getDouble("cpu_warn_num"),
                                rs.getDouble("mem_warn_num"), rs.getDouble("disk_warn_num"), rs.getDouble("cpu_usage"),
                                rs.getDouble("mem_usage"), rs.getDouble("disk_usage"), rs.getString("if_cpu_warned"),
                                rs.getString("if_mem_warned"), rs.getString("if_disk_warned")));
                    }
                    statement.close();
                    conn.close();

                    return states;
                } catch (Exception e) {
                    Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "fetch from mysql Exception:" + e + ",sql args:" + sql);
                } finally {
                    try {
                        if (statement != null) statement.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close PreparedStatement Exception:" + e + ",sql args:" + sql);
                    }
                    try {
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close mysql conn Exception:" + e + ",sql args:" + sql);
                    }
                }
            }
            return new ArrayList<>();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    public static List<AccessField> getAccessFields(AccessBean accessBean) {
        try {
            String userHostName = accessBean.getHostname();
            String userPost = accessBean.getPort();
            String username = accessBean.getUsername();
            String password = accessBean.getPassword();
            String userDbName = accessBean.getDb_name();
            String userDbUrl = "jdbc:mysql://" + userHostName + ":" + userPost + "/" + userDbName;
            String THIS_TABLE_NAME = accessBean.getTable();

            for (int i = 0; i < 3; i++) {
                Statement statement = null;
                Connection conn = null;
                String sql = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(userDbUrl, username, password);
                    statement = conn.createStatement();
                    sql = "select * from " + THIS_TABLE_NAME + " order by " + accessBean.getTime_field() + " desc " + "limit 10";
                    ResultSet rs = statement.executeQuery(sql);
                    List<AccessField> fields = new ArrayList<>();
                    while (rs.next()) {
                        fields.add(new AccessField(rs.getString(accessBean.getTime_field()), rs.getString(accessBean.getAction_field())));
                    }
                    statement.close();
                    conn.close();

                    return fields;
                } catch (Exception e) {
                    Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "fetch from mysql Exception:" + e + ",sql args:" + sql);
                } finally {
                    try {
                        if (statement != null) statement.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close PreparedStatement Exception:" + e + ",sql args:" + sql);
                    }
                    try {
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close mysql conn Exception:" + e + ",sql args:" + sql);
                    }
                }
            }
            return new ArrayList<>();
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    public static boolean createTables(String host, String port, String user, String password, String db) {
        try {
            String userDbUrl = "jdbc:mysql://" + host + ":" + port + "/" + db;

            for (int i = 0; i < 3; i++) {
                Statement statement = null;
                Connection conn = null;
                String sql1 = "";
                String sql2 = "";
                String sql3 = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(userDbUrl, user, password);
                    statement = conn.createStatement();
                    sql1 = "CREATE TABLE IF NOT EXISTS `params` ( `project_id` int(11) DEFAULT NULL, `method_id` int(11) DEFAULT NULL, `method_class` varchar(128) DEFAULT NULL, `method_name` varchar(128) DEFAULT NULL, `time_s` varchar(128) DEFAULT NULL COMMENT '执行时间，粒度为s', `content` varchar(16384) DEFAULT NULL COMMENT '上传内容，大于16384不允许上传' ) ENGINE = InnoDB CHARSET = utf8";
                    sql2 = "CREATE TABLE IF NOT EXISTS `server_performance` ( `project_id` int(11) DEFAULT NULL COMMENT 'user项目唯一id', `time_min` varchar(128) DEFAULT NULL COMMENT '采集时间，分钟粒度', `if_cpu_need_warn` varchar(128) DEFAULT NULL, `if_mem_need_warn` varchar(128) DEFAULT NULL, `if_disk_need_warn` varchar(128) DEFAULT NULL, `cpu_warn_num` double DEFAULT NULL, `mem_warn_num` double DEFAULT NULL, `disk_warn_num` double DEFAULT NULL, `cpu_usage` double DEFAULT NULL, `mem_usage` double DEFAULT NULL, `disk_usage` double DEFAULT NULL, `if_cpu_warned` varchar(128) DEFAULT NULL, `if_mem_warned` varchar(128) DEFAULT NULL, `if_disk_warned` varchar(128) DEFAULT NULL ) ENGINE = InnoDB CHARSET = utf8 COMMENT 'user服务器性能表'";
                    sql3 = "CREATE TABLE IF NOT EXISTS `time_cost` ( `project_id` int(11) DEFAULT NULL COMMENT 'user项目唯一id', `method_id` int(11) DEFAULT NULL COMMENT 'user项目方法唯一id', `class_name` varchar(128) DEFAULT NULL COMMENT 'user方法所在类全路径', `method_name` varchar(128) DEFAULT NULL COMMENT 'user方法名', `start_nano_time` bigint(20) DEFAULT NULL COMMENT 'user方法被调用纳秒值', `start_user_time` varchar(128) DEFAULT NULL COMMENT 'user方法被调用时间，粒度为秒', `end_nano_time` bigint(20) DEFAULT NULL COMMENT 'user方法调用结束纳秒值', `if_cost_need_warn` varchar(128) DEFAULT 'no', `cost_warn_num` int(11) DEFAULT '0', `cost` int(11) DEFAULT NULL COMMENT 'user方法耗时，单位为毫秒', `if_warned` varchar(128) DEFAULT NULL COMMENT '是否报警，yes/no' ) ENGINE = InnoDB CHARSET = utf8 COMMENT 'userAPI接口响应时间表'";
                    statement.executeUpdate(sql1);
                    statement.executeUpdate(sql2);
                    statement.executeUpdate(sql3);

                    statement.close();
                    conn.close();
                    return true;
                } catch (MySQLSyntaxErrorException e) {
                    return false;
                } catch (Exception e) {
                    Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "fetch from mysql Exception:" + e + ",sql args:" + sql1 + sql2 + sql3);
                } finally {
                    try {
                        if (statement != null) statement.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close PreparedStatement Exception:" + e + ",sql args:" + sql1 + sql2 + sql3);
                    }
                    try {
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        Logger.getLogger("DBUtil").warning("the " + i + "attempt," + "close mysql conn Exception:" + e + ",sql args:" + sql1 + sql2 + sql3);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}