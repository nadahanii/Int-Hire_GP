import 'package:flutter/material.dart';

class ComplaintForm extends StatefulWidget{
  final ThemeData complaintTheme;
  const ComplaintForm({Key? key,required this.complaintTheme}) : super(key: key);
  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.complaintTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.complaintTheme.appBarTheme.backgroundColor,
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon:Icon(
              Icons.arrow_back,
              color:Colors.white,
            )
        ),
        title: Text(
            'Complaint Form',
          style:widget.complaintTheme.textTheme.headline1,
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
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: TextFormField(
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
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(4, 88, 125,1),
                      fixedSize: Size(150,35)

                    ),
                    /*style: ElevatedButtonTheme(

                    ),*/
                    child: Text('Submit',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    ),
                  )
              )
            ]
        ),
      ),

    );
  }
}