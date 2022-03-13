import 'package:firebase_crud/pages/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class EditDataPage extends StatelessWidget {
  String? title;
  String? detail;
  String? id;

  EditDataPage({Key? key, this.title, this.detail, this.id}) : super(key: key);

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
                          labelText: '$title',
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
                          labelText: '$detail',
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
                            DataBaseServices.updateData(id!, titleC.text, detailC.text);
                          }
                        },
                        child: const Text('UPDATE')
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
