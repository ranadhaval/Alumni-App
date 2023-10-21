import 'package:alumni/Blocs/HomeBloc/HomeEvent/home_event.dart';
import 'package:alumni/Blocs/HomeBloc/HomeState/home_state.dart';
import 'package:alumni/Blocs/HomeBloc/home_bloc.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/MyAlumni/UI/alumni_profile.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../themeFiles/app_colors.dart';

class Alumni extends StatefulWidget {
  const Alumni({super.key});

  @override
  State<Alumni> createState() => _AlumniState();
}

class _AlumniState extends State<Alumni> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: HexColor("#f8f8f8"),
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: AppColors.getColor(
                AppColorsEnum.primary,
              )),
        ),
        child: BlocConsumer<HomeBloc, HomeMainState>(
          listener: (context, state) {
            if (state is HomeErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                WidgetHelper.getSnackBar(
                    context, state.error.toString(), Colors.green),
              );
            }
          },
          builder: (context, state) {
            return body(context, state);
          },
        ));
  }

  body(context, state) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      height: height,
      width: width,
      child: (state is HomeIdsLoadingState)
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // InkWell(
                    //     onTap: () {
                    //       // Navigator.pushAndRemoveUntil(
                    //       //     context,
                    //       //     MaterialPageRoute(builder: (_) => const Home()),
                    //       //     (route) => false);
                    //     },
                    //     child: SvgPicture.asset(ImageConstant.arrowBack)),
                    LayoutHelper.width10(),
                    CustomText(
                      textKey: "Alumni",
                      color: AppColors.getColor(AppColorsEnum.primary),
                      size: 15,
                    ),
                  ],
                ),
                LayoutHelper.height20(),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black12)),
                        child: CustomInputField(
                            verticalContentPadding: 0,
                            horizontalContentPadding: 4,
                            prefixWidget: const Icon(
                              Icons.search,
                              size: 25,
                            ),
                            borderRadius: 20,
                            allBorderdisable: true,
                            hintstyle: const TextStyle(
                                fontSize: 12, color: Colors.black12),
                            fillColor: AppColors.getColor(AppColorsEnum.white),
                            hint: "Search Alumni/ Events/ News....",
                            textEditingController: _controller),
                      ),
                    ),
                    LayoutHelper.width5(),
                    Expanded(child: SvgPicture.asset(ImageConstant.filter)),
                  ],
                ),
                LayoutHelper.height20(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 7, bottom: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.getColor(AppColorsEnum.secondaryColor),
                  ),
                  child: CustomText(
                    textKey: "Your Batchmates",
                    color: AppColors.getColor(AppColorsEnum.white),
                    size: 10,
                  ),
                ),
                LayoutHelper.height10(),
                SizedBox(
                  height: height * 0.7,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    itemCount:
                        homeBloc.alumniResponse.alumniFeedIdRes.data?.length,
                    staggeredTileBuilder: (index) {
                      return const StaggeredTile.fit(1);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return batchmetsTile(
                          passingClass: homeBloc.alumniResponse.alumniFeedIdRes
                              .data![index].userDetails!.passingClass
                              .toString(),
                          conncted: connctedList[index % connctedList.length],
                          name: homeBloc.alumniResponse.alumniFeedIdRes
                              .data![index].firstName
                              .toString(),
                          email: homeBloc
                              .alumniResponse.alumniFeedIdRes.data![index].email
                              .toString(),
                          id: homeBloc
                              .alumniResponse.alumniFeedIdRes.data![index].id);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  List<bool> connctedList = [
    true,
    true,
    false,
    true,
    false,
    false,
    false,
    false
  ];
  batchmetsTile(
      {bool conncted = false,
      required String name,
      email,
      int? id,
      required String passingClass}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) =>
                        HomeBloc()..add(HomeViewProfileEvent(id: "$id")),
                    child: AlumniProfile(),
                  )),
        );
      },
      child: Container(
        height: height * 0.33,
        width: width * 0.43,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height * 0.3,
                width: width * 0.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.7, 0.7),
                          spreadRadius: 0.3,
                          blurStyle: BlurStyle.inner,
                          blurRadius: 0.8,
                          color: Colors.grey.shade400)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 35,
                        child: Image(
                            image: AssetImage(ImageConstant.sampleImage))),
                    CustomText(
                      textKey: name,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: email,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Graphic Designing",
                      color: Colors.black45,
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Collage of Arts, Delhi",
                      color: Colors.black45,
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Strudent of $passingClass pass",
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 17,
                        ),
                        LayoutHelper.width5(),
                        CustomText(
                          textKey: "Delhi",
                          size: 10,
                          bold: true,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            conncted
                ? Padding(
                    padding: const EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: CustomText(
                          textKey: "Connected",
                          color: AppColors.getColor(AppColorsEnum.white),
                          size: 8,
                        ),
                      ),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 7, bottom: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.getColor(AppColorsEnum.secondaryColor),
                ),
                child: CustomText(
                  textKey: "View Profile",
                  color: AppColors.getColor(AppColorsEnum.white),
                  size: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
