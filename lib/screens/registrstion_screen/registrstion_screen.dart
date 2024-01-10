import 'package:flutter/material.dart';
import 'package:ociuz/controller/registration_controller/regcontroller.dart';
import 'package:ociuz/model/regmodel/reg_model.dart';
import 'package:ociuz/screens/data_view/data_view_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // @override
  // void initState() {
  //   loadDbData();
  //   super.initState();
  // }

  // loadDbData() async {
  //   await controller.loadDb();
  //   setState(() {});
  // }

  Regcontroller controller = Regcontroller();
  final _formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emaeilcontoller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Full name',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('required');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emaeilcontoller,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('required');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: mobilecontroller,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Mobile',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('required');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: designationcontroller,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Designation',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('required');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        controller.Savedata(Regmodel(
                            name: namecontroller.text,
                            email: emaeilcontoller.text,
                            mobile: int.parse(mobilecontroller.text),
                            designation: designationcontroller.text));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataViewScreen()));
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

registerdata() {}
