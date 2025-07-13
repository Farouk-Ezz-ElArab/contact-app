import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/widgets/contact_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'contact_card_widget.dart';

class ScreenContacts extends StatelessWidget {
  List<ContactModel> contacts;
  final Function deleteContact;
  final Function addContact;
  final Function(ContactModel) deleteSpecificContact;

  ScreenContacts({
    super.key,
    required this.contacts,
    required this.deleteContact,
    required this.addContact,
    required this.deleteSpecificContact,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  return ContactCardWidget(
                    contact: contacts[index],
                    onDelete: deleteSpecificContact, // Directly pass the function
                  );
                },
                itemCount: contacts.length,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    deleteContact(); // Delete last contact
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    fixedSize: Size.square(screenSize.width * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  child: Icon(
                    Icons.delete,
                    size: screenSize.width * 0.08,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.015),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ContactBottomSheet(contacts: contacts, addContact: addContact),
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
        )
      ],
    );
  }
}