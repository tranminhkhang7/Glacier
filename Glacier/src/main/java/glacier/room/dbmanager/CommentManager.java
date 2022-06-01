/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.room.dbmanager;

import glacier.room.model.Comment;
import glacier.user.model.Tenant;
import glacier.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CommentManager {
    //Init global variable for class
    private Connection conn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    // Always remember to close connection
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
    
    public ArrayList<Comment> getAllComment(int RoomID) throws SQLException, Exception{
        // Basic get Comment and add in commentL array
        ArrayList<Comment> commentL = new ArrayList<>();
        conn = DBUtils.getConnection();
        Comment c = new Comment();
        try{
                if (conn!=null){
                String sql =    "select c.commentID,t.name,t.profile_picture,c.content,c.time,c.rating \n" +
                                "from Comment c join Tenant t on (c.email=t.email)\n" +
                                "where (c.roomID=?)";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, RoomID);
                rs= pstm.executeQuery();
                while (rs.next()){
                    int id = rs.getInt("commentID");
                    String name = rs.getString("name").trim();
                    String profile_picture=rs.getString("profile_picture");
                    String content = rs.getString("content").trim();                   
                    Date time=rs.getTime("time");
                    int rating = rs.getInt("rating");
                    c = new Comment(id, name, profile_picture, RoomID, content, time, rating);
                    //create a comment with name and profile picture of commenter                    
                    System.out.println(c); // THIS JUST FOR TEST
                    commentL.add(c);
                }
//                System.out.println(commentL.size());
            }
        }
        catch (Exception E){
            E.printStackTrace();
        }
        finally {
            closeConnection();
            return commentL;
        }
    }
    
    public int getNextCommentIndex() throws Exception{
        int i=-1;
        conn=DBUtils.getConnection();
        try{
            if (conn!=null){
                String sql = "select top 1 commentID from Comment order by commentID desc";
                pstm = conn.prepareStatement(sql);
                rs=pstm.executeQuery();
                while (rs.next()){
                    i=rs.getInt("commentID")+1;
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public boolean createComment(Comment c) throws Exception{
        boolean check = false;
        conn=DBUtils.getConnection();
        try {
            if (conn!=null){
            String sql = "";
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    public static void main(String[] args) throws Exception {
        ArrayList<Comment> commentL = new ArrayList<>();
        CommentManager dao = new CommentManager();
        commentL = dao.getAllComment(10);
//        for (Comment comment : commentL) {
//            System.out.println(comment);
//        }
    }
}
