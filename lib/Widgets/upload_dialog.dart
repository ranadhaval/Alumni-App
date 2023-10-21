// import 'dart:io';

// // import 'package:button_task/main.dart';
// import 'package:alumni/Constants/image_constant.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';

// class Diloagbox extends StatefulWidget {
//   Diloagbox({super.key});

//   @override
//   State<Diloagbox> createState() => _DiloagboxState();
// }

// class _DiloagboxState extends State<Diloagbox> with WidgetsBindingObserver {
//   File? myimagepath;
//   bool flag = false;
//   var _image;

//   int choosetype = 0;
//   List<File> selectedImages = [];
//   final picker = ImagePicker();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed && flag) {
//       setState(() {
//         flag = false;
//       });
//       getPermisstion();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Dialog(
//       shadowColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Text(
//                   "Add Photo!",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 child: SvgPicture.asset("assets/images/group_icon_1.svg"),
//                 onTap: () async {
//                   selectedImages = await GallerySelection();
//                   Navigator.pop(context);
//                 },
//               ),
//               GestureDetector(
//                 child: SvgPicture.asset("assets/images/group_icon_2.svg"),
//                 onTap: () async {
//                   File? selectes = await CameraSelection();
//                   List<File> abc = [];
//                   if (selectes != null) {
//                     abc.add(selectes);
//                   }
//                   Get.back(result: abc);
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("Choose from gallery",
//                   style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black)),
//               Padding(
//                 padding: EdgeInsets.only(right: 13),
//                 child: Text(
//                   "Take a picture",
//                   style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           // Image(image: NetworkImage(url)),
//           Padding(
//             padding: const EdgeInsets.only(left: 180, top: 6),
//             child: TextButton(
//               onPressed: () {
//                 Navigator.of(context, rootNavigator: true).pop();
//               },
//               child: const Text(
//                 "Cancel",
//                 style: TextStyle(color: Colors.red, fontSize: 15),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   getPermisstion() async {
//     PermissionStatus cammeraStatus = await Permission.camera.request();

//     if (cammeraStatus == PermissionStatus.granted) {
//       // openAleart();
//     } else if (cammeraStatus == PermissionStatus.denied) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("you need to provide camera permission")));
//     } else if (cammeraStatus == PermissionStatus.permanentlyDenied) {
//       setState(() {
//         flag = true;
//         openAppSettings();
//       });
//     }
//   }

//   Future<List<File>> GallerySelection() async {
//     try {
//       final imagetemp = await ImagePicker()
//           .pickMultiImage(imageQuality: 100, maxHeight: 2000, maxWidth: 2000);
//       // if (imagetemp == null) return;
//       // final imagelocation = File(imagetemp.path!);
//       List<XFile> xfilePick = imagetemp;
//       setState(() {
//         // myimagepath = imagelocation;
//         if (xfilePick.isNotEmpty) {
//           for (var i = 0; i < xfilePick.length; i++) {
//             selectedImages.add(
//               File(xfilePick[i].path),
//             );

//             print("selll");
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       });
//     } on PlatformException catch (e) {
//       if (kDebugMode) {
//         print("Failed to Select Image $e");
//       }
//     }

//     return selectedImages;
//   }

//   Future<File?> CameraSelection() async {
//     try {
//       final imagetemp =
//           await ImagePicker().pickImage(source: ImageSource.camera);
//       if (imagetemp == null) return null;
//       final imagelocation = File(imagetemp.path);

//       setState(() {
//         _image = File(imagetemp.path);
//       });
//     } on PlatformException catch (e) {
//       print("Failed to Select Image $e");
//     }
//     return _image;
//   }



// }
