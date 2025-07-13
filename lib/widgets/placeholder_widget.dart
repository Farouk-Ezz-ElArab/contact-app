import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_text_styles.dart';
import 'package:contact_app/widgets/contact_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';
class PlaceholderWidget extends StatefulWidget {
  List<ContactModel> contacts;
  final Function addContact;
  PlaceholderWidget({super.key, required this.contacts, required this.addContact});
  @override
  State<PlaceholderWidget> createState() => _PlaceholderWidgetState();
}
class _PlaceholderWidgetState extends State<PlaceholderWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Lottie.asset(AppAnimation.emptyList)),
        Text(
          'There is No Contacts Added Here',
          style: AppTextStyles.firstMainTextStyle,
        ),
        Spacer(),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      ContactBottomSheet(contacts: widget.contacts, addContact: widget.addContact),
                  isScrollControlled: true,
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size.square(screenSize.width * 0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child: Icon(Icons.add, size: screenSize.width * 0.08),
            ),
          ],
        ),
      ],
    );
  }
}