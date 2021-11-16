package vn.thegioicaycanh.model.shipment;

import vn.thegioicaycanh.controller.admin_page.Shipment_direct;
import vn.thegioicaycanh.model.database.connection_pool.DBCPDataSource;
import vn.thegioicaycanh.model.util.Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Load_Shipment {
    public static List<Shipment> loadShipment_view(){
        List<Shipment> shipmentList = new ArrayList<>();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery("SELECT s.id, o.id, s.date_created, s.type_weight, s.price FROM shipment s JOIN `order` o ON s.id = o.ship_id");
                while (resultSet.next()){
                    Shipment shipment = new Shipment();
                    shipment.setId(resultSet.getInt(1));
                    shipment.setOrder_id(resultSet.getInt(2));
                    shipment.setDate_created(resultSet.getDate(3));
                    shipment.setType_weight(resultSet.getInt(4));
                    shipment.setPrice(resultSet.getDouble(5));
                    shipmentList.add(shipment);
                }
                resultSet.close();
            }
            statement.close();
            return shipmentList;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        }
        return shipmentList;
    }

    public static void main(String[] args) {
        for(Shipment s : loadShipment_view()){
            System.out.println(s.getId() + "\t" + s.getOrder_id() + "\t" + s.getType_weight());
        }
    }

    public static int addShipment(int type_weight) {
        int id=getNextId();
        int updated =0;
        double price = 0;
        if(type_weight==1)
            price = 10000;
        else if(type_weight==2)
            price=20000;
        else if(type_weight==3)
            price=50000;
        else if(type_weight==4)
            price=70000;
        String sql = "insert into shipment(price,type_weight,date_created,id) values(?,?,?,?)";
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement(sql);
            pe.setDouble(1,price);
            pe.setInt(2,type_weight);
            pe.setString(3,Util.dateFormat(new Date()));
            pe.setInt(4,id);
            synchronized (pe){
                updated=pe.executeUpdate();

            }
            pe.close();
            if(updated==1) return id;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public static int getNextId(){
        int nextId=0;
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select max(id) from shipment");
            synchronized (pe){
                ResultSet re = pe.executeQuery();
                if(re.next())
                    nextId=re.getInt(1)+1;
                re.close();
            }
            pe.close();
            return nextId;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    return nextId;
    }
}
