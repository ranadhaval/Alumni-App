// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_material_symbols/flutter_material_symbols.dart';
// import 'package:alumni/Functions/common.dart';
// import 'package:alumni/Pages/account.dart';
// import 'package:alumni/Widgets/Widgets/custom_text.dart';
// import '../../Constants/strings.dart';
// import '../../Models/User/user.dart';
// import '../../Pages/cart.dart';
// import '../../Pages/home.dart';
// import '../../Widgets/Widgets/bottom_navigation.dart';
// import '../app_colors.dart';
// import '../app_typography.dart';

// class BottomNav extends StatefulWidget {
//   static String routeName = '/bottom-nav';
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   bool _showFab = true;
//   int currentPageIndex = 0;

//   User user = User(
//     email: "",
//     fullName: "",
//     mobileNumber: "",
//   );

//   @override
//   Widget build(BuildContext context) {
//     const duration = Duration(milliseconds: 300);
//     return WillPopScope(
//       onWillPop: () async => false, //this will restrict to go back
//       child: Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//         //Bottom Navigation
//         floatingActionButton: AnimatedSlide(
//             duration: duration,
//             offset: _showFab ? Offset.zero : Offset(0, 2),
//             child: SafeArea(
//               child: AnimatedOpacity(
//                   duration: duration,
//                   opacity: _showFab ? 1 : 0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),

//                     //Outer curve Container
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       decoration: getBoxDecorationAll(
//                           20, AppColors.getColor(AppColorsEnum.lintColor)),
//                       child: BottomBar(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                         border: cardShapeBorder(35),
//                         curve: Curves.ease,
//                         showActiveBackgroundColor: true,
//                         onTap: (int index) {
//                           setState(() {
//                             currentPageIndex = index;
//                           });
//                         },
//                         items:
//                             createBottomBarItems(context, bottomBarItemModels),
//                         selectedIndex: currentPageIndex,
//                       ),
//                     ),
//                   )),
//             )),
//         body: <Widget>[
//           NotificationListener<UserScrollNotification>(
//               onNotification: (notification) {
//                 //final VerticalDirection verticalDirection = notification.direction;
//                 final ScrollDirection direction = notification.direction;
//                 setState(() {
//                   if (direction == ScrollDirection.reverse) {
//                     _showFab = false;
//                   } else if (direction == ScrollDirection.forward) {
//                     _showFab = true;
//                   }
//                 });
//                 return true;
//               },
//               child: HomePage()),
//           //Cart,
//           Cart(
//             days: 0,
//             quantity: 0,
//             totalPrice: 0,
//           ),

//           //Accounts
//           Account(
//             user: user,
//           ),
//           //MyCartPage(),
//         ][currentPageIndex],
//       ),
//     );
//   }

//   List<BottomBarItemModel> bottomBarItemModels = [
//     BottomBarItemModel(
//       iconData: Icons.home_outlined,
//       textKey: AppStrings.home,
//       inactiveColor: AppColors.getSingleColor(AppColorsEnum.invert),
//       activeColor: AppColors.getSingleColor(AppColorsEnum.white),
//     ),
//     BottomBarItemModel(
//       iconData: Icons.shopping_cart_outlined,
//       textKey: AppStrings.cart,
//       inactiveColor: AppColors.getSingleColor(AppColorsEnum.invert),
//       activeColor: AppColors.getSingleColor(AppColorsEnum.white),
//     ),
//     BottomBarItemModel(
//       iconData: Icons.account_circle_outlined,
//       textKey: AppStrings.account,
//       inactiveColor: AppColors.getSingleColor(AppColorsEnum.invert),
//       activeColor: AppColors.getSingleColor(AppColorsEnum.white),
//     ),
//   ];
// }

// class BottomBarItemModel {
//   final IconData iconData;
//   final String textKey;
//   final Color inactiveColor;
//   final Color activeColor;

//   BottomBarItemModel({
//     required this.iconData,
//     required this.textKey,
//     required this.inactiveColor,
//     required this.activeColor,
//   });
// }

// List<BottomBarItem> createBottomBarItems(
//     BuildContext context, List<BottomBarItemModel> models) {
//   List<BottomBarItem> bottomBarItems = [];

//   for (int i = 0; i < models.length; i++) {
//     bottomBarItems.add(BottomBarItem(
//       backgroundColorOpacity: 1,
//       title: Center(
//         child: CustomText(
//           textKey: models[i].textKey,
//           style: AppTextStyle.titleMedium,
//           color: AppColors.getSingleColor(AppColorsEnum.white),
//         ),
//       ),
//       inactiveIcon: Icon(
//         models[i].iconData,
//         color: models[i].inactiveColor,
//       ),
//       // : Icon(
//       //   models[i].iconData,
//       //   color: models[i].activeColor,
//       // ),
//       activeColor: AppColors.getSingleColor(AppColorsEnum.primary),
//       icon: Icon(
//         models[i].iconData,
//         color: models[i].activeColor,
//       ),
//     ));
//   }

//   return bottomBarItems;
// }
