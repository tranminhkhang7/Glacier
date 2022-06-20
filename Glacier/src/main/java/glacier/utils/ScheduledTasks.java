/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.utils;

import glacier.user.controller.UserManager;

import java.util.List;

/**
 *
 * @author ASUS
 */
public class ScheduledTasks implements Runnable {

    public ScheduledTasks() {
    }
    
    @Override
    public void run() {
        UserManager manager = new UserManager();
        List<Integer> list = manager.getRoomIDsOver2Days();
        boolean check = false;
        
        if(list != null && !list.isEmpty()){
            for (Integer roomId : list) {
                check = manager.freeRoomAfter2Days(roomId);
            }
        }else{
            System.out.println("THERE IS NO ROOM PENDING TO BE FREE");
        }
    }
    
}
