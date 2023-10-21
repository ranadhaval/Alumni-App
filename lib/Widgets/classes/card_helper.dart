import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:intl/intl.dart';
import 'package:alumni/Models/Common/productmodel.dart';
import 'package:alumni/main.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/app_typography.dart';

import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Models/Common/cardmodel.dart';
import '../../themeFiles/layout_helper.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text.dart';
import '../Widgets/custom_text_string.dart';
import 'widget_helper_class.dart';

//all cards
class CardHelper {
  static shopCard(
    ShopModel shopCard,
    dynamic onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                Card(
                  elevation: 0,
                  color: cardBackgroundColor,
                  child: Container(
                    decoration: getBoxDecorationAll(
                        0, AppColors.getColor(AppColorsEnum.background)),
                    width: width,
                    height: 135,
                    child: ClipRRect(
                      borderRadius: getBorderRadiusAll(15),
                      child: WidgetHelper.getCachedImageWithFit(
                          //TODO
                          shopCard.coverImage!,
                          BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    left: 15,
                    bottom: 15,
                    child: WidgetHelper()
                        .getCircularCachedImage(shopCard.brandImage!, 50, 50)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: shopCard.name!,
                    style: AppTextStyle.bodyMedium,
                  ),
                  WidgetHelper.getRichText(
                      "${shopCard.distanceAway.toString()} ", AppStrings.kmAway,
                      text1Color:
                          AppColors.getColor(AppColorsEnum.secondaryColor),
                      isBold: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static sessionCard(
    SessionModel sessionCard, {
    dynamic onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: cardBackgroundColor,
              child: Container(
                height: 150,
                decoration: getBoxDecorationAll(
                    0, AppColors.getColor(AppColorsEnum.background)),
                width: width,
                child: ClipRRect(
                  borderRadius: getBorderRadiusAll(15),
                  child: WidgetHelper.getCachedImageWithFit(
                      sessionCard.coverImage!, BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextString(
                    text: sessionCard.name!,
                    style: AppTextStyle.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static checkoutCard({
    required String title,
    required double totalPrice,
  }) {
    late TextEditingController _quantityController;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Card(
        color: AppColors.getColor(AppColorsEnum.lintColor),
        elevation: 0,
        shape: cardShapeBorder(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(textKey: title),
              CustomText(textKey: '${totalPrice.toStringAsFixed(2)} KWD'),
            ],
          ),
        ),
      ),
    );
  }

  static Card addressCard(AddressModel address) {
    return Card(
      elevation: 0,
      color: AppColors.getColor(AppColorsEnum.lintColor),
      shape: cardShapeBorder(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                  height: 40,
                  width: 40,
                  decoration: getBoxDecorationAll(
                      50, AppColors.getSingleColor(AppColorsEnum.primary)),
                  child: Icon(
                    address.label == "Home"
                        ? Icons.home_filled
                        : address.label == "Work"
                            ? MaterialSymbols.business_center
                            : Icons
                                .business_center, //can add different for others
                    color: AppColors.getSingleColor(AppColorsEnum.white),
                  )),
              trailing: SizedBox(
                width: 70,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      color: AppColors.getColor(AppColorsEnum.shadow),
                    ),
                    LayoutHelper.width5(),
                    Icon(MaterialSymbols.delete,
                        color: AppColors.getColor(AppColorsEnum.shadow))
                  ],
                ),
              ),
              title: CustomText(
                  textKey: address.label ?? '',
                  style: AppTextStyle.titleMedium),
            ),
            LayoutHelper.height10(),
            CustomText(
                textKey: address.name ?? '', style: AppTextStyle.bodyMedium),
            LayoutHelper.height10(),
            Text.rich(
              TextSpan(
                style: AppTextStyle.bodyMedium,
                children: [
                  if (address.addressLine1 != null)
                    TextSpan(text: '${address.addressLine1}, '),
                  if (address.addressLine2 != null)
                    TextSpan(text: '${address.addressLine2}, '),
                  if (address.road != null) TextSpan(text: '${address.road}, '),
                  if (address.block != null)
                    TextSpan(text: '${AppStrings.block} : ${address.block}, '),
                  if (address.street != null)
                    TextSpan(
                        text: '${AppStrings.street} : ${address.street}, '),
                  if (address.avenue != null)
                    TextSpan(
                        text: '${AppStrings.avenue} : ${address.avenue}, '),
                  if (address.landmark != null)
                    TextSpan(
                        text: '${AppStrings.landmark} : ${address.landmark}, '),
                  if (address.floor != null)
                    TextSpan(text: '${address.floor}, '),
                  if (address.flat != null) TextSpan(text: '${address.flat}, '),
                ],
              ),
              style: AppTextStyle.bodyMedium,
            ),

            //city and state
            // SizedBox(height: 4),
            // Text(
            //   '${address.city?.name ?? ''}, ${address.city?.state?.name ?? ''}',
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }

  static Card orderCard(OrderModel order) {
    DateTime? orderedDate = order.date;
    String formattedOrdered = DateFormat('dd/MM/yyyy').format(orderedDate);
    return Card(
      elevation: 0,
      color: AppColors.getColor(AppColorsEnum.lintColor),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: formattedOrdered.toString(),
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: AppColors.getColor(AppColorsEnum.subHeading),
                    decoration: TextDecoration.underline,
                  ),
                ),
                CustomText(
                  textKey: '${order.amount} KWD',
                  style: AppTextStyle.titleSmall,
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: getBorderRadiusAll(100),
                  child: WidgetHelper.getCachedImageWithFit(
                      order.coverImage, BoxFit.cover),
                ),
              ),
              title: CustomText(textKey: order.name),
              subtitle: CustomText(
                  textKey: order.quantity != null
                      ? '${AppStrings.qty} -  ${order.quantity} ${AppStrings.items}'
                      : '${AppStrings.day} -  ${order.days} ${AppStrings.daysLeft},  '),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(textKey: '${AppStrings.order}  #${order.id}'),
                Container(
                  width: 100,
                    decoration: getBoxDecorationWithBorder(
                        25,
                        AppColors.getColor(AppColorsEnum.lintColor),
                        order.orderStatus == OrderStatus.Ordered || order.orderStatus == OrderStatus.Placed
                            ? AppColors.getColor(AppColorsEnum.yellow)
                            : order.orderStatus == OrderStatus.Delivered || order.orderStatus == OrderStatus.Completed
                            ? AppColors.getColor(AppColorsEnum.lightGreen)
                            : order.orderStatus == OrderStatus.Cancelled
                            ? AppColors.getColor(AppColorsEnum.red): AppColors.getColor(AppColorsEnum.primary)),
                    padding: EdgeInsets.all(10),
                    child:
                        Center(
                          child: CustomText(textKey: getStatusText(order.orderStatus), style: AppTextStyle.bodyMedium.copyWith(
                            color: order.orderStatus == OrderStatus.Ordered || order.orderStatus == OrderStatus.Placed
                                ? AppColors.getColor(AppColorsEnum.yellow)
                                : order.orderStatus == OrderStatus.Delivered || order.orderStatus == OrderStatus.Completed
                                ? AppColors.getColor(AppColorsEnum.lightGreen)
                                : order.orderStatus == OrderStatus.Cancelled
                                ? AppColors.getColor(AppColorsEnum.red): AppColors.getColor(AppColorsEnum.primary)
                          ),),
                        )),
              ],
            )
          ],
          // leading: Image.asset(
          //   order.coverImage,
          //   width: 60,
          //   height: 60,
          // ),
          // title: Text(order.name),
          // subtitle: Text('Amount: \$${order.amount}'),
          // trailing: Text(getStatusText(order.orderStatus)),
        ),
      ),
    );
  }

  static String getStatusText(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.Ordered:
        return 'Ordered';
      case OrderStatus.Placed:
        return 'Placed';
      case OrderStatus.Completed:
        return 'Completed';
      case OrderStatus.Delivered:
        return 'Delivered';
      case OrderStatus.Cancelled:
        return 'Cancelled';
      default:
        throw ArgumentError('Invalid order status: $orderStatus');
    }
  }
}

class CartCard extends StatefulWidget {
  final CartModel cart;
  final Product product;
  final int? days;
  final Function(int)? onQuantityChanged;
  final Color? backgroundColor;
  const CartCard(
      {super.key,
      required this.cart,
      required this.product,
      this.onQuantityChanged,
      this.days,
      this.backgroundColor});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late TextEditingController _quantityController;
  int quantity = 1;
  double? updatePrice;

  @override
  void initState() {
    _quantityController = TextEditingController(text: quantity.toString());
    updatePrice = widget.product.price;

    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          widget.backgroundColor ?? AppColors.getColor(AppColorsEnum.lintColor),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      shape: cardShapeBorder(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                WidgetHelper()
                    .getCircularCachedImage(widget.product.image, 50, 50),
                LayoutHelper.width10(),
                Expanded(child: Text(widget.product.name)),
              ],
            ),
            LayoutHelper.height10(),

            //Quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !widget.product.isForRent
                    ? CustomText(textKey: '${updatePrice} KWD')
                    : CustomText(textKey: '${updatePrice} KWD / day'),
                Row(
                  children: [
                    //removed +
                    // IconButton(
                    //   icon: Icon(Icons.remove),
                    //   onPressed: () {
                    //     setState(() {
                    //       quantity = quantity > 1 ? quantity - 1 : 1;
                    //       updatePrice = widget.product.price * quantity;
                    //       _quantityController.text = quantity.toString();
                    //       if (widget.onQuantityChanged != null) {
                    //         widget.onQuantityChanged!(quantity);
                    //       }
                    //     });
                    //   },
                    // ),

                    //Quantity Text
                    CustomText(
                        textKey: !widget.product.isForRent
                            ? AppStrings.quantity
                            : AppStrings.renting),

                    LayoutHelper.width10(),

                    SizedBox(
                      height: 30.0,
                      width: 50.0,
                      child: Container(
                        decoration: getBoxDecorationWithBorder(
                            5,
                            AppColors.getColor(AppColorsEnum.lintColor),
                            AppColors.getColor(AppColorsEnum.invert)),
                        child: Center(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 0.0),
                            ),
                            controller: TextEditingController(
                                text: quantity.toString()),
                            onChanged: (value) {
                              setState(() {
                                quantity = int.tryParse(value) ?? 1;
                                if (widget.onQuantityChanged != null) {
                                  widget.onQuantityChanged!(quantity);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    Visibility(
                        visible: widget.product.isForRent,
                        child: CustomText(textKey: "days"))

                    //removed -

                    // IconButton(
                    //   icon: Icon(Icons.add),
                    //   onPressed: () {
                    //     setState(() {
                    //       quantity++;
                    //       updatePrice = widget.product.price * quantity;
                    //       _quantityController.text = quantity.toString();
                    //       if (widget.onQuantityChanged != null) {
                    //         widget.onQuantityChanged!(quantity);
                    //       }
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
