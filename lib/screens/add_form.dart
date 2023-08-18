// import 'package:api_crud/models/sample_model.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class AddForm extends StatefulWidget {
//   const AddForm({super.key});

//   @override
//   State<AddForm> createState() => _AddFormState();
// }

// class _AddFormState extends State<AddForm> {

//   TextEditingController _name = TextEditingController();
//   TextEditingController _address = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _mobile = TextEditingController();

//   void createNewRec(){
//     showDialog(
//       context: context, 
//       builder: (context){
//         return AlertDialog(
//           content: Container(
//             height: 350,
//             child: Center(
//               child: Column(
//                 children: [
//                   Container(
//                     child: TextField(
//                       controller: _name,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter Name',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     child: TextField(
//                       controller: _address,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter Address',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     child: TextField(
//                       controller: _email,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter Email',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     child: TextField(
//                       controller: _mobile,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter Mobile',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     width: 300,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: (){
//                         postData();
                        
//                       }, 
//                       child: Text("Save",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
//                   ),


//                 ],
//               )),
//           ),
//         );
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//         onPressed: createNewRec,
//         child: Icon(Icons.add),
//       );
//   }

//   void postData () async {
//     var response = await http.post(Uri.parse('http://10.0.2.2:8000/user/'),
    
//     body: {
//       "name": _name.text,
//       "address": _address.text,
//       "email": _email.text,
//       "mobile": _mobile.text
    
//     }
//     );
//     setState(() {
      
//     });
//     Navigator.of(context).pop();
    
//   }
// }