package vn.thegioidochoi.model.Product;

import vn.thegioidochoi.Dao.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Withdraw {
    private int id;
    private int user_id;
    private int supplier_id;
    private double current_balance;
    private double withdraw_amount;
    private double remain_balance;
    private String paypal_email;
    private Date date_created;
    private int status;

    public Withdraw(int id, int user_id, int supplier_id, double current_balance, double withdraw_amount, double remain_balance, String paypal_email, Date date_created, int status) {
        this.id = id;
        this.user_id = user_id;
        this.supplier_id = supplier_id;
        this.current_balance = current_balance;
        this.withdraw_amount = withdraw_amount;
        this.remain_balance = remain_balance;
        this.paypal_email = paypal_email;
        this.date_created = date_created;
        this.status = status;
    }
    public Withdraw(int user_id, int supplier_id, double current_balance, double withdraw_amount, double remain_balance, String paypal_email, int status) {
        this.user_id = user_id;
        this.supplier_id = supplier_id;
        this.current_balance = current_balance;
        this.withdraw_amount = withdraw_amount;
        this.remain_balance = remain_balance;
        this.paypal_email = paypal_email;
        this.status = status;
    }

    public Withdraw() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public double getCurrent_balance() {
        return current_balance;
    }

    public void setCurrent_balance(double current_balance) {
        this.current_balance = current_balance;
    }

    public double getWithdraw_amount() {
        return withdraw_amount;
    }

    public void setWithdraw_amount(double withdraw_amount) {
        this.withdraw_amount = withdraw_amount;
    }

    public double getRemain_balance() {
        return remain_balance;
    }

    public void setRemain_balance(double remain_balance) {
        this.remain_balance = remain_balance;
    }

    public String getPaypal_email() {
        return paypal_email;
    }

    public void setPaypal_email(String paypal_email) {
        this.paypal_email = paypal_email;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public static boolean insertWithdraw(Withdraw withdraw){
        String sql = " insert into withdraw(user_id,supplier_id, current_balance, withdraw, remain_balance, paypal_email, status) value(?,?,?,?,?,?,?)";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1,withdraw.getUser_id());
            pe.setInt(2, withdraw.getSupplier_id());
            pe.setDouble(3, withdraw.getCurrent_balance());
            pe.setDouble(4, (withdraw.getWithdraw_amount()));
            pe.setDouble(5, withdraw.getRemain_balance());
            pe.setString(6, withdraw.getPaypal_email());
            pe.setInt(7, withdraw.getStatus());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean updateWithdraw(Withdraw withdraw){
        String sql = " update withdraw set status = ? where id = ?";
        int update = 0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setInt(1, withdraw.getStatus());
            pe.setInt(2, withdraw.getId());
            synchronized (pe) {
                update = pe.executeUpdate();
            }
            pe.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static List<Withdraw> loadWithdraws(int supplier_id) {
        List<Withdraw> withdraws = new ArrayList<>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement) {
                ResultSet resultSet = statement.executeQuery("select * from `withdraw` where supplier_id = " + supplier_id + " ORDER BY date_created desc");
                while (resultSet.next()) {

                    Withdraw withdraw = new Withdraw();
                    withdraw.setId(resultSet.getInt(1));
                    withdraw.setUser_id(resultSet.getInt(2));
                    withdraw.setSupplier_id(resultSet.getInt(3));
                    withdraw.setCurrent_balance(resultSet.getDouble(4));
                    withdraw.setWithdraw_amount(resultSet.getDouble(5));
                    withdraw.setRemain_balance(resultSet.getDouble(6));
                    withdraw.setPaypal_email(resultSet.getString(7));
                    withdraw.setStatus(resultSet.getInt(8));
                    withdraw.setDate_created(resultSet.getDate(9));

                    withdraws.add(withdraw);

                }
                resultSet.close();
            }
            statement.close();
            return withdraws;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Withdraw loadLastWithdraw(int supplier_id) {
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(" select remain_balance, date_created from withdraw where supplier_id= ? ORDER BY date_created desc limit 1");
            pe.setInt(1,supplier_id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                Withdraw withdraw = new Withdraw();
                if(rs.next()) {
                    withdraw.setRemain_balance(rs.getDouble(1));
                    withdraw.setDate_created(rs.getDate(2));
                }
                rs.close();
                pe.close();
                return withdraw;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public String toString() {
        return "Withdraw{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", supplier_id=" + supplier_id +
                ", current_balance=" + current_balance +
                ", withdraw_amount=" + withdraw_amount +
                ", remain_balance=" + remain_balance +
                ", paypal_email='" + paypal_email + '\'' +
                ", date_created=" + date_created +
                ", status=" + status +
                '}';
    }
}
