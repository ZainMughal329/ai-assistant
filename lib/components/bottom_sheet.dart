import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/screens/FeaturesScreen/translator/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBottomSheet extends StatelessWidget {
  final  AITranslatorController cont;
  final RxString fromLang ;
  LanguageBottomSheet({Key? key,required this.cont, required this.fromLang}) : super(key: key);
  RxString search = ''.obs;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: mq.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            TextFormField(
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              controller: cont.searchCont,
              onChanged: (s){
                search.value = s.trim().toLowerCase();
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.translate_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintText: "Search Language..."
              ),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Obx((){
                
                final List<String> list = search.value.isEmpty ? cont.lang : cont.lang.where((element) => element.toLowerCase().contains(search.value)).toList();
                
                
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    padding: EdgeInsets.only(left: mq.width * 0.04,top: mq.height * 0.02),
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            fromLang.value = list[index].toString();
                            cont.searchCont.clear();
                            Get.back();
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: 8.0),
                            child: Text(list[index].toString(),style: TextStyle(fontSize: 20),),
                          ));
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
