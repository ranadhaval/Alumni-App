import 'package:flutter/material.dart';
import 'app_typography.dart';

class StyleGuide extends StatelessWidget {
  const StyleGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //TextStyles
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heading1',
                          style: AppTextStyle.headlineLarge,
                        ),
                        Text(
                          'Heading2',
                          style: AppTextStyle.headlineMedium,
                        ),
                        Text(
                          'Heading3',
                          style: AppTextStyle.headlineSmall,
                        ),
                        Text(
                          'titleLarge',
                          style: AppTextStyle.titleLarge,
                        ),
                        Text(
                          'titleMedium',
                          style: AppTextStyle.titleMedium,
                        ),
                        Text(
                          'bodyText1',
                          style: AppTextStyle.titleSmall,
                        ),
                        Text(
                          'bodyText2',
                          style: AppTextStyle.bodyMedium,
                        ),
                        Text(
                          'caption',
                          style: AppTextStyle.bodySmall,
                        ),
                      ],
                    ),
                    //Color Pallete
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ColorSwitch(context, "Primary Color",
                            Theme.of(context).primaryColor),
                        ColorSwitch(context, "Secondary Color",
                            Theme.of(context).secondaryHeaderColor),
                        ColorSwitch(
                            context, "Card Color", Theme.of(context).cardColor),
                        ColorSwitch(context, "Background Color",
                            Theme.of(context).scaffoldBackgroundColor),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text(
                    'Elevated Button',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // navigateToPageWithoutReplaceMentNamed(BottomNav.routeName);
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.ice_skating_outlined, color: Colors.white),
                  label: Text(
                    'Elevated Icon Button',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
                // CustomButton(text: "Primary Button", onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Primary Button", enableIcon: false, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Secondary Button", secondary: true, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Secondary Button", enableIcon: false, secondary: true, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Small", enableSmallButton: true, width: 120, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Small", enableIcon: false, enableSmallButton: true, width: 120, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Small", secondary: true, enableSmallButton: true, width: 120, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomButton(text: "Small", enableIcon: false, secondary: true, enableSmallButton: true, width: 120, onPressed: () {}),
                // LayoutHelper.height10(),,
                // CustomTextField(
                //   hintText: "Custom Textfield",
                // ),
                // LayoutHelper.height10(),,
                // CustomTextField(
                //   hintText: "Prefix Icon Custom Textfield",
                //   prefix: Icon(Icons.abc),
                // ),
                // LayoutHelper.height10(),,
                // CustomTextField(
                //   hintText: "Suffix Icon Custom Textfield",
                //   suffixIcon: Icon(Icons.search),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ColorSwitch(BuildContext context, String text, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      height: 50,
      width: 100,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(height: 1, fontSize: 12),
      ),
    ),
  );
}
