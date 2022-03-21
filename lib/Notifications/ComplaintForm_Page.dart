import 'package:flutter/material.dart';

class ComplaintForm extends StatefulWidget{
  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text(
            'Complaint Form'
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children:[
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Complain About (Recruiter Or Company)'
                ),
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return'Please Enter Some Text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Reason of Complaint'
                ),
                validator: (value){
                  if(value==null ||value.isEmpty){
                    return'Please Enter Some Text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child:ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Prossesing Data')),
                        );
                      }
                    },
                    child: Text('Submit'),
                  )
              )
            ]
        ),
      ),

    );
  }
}