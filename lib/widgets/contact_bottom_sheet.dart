import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_text_styles.dart';
import 'package:contact_app/utils/image_picker.dart';
import 'package:contact_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ContactBottomSheet extends StatefulWidget {
  final List <ContactModel> contacts ;
   ContactBottomSheet({super.key, required this.contacts, required this.addContact});
   final Function addContact;
  @override
  State<ContactBottomSheet> createState() => _ContactBottomSheetState();
}
class _ContactBottomSheetState extends State<ContactBottomSheet> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPhoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? pickedImage;
  //@override
  // void initState() {
  //   super.initState();
  //   userNameController.addListener(() => setState(() {}));
  //   userEmailController.addListener(() => setState(() {}));
  //   userPhoneController.addListener(() => setState(() {}));
  // }
  //
  // @override
  // void dispose() {
  //   userNameController.dispose();
  //   userEmailController.dispose();
  //   userPhoneController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          color: AppColors.darkBlue,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: AppColors.gold),
                      ),
                      child: pickedImage == null
                          ? Center(
                              child: GestureDetector(
                                child: Lottie.asset(AppAnimation.imagePicker),
                                onTap: () async {
                                  File? tempImage =
                                      await ImagesPicker.cameraPicker();
                                  if (tempImage != null) {
                                    pickedImage = tempImage;
                                    setState(() {});
                                  }
                                },
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(28),
                              child: Image.file(
                                pickedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: userNameController,
                          builder: (BuildContext context, value, _) {
                            return Text(
                              value.text.isEmpty
                                  ? 'User Name'
                                  : value.text,
                              style: AppTextStyles.textFormCardTextStyle,
                              textAlign: TextAlign.start,
                            );
                          },
                        ),
                        Divider(height: 20, color: AppColors.gold),
                        ValueListenableBuilder(
                          valueListenable: userEmailController,
                          builder: (BuildContext context, value, _) {
                            return Text(
                              value.text.isEmpty
                                  ? 'examole@email.com'
                                  : value.text,
                              style: AppTextStyles.textFormCardTextStyle,
                              textAlign: TextAlign.start,
                            );
                          },
                        ),
                        Divider(height: 20, color: AppColors.gold),
                        ValueListenableBuilder(
                          valueListenable: userPhoneController,
                          builder: (BuildContext context, value, _) {
                            return Text(
                              value.text.isEmpty
                                  ? '+20000000000'
                                  : value.text,
                              style: AppTextStyles.textFormCardTextStyle,
                              textAlign: TextAlign.start,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: userNameController,
                text: 'Enter User Name',
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: userEmailController,
                text: 'Enter User Email',
                isEmail: true,
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: userPhoneController,
                text: 'Enter User Phone',
                isPhone: true,
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  addContact();
                },
                child: Text(
                  'Enter user',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void addContact() {
    if (_formKey.currentState!.validate()) {
      String userName = userNameController.text;
      String userEmail = userEmailController.text;
      String userPhone = userPhoneController.text;
      widget.contacts.add(
        ContactModel(
          userName: userName,
          email: userEmail,
          phone: userPhone,
          imageFile: pickedImage,
        ),
      );
      widget.addContact();
      Navigator.pop(context);
    }
  }
}
