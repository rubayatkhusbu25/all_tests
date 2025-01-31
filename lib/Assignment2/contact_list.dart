import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  List<Map<String, String>> contacts = [];

  void addContact() {
    String name = nameController.text.trim();
    String number = numberController.text.trim();
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add({'name': name, 'number': number});
      });
      nameController.clear();
      numberController.clear();
    }
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact List",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade300,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Number",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: addContact,
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey.shade300),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => showDia(context, index),
                    child: Card(
                      color: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.brown, size: 32.r),
                        title: Text(
                          contacts[index]['name']!,
                          style: TextStyle(fontSize: 18.sp, color: Colors.red, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          contacts[index]['number']!,
                          style: TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(Icons.call, color: Colors.blue),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDia(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Confirmation",
                  style: TextStyle(fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h),
                Text(
                  "Are you sure you want to delete?",
                  style: TextStyle(fontSize: 17.sp, color: Colors.black),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.no_sim_outlined, color: Colors.blue, size: 28.r),
                    ),
                    SizedBox(width: 40.w),
                    GestureDetector(
                      onTap: () {
                        deleteContact(index);
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.delete_outline_rounded, color: Colors.blue, size: 30.r),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}