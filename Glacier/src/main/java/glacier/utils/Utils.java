/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package glacier.utils;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

/**
 *
 * @author ASUS
 */
public class Utils {
    //-------------------------------------------------
    //CHECK IF DIRECTORY EXIST ? True:Create
    //-------------------------------------------------
    public static boolean createDir(String outputPrefix){
        boolean check=false;
        String path = outputPrefix+"\\Glacier\\QR";
        File file = new File(path);
        boolean fileExists = file.exists();
        if (fileExists){
            check=true;
        }
        else {
            boolean dirCreated = file.mkdirs();
            if (dirCreated){
                check=true;
            }
            else System.out.println("Error creating directory at createDir");
        }
        return check;
    }
    
    //-------------------------------------------------
    //Create QR code base on input data and image name
    //-------------------------------------------------
    public static void createQR(String data, String imageName) {
        try{
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix matrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, 200, 200);

        // Write to file image
        String outputPrefix = FileSystems.getDefault()
                .getPath("")
                .toAbsolutePath()
                .toString();    
             
            if (createDir(outputPrefix)) {
                String outputPath = outputPrefix + "\\Glacier\\QR\\" + imageName;
                String outputFile = outputPath;
                Path path = FileSystems.getDefault().getPath(outputFile);
                MatrixToImageWriter.writeToPath(matrix, "png", path);
            }
            else {
                System.out.println("False in createDir");
            }
        }
        catch (Exception e){
            System.out.print("Error at Utils createQR ");
            e.printStackTrace();
        }
    }
    
//    public static void main(String[] args) throws IOException, WriterException {
//        createQR("hehe", "room-10.png");
//    }
    
}
