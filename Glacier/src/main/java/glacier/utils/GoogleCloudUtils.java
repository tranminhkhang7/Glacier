/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package glacier.utils;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
/**
 *
 * @author Admin
 */
public class GoogleCloudUtils {
    public static void uploadObject(String projectId, String bucketName, String objectName, String filePath) throws IOException {
    // The ID of your GCP project
    // String projectId = "your-project-id";

    // The ID of your GCS bucket
    // String bucketName = "your-unique-bucket-name";

    // The ID of your GCS object
    // String objectName = "your-object-name";

    // The path to your file to upload
    // String filePath = "path/to/your/file"

        StorageOptions storageOptions = StorageOptions.newBuilder()
                .setProjectId("glacier-351418")
                .setCredentials(GoogleCredentials.fromStream(new FileInputStream("D:\\FPT_SE161901\\SUMMER 2022\\SWP\\Glacier\\glacier-351418-ac68ab7307d1.json"))).build();
        Storage storage = storageOptions.getService();

    storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
    BlobId blobId = BlobId.of(bucketName, "Room_QR/"+objectName);
    BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType("image/png").build();
    storage.create(blobInfo, Files.readAllBytes(Paths.get(filePath)));
    System.out.println(
        "File " + filePath + " uploaded to bucket " + bucketName + " as " + objectName);
    }
    
    
//    public static void main(String[] args) throws IOException {
//        uploadObject(Constant.GOOGLE_CLOUD_PROJECT_ID, Constant.GOOGLE_CLOUD_BUCKET_NAME, "room-11.png", "D:\\Tomcat Glassfish\\apache-tomcat-9.0.56\\bin\\Glacier\\QR\\room-11.png");
//    }
}
