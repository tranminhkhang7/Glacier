/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.bill.dbmanager;

import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class BillManager {
  
    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    
    public int getNextBillID(){
        int index=0;
        String sql = "select top 1 billId from Bill\n" +
"order by billID desc";
        try{
            conn=DBUtils.getConnection();
            if (conn!=null){
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()){
                    index = rs.getInt(1);
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return index+1;
    }
    
    public int getNextBillDetailID(int BillID){
        int index=0;
        String sql = "select top 1 detailID from BillDetail\n" +
"where billID=?\n" +
"order by detailID desc";
        try{
            conn=DBUtils.getConnection();
            if (conn!=null){
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, BillID);
                rs = pstm.executeQuery();
                while (rs.next()){
                    index = rs.getInt("detailID");
                }
            }
            System.out.println(index);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return index+1;
    }
    
    public boolean createBill(int id,int roomID, Timestamp time,String status){
        boolean check = false;
        String sql = "insert into Bill\n" +
"values (?,?,?,?)";
        try{
            conn=DBUtils.getConnection();
            if (conn!=null){
                pstm=conn.prepareStatement(sql);
                pstm.setInt(1, id);
                pstm.setInt(2, roomID);
                pstm.setTimestamp(3, time);
                pstm.setString(4,status);
                pstm.executeUpdate();
                check=true;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return check;
    }
    
    public boolean addBillDetail(BillDetail b,int billID) throws SQLException, Exception{
        boolean check=false;
        String sql = "insert into BillDetail\n" +
"values (?,?,?,?,?)"; 
            conn=DBUtils.getConnection();
            if (conn!=null){
                pstm=conn.prepareStatement(sql);
                pstm.setInt(1, b.getBillDetailID());
                pstm.setInt(2, billID);
                pstm.setString(3,b.getPurpose());
                pstm.setInt(4, b.getAmount());
                pstm.setString(5, b.getDescription());
                pstm.executeUpdate();
                check=true;
            }
        return check;
    }
    
    public boolean createBillDetail(int id,ArrayList<BillDetail> l){
        boolean check = false;
        try {
            for (BillDetail b : l) {
                addBillDetail(b, id);
            }
            check=true;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
//    public static void main(String[] args) {
//        BillManager bm = new BillManager();
////        Timestamp date = new Timestamp(System.currentTimeMillis());
////        bm.createBill(bm.getNextBillID(),10,date,"unpaid");
//        ArrayList<BillDetail> lis = new ArrayList<>();
//        BillDetail b1 = new BillDetail(1, 1, "Tiền điện", 10000, "");
//        BillDetail b2 = new BillDetail(1, 2, "Tiền nước", 10000, "");
//        BillDetail b3 = new BillDetail(1, 3, "Tiền nhà", 10000, "");
//        BillDetail b4 = new BillDetail(1, 4, "Tiền khác", 10000, "");
//        lis.add(b1);
//        lis.add(b2);
//        lis.add(b3);
//        lis.add(b4);
//        System.out.println(b1);
//        System.out.println(b2);
//        System.out.println(b3);
//        System.out.println(b4);
////        bm.getNextBillDetailID(10);
//        bm.createBillDetail(1, lis);
//    }
}
