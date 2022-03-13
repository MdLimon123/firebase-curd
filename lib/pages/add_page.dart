import 'package:firebase_crud/pages/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOTES"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleC,
                      validator: (v){
                        if(v!.isEmpty){
                          return 'please enter title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      controller: detailC,
                      maxLines: 7,
                      minLines: 1,
                      validator: (v){
                        if(v!.isEmpty){
                          return 'please enter detail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter detail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20.0,),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                            minimumSize:
                            MaterialStateProperty.all(const Size(double.infinity, 40))
                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            DataBaseServices.addData(titleC.text, detailC.text);
                          }
                        },
                        child: const Text('Add')
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
