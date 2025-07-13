import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ContactCardWidget extends StatelessWidget {
  final ContactModel contact;
  final Function(ContactModel) onDelete;
  const ContactCardWidget({super.key, required this.contact, required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gold,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                contact.imageFile == null
                    ? Lottie.asset(AppAnimation.imagePicker)
                    : ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.file(
                    contact.imageFile!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contact.userName,
                    style: AppTextStyles.cardUserNameTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppIcons.emailIcon),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        contact.email,
                        style: AppTextStyles.cardContentTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(AppIcons.phoneIcon),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        contact.phone,
                        style: AppTextStyles.cardContentTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    onDelete(contact);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 8),
                      Text('Delete', style: AppTextStyles.deleteClickTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}