/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.bill.dbmanager;

import glacier.bill.model.Bill;
import glacier.bill.model.BillDetail;
import glacier.utils.DBUtils;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

    public int getNextBillID() {
        int index = 0;
        String sql = "select top 1 billId from Bill\n"
                + "order by billID desc";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    index = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return index + 1;
    }

    public ArrayList<Bill> getBills(int roomid, int index) {
        ArrayList<Bill> Bills = new ArrayList<>();
        String sql = "select b.billID,b.roomID,b.status,b.time from Bill b join Room r on (b.roomID=r.roomID)\n"
                + "  where r.roomID=?\n"
                + "  order by b.billID DESC\n"
                + "  offset ? rows fetch next 10 rows only";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomid);
                pstm.setInt(2, (index - 1) * 10);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int billID = rs.getInt("billID");
                    int roomID = rs.getInt("roomID");
                    String status = rs.getString("status");
                    Timestamp time = rs.getTimestamp("time");
                    Bill b = new Bill(billID, roomID, time, status);
                    Bills.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            Bills = null;
        }
        return Bills;
    }

    public int getNumberOfBills(int roomid) {
        int number = -1;
        String sql = "  select count(*) from Bill b join Room r on (b.roomID=r.roomID)\n"
                + "  where r.roomID=?\n";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, roomid);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    number = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return number;
    }

    public int[] getCurrent2BillIDByRoom(int id) {
        int[] IDs = new int[4];
        int index = 0;
        String sql = "select top 2 billId from Bill\n"
                + "where roomID=?\n"
                + "order by billID desc";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                while (rs.next()) {
//                    int i=rs.getInt("billId");
//                    IDs[index]=i;
//                    index++;
                    IDs[index] = rs.getInt(1);
                    index++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return IDs;
    }

    public int getNextBillDetailID(int BillID) {
        int index = 0;
        String sql = "select top 1 detailID from BillDetail\n"
                + "where billID=?\n"
                + "order by detailID desc";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, BillID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    index = rs.getInt("detailID");
                }
            }
            System.out.println(index);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return index + 1;
    }

    public Bill getBillByID(int ID) {
        Bill bill = null;
        String sql = "select billID,roomID,time,status from Bill \n"
                + "where billID=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, ID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int billID = rs.getInt("billID");
                    int roomID = rs.getInt("roomID");
                    Timestamp time = rs.getTimestamp("time");
                    String status = rs.getString("status");
                    bill = new Bill(ID, roomID, time, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bill;
    }

    public ArrayList<BillDetail> getBillDetailByBillId(int id) {
        ArrayList<BillDetail> bdl = new ArrayList<>();
        String sql = "select detailID,purpose,amount,description from BillDetail\n"
                + "where billID=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    int billID = rs.getInt("detailID");
                    String purpose = rs.getString("purpose");
                    int amount = rs.getInt("amount");
                    String des = rs.getString("description");
                    BillDetail bd = new BillDetail(id, billID, purpose, amount, des);
                    bdl.add(bd);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bdl;
    }

    public boolean createBill(int id, int roomID, Timestamp time, String status) {
        boolean check = false;
        String sql = "insert into Bill\n"
                + "values (?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                pstm.setInt(2, roomID);
                pstm.setTimestamp(3, time);
                pstm.setString(4, status);
                pstm.executeUpdate();
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean addBillDetail(BillDetail b, int billID) throws SQLException, Exception {
        boolean check = false;
        String sql = "insert into BillDetail\n"
                + "values (?,?,?,?,?)";
        conn = DBUtils.getConnection();
        if (conn != null) {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, b.getBillDetailID());
            pstm.setInt(2, billID);
            pstm.setString(3, b.getPurpose());
            pstm.setInt(4, b.getAmount());
            pstm.setString(5, b.getDescription());
            pstm.executeUpdate();
            check = true;
        }
        return check;
    }

    public boolean createBillDetail(int id, ArrayList<BillDetail> l) {
        boolean check = false;
        try {
            for (BillDetail b : l) {
                addBillDetail(b, id);
            }
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public static void main(String[] args) {
        BillManager bm = new BillManager();
//        Timestamp date = new Timestamp(System.currentTimeMillis());
//        bm.createBill(bm.getNextBillID(),10,date,"unpaid");
//        System.out.println(bm.getCurrent2BillIDByRoom(22).toString());
    }
}
