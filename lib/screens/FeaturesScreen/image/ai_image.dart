import 'package:ai_assistant/components/RoundButton.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/screens/FeaturesScreen/image/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AIImageScreen extends StatelessWidget {
  AIImageScreen({Key? key}) : super(key: key);
  final contr = Get.put<AIImageController>(AIImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("AiTranslatorScreen"),
        elevation: 1,
        actions: [
          Obx(() {
            return contr.loadingStatus.value == Status.completed
                ? IconButton(
                    padding: EdgeInsets.only(right: mq.width * 0.05),
                    onPressed: () {
                      contr.shareNetworkImage();
                    },
                    icon: Icon(
                      Icons.share,
                      color: AppColors.primaryColor,
                    ),
                  )
                : SizedBox();
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: mq.height * 0.01,
          left: mq.width * 0.05,
          right: mq.width * 0.05,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // text field
            TextFormField(
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              minLines: 2,
              maxLines: null,
              controller: contr.textContr,
              decoration: InputDecoration(
                // isDense: true,
                // focusColor: AppColors.primaryColor,
                // fillColor: Colors.white,
                // filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintText:
                    "Imagine something wonderful and innovative \n Type here and I will create for you  ...",
              ),
              textAlign: TextAlign.center,
            ),

            // ai image or lottie based on status
            Obx(
              () => Container(
                  height: mq.height * 0.5,
                  // width: mq.width * 0.4,
                  alignment: Alignment.center,
                  child: _imageWidget()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
              child: RoundButton(
                  name: "Create",
                  onPressed: () {
                    contr.generateAiImage();
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => contr.loadingStatus.value == Status.completed
            ? FloatingActionButton(
                child: Icon(Icons.download_outlined),
                onPressed: () {
                  contr.saveNetworkImage();
                },
              )
            : SizedBox(),
      ),
    );
  }

  // this is the widget for crating image on the basis of enum status using switch cases
  Widget _imageWidget() => switch (contr.loadingStatus.value) {
        Status.none => Lottie.asset(
            'assets/animations/image_ai.json',
            width: mq.width * 0.5,
          ),
        // TODO: Handle this case.
        Status.loading => Lottie.asset(
            'assets/animations/loading.json',
            width: mq.width * 0.5,
          ),
        // TODO: Handle this case.
        Status.completed => ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: contr.url.value,
              placeholder: (context, url) => Lottie.asset(
                'assets/animations/loading.json',
                width: mq.width * 0.5,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        // TODO: Handle this case.
      };
}
