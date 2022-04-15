package recycling.google;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class UploadObject {
	public static void main(String[] args) throws IOException {
		 uploadObject(//여기에 매개변수로 넣으면 됩니다! 세번째(> 사진을 저장할 새로운 이름), 네번째(> 업로드할 사진의 경로)를 바꿔주세요
			  "heyearth-347105", "hey-earth", "tiger", "C:/ai_images/tiger.jpg");
		
	}
  public static void uploadObject(
      String projectId, String bucketName, String objectName, String filePath) throws IOException {
    // The ID of your GCP project
    // String projectId = "your-project-id"; 
	// 내 프로젝트 아이디(고정) : "heyearth-347105"

    // The ID of your GCS bucket
    // String bucketName = "your-unique-bucket-name"; 
	// 내 버킷 이름(고정) : "hey-earth"

    // The ID of your GCS object
    // String objectName = "your-object-name"; 
	// 업로드한 사진을 저장할 새로운 이름 지정(겹치면 오류/매번 새롭게 지정) : "tiger"

    // The path to your file to upload
    // String filePath = "path/to/your/file" 
	// 업로드할 사진의 경로 : "C:/ai_images/tiger.jpg"

    Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
    BlobId blobId = BlobId.of(bucketName, objectName);
    BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();
    storage.create(blobInfo, Files.readAllBytes(Paths.get(filePath)));

    System.out.println(
        "File " + filePath + " uploaded to bucket " + bucketName + " as " + objectName);
  }
}