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
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

/**
 *
 * @author ASUS
 */
public class Utils {
    public static void createQR(String data, String imageName) throws IOException, WriterException{
        
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix matrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, 200, 200);

        // Write to file image
        String outputPrefix = FileSystems.getDefault()
                .getPath("")
                .toAbsolutePath()
                .toString();
        
        System.out.println(outputPrefix);
        String outputPath = outputPrefix+"\\src\\main\\webapp\\images\\"+imageName;
        String outputFile = outputPath;
        Path path = FileSystems.getDefault().getPath(outputFile);
        MatrixToImageWriter.writeToPath(matrix, "JPG", path);
    }
    public static void main(String[] args) throws IOException, WriterException {
//        createQR("hehe", "room-10.png");
    }
    
}
