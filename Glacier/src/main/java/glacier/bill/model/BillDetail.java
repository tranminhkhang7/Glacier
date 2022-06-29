/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.bill.model;

/**
 *
 * @author Admin
 */
public class BillDetail {
    private int billID;
    private int billDetailID;
    private String purpose;
    private int amount;
    private String description;

    public BillDetail() {
    }

    public BillDetail(int billID, int billDetailID, String purpose, int amount, String description) {
        this.billID = billID;
        this.billDetailID = billDetailID;
        this.purpose = purpose;
        this.amount = amount;
        this.description = description;
    }

    public int getBillDetailID() {
        return billDetailID;
    }

    public void setBillDetailID(int billDetailID) {
        this.billDetailID = billDetailID;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "billID=" + billID + ", billDetailID=" + billDetailID + ", purpose=" + purpose + ", amount=" + amount + ", description=" + description + '}';
    }


}
