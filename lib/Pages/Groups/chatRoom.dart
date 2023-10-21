import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Column(
          children: [
            LayoutHelper.height10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 1, bottom: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.getColor(AppColorsEnum.gray200)),
                  child: CustomText(
                    textKey: "Today",
                    size: 15,
                  ),
                )
              ],
            ),
            LayoutHelper.height10(),
            chatsample(),
            chatsample(isSender: true, senderImage: ImageConstant.msg2),
            chatsample(),
            chatsample(isSender: true, senderImage: ImageConstant.msg2),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: 
                        Container(
                          // height: 30,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.black12)),
                          child: CustomInputField(
                              verticalContentPadding: 10,
                              horizontalContentPadding: 10,
                              borderRadius: 8,
                              maxLines: 10,
                              allBorderdisable: true,
                              prefixWidget: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.gif_rounded,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              suffixIcon: SizedBox(
                                width: width * 0.25,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(
                                          ImageConstant.paperClip,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Icon(
                                      Icons.mic,
                                      size: 27,
                                    )
                                  ],
                                ),
                              ),
                              hintstyle: const TextStyle(
                                  fontSize: 15, color: Colors.black38),
                              fillColor:
                                  AppColors.getColor(AppColorsEnum.white),
                              hint: "Messaggio",
                              textEditingController: controller),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  TextEditingController controller = TextEditingController();
  chatsample({bool isSender = false, String? senderImage}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isSender
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(senderImage ?? ImageConstant.msg1),
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.65,
                  child: BubbleSpecialOne(
                    text:
                        'Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis',
                    isSender: isSender,
                    color: isSender
                        ? AppColors.getColor(AppColorsEnum.secondaryColor)
                            .withOpacity(0.2)
                        : HexColor("#f5eaff"),
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSender
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(senderImage ?? ImageConstant.msg1),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
