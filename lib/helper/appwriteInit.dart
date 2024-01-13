import 'package:ai_assistant/helper/global.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class AppWriteInit {

static final Client _client = Client();
static final db = Databases(_client);


 static void init(){

    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65a039cdb1bdb5d69fcc')
        .setSelfSigned(status: true);
    // this allows automatically signing to access database
    // For self signed certificates, only use for development

    fetchApiKey();

  }
  static Future<String> fetchApiKey () async{
   
   try{
     final data = await db.getDocument(databaseId: "AI-DataBase", collectionId: "apiKey", documentId: "key");
     String key = data.data["apiKey"].toString();
     apiKey = key;
     print(key);
     return key;

   }catch(e){
     Get.snackbar("Error",e.toString());
     return "";
   }
   
  }

}