import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:history_feature/models/notification.dart' as n;
import '../providers/auth.dart';
import '../providers/notifications.dart';

class ComplaintForm extends StatefulWidget {
  const ComplaintForm({Key? key}) : super(key: key);
  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Complaint Form',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'title',
                  hintText: 'title of complain',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Some Text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            if(Provider.of<Auth>(context, listen: false).userType == "Admin")
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'email',
                  hintText: 'enter receiver email',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'description',
                  hintText: 'description of complain',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Some Text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final notification = n.Notification(
                      id: 0,
                      description: _descriptionController.text,
                      title: _titleController.text,
                      receiverEmail: _emailController.text,
                    );
                    if (_formKey.currentState!.validate()) {
                      Provider.of<Notifications>(
                        context,
                        listen: false,
                      ).addNotifications(notification).then((value) {
                        if (value == "add notification successfully") {
                          Navigator.of(
                            context,
                          ).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('complaint send successfully')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value)),
                          );
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(4, 88, 125, 1),
                      fixedSize: Size(150, 35)),
                  /*style: ElevatedButtonTheme(

                      ),*/
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
