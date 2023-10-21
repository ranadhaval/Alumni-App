import 'dart:io';
import 'package:alumni/Pages/MyFeed/Model/response/image_model.dart';
import 'package:alumni/Pages/MyFeed/bloc.dart';
import 'package:alumni/Pages/MyFeed/bloc_event.dart';
import 'package:alumni/Pages/MyFeed/bloc_state.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:alumni/utils/permission.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadFeedBloc, MainInitialState>(
      listener: (context, state) {},
      builder: (context, state) {
        UploadFeedBloc uploadFeedBloc =
            BlocProvider.of<UploadFeedBloc>(context);
        return LayoutHelper.pageContainer(
            backgroundColor: AppColors.getColor(AppColorsEnum.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: height * 0.4,
                    width: width / 2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0;
                            i <= uploadFeedBloc.fileImgs!.length;
                            i++)
                          InkWell(
                            onTap: () async {
                              bool permission = await PermissionService()
                                  .cameraAndStoragePermission();
                              // PermissionStatus permission =
                              //     await Permission.camera.request();

                              // if(permission.isGranted)
                              if (permission) {
                                // ignore: use_build_context_synchronously
                                await showDialog(
                                    context: context,
                                    builder: (s) {
                                      return dialog();
                                    });
                                // ignore: unnecessary_null_comparison
                                if (selectedImages != null &&
                                    selectedImages.isNotEmpty) {
                                  uploadFeedBloc.fileImgs!.addAll(
                                      selectedImages.map<ImgDetail>((e) {
                                    return ImgDetail(
                                        isFileLocal: true,
                                        file: e,
                                        filepath: e.path);
                                  }));
                                  selectedImages.clear();
                                }
                              }
                            },
                            child: i == uploadFeedBloc.fileImgs!.length
                                ? const Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.amber,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        )))
                                : Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundImage: (uploadFeedBloc
                                                    .fileImgs![i].isFileLocal ??
                                                false)
                                            ? FileImage(uploadFeedBloc
                                                .fileImgs![i]
                                                .file as File) as ImageProvider
                                            : NetworkImage(uploadFeedBloc
                                                .fileImgs![i].imagepath!),
                                      ),
                                    )),
                          ),
                      ],
                    ),
                  ),
                ),
                Text(uploadFeedBloc.fileImgs!.length.toString()),
                CustomButtonElevated(
                    type: ButtonType.primarySmallButton,
                    text: "ADD IMAGE",
                    onTap: () {
                      uploadFeedBloc.add(FeedUloadInintalEvent());
                    })
              ],
            ));
      },
    );
  }

  getPermisstion() async {
    PermissionStatus cammeraStatus = await Permission.camera.request();

    if (cammeraStatus == PermissionStatus.granted) {
      // openAleart();
    } else if (cammeraStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("you need to provide camera permission")));
    } else if (cammeraStatus == PermissionStatus.permanentlyDenied) {
      setState(() {
        flag = true;
        openAppSettings();
      });
    }
  }

  Future<List<File>> GallerySelection() async {
    try {
      final imagetemp = await ImagePicker()
          .pickMultiImage(imageQuality: 100, maxHeight: 2000, maxWidth: 2000);
      // if (imagetemp == null) return;
      // final imagelocation = File(imagetemp.path!);
      List<XFile> xfilePick = imagetemp;
      setState(() {
        // myimagepath = imagelocation;
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(
              File(xfilePick[i].path),
            );

            print("selll");
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to Select Image $e");
      }
    }

    return selectedImages;
  }

  Future<File?> CameraSelection() async {
    try {
      final imagetemp =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imagetemp == null) return null;
      final imagelocation = File(imagetemp.path);

      setState(() {
        _image = File(imagetemp.path);
      });
    } on PlatformException catch (e) {
      print("Failed to Select Image $e");
    }
    return _image;
  }

  File? myimagepath;
  bool flag = false;
  var _image;

  int choosetype = 0;
  List<File> selectedImages = [];
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && flag) {
      setState(() {
        flag = false;
      });
      getPermisstion();
    }
  }

  dialog() {
    return Dialog(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Add Photo!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SvgPicture.asset("assets/images/group_icon_1.svg"),
                onTap: () async {
                  selectedImages = await GallerySelection();
                  Navigator.pop(context);
                  print(selectedImages.length);
                },
              ),
              GestureDetector(
                child: SvgPicture.asset("assets/images/group_icon_2.svg"),
                onTap: () async {
                  File? selectes = await CameraSelection();
                  List<File> abc = [];
                  if (selectes != null) {
                    abc.add(selectes);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Choose from gallery",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
              Padding(
                padding: EdgeInsets.only(right: 13),
                child: Text(
                  "Take a picture",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          // Image(image: NetworkImage(url)),
          Padding(
            padding: const EdgeInsets.only(left: 180, top: 6),
            child: TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
