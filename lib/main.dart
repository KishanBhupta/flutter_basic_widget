import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:MyApp(),
  ) );
}



class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController help = TextEditingController();

  List<Map<String,dynamic>> genders = [
    {"index":0,"gender":"Male"},
    {"index":1,"gender":"Female"},
    {"index":2,"gender":"Oth"},
  ];

  int? gender;

  String tfname = "";
  String tfemail = "";
  String tfpassword = "";
  String tfhelp = "";
  // String gender = "";
  // bool male = false ;
  // bool female = false ;
  // bool other = false ;
  bool assistent = false ;
  double salary = 0.0;

  Color color = Colors.blue ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title:Text("From"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20 ),
        centerTitle: true ,
        backgroundColor:color,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Register Your Self",
              style:
              TextStyle(
                  color: color,
                  fontSize:18,
              ),
            ),

            // Name TextBox

            TextField(
              controller: name,
              decoration: InputDecoration(icon:Icon(Icons.person),iconColor: color,labelText:"Enter name"),
            ),

            // Email TextBox

            TextField(
              controller: email,
              decoration: InputDecoration(icon:Icon(Icons.email),iconColor: color,labelText:"Enter Email"),
            ),

            // password TextBox

            TextField(
              controller: password,
              decoration: InputDecoration(icon:Icon(Icons.lock),iconColor: color,labelText:"Enter password",),
            ),

            // Gender
            Row(
              children: [
                Text("Gender",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                Checkbox(
                    value: gender==0,
                    onChanged: (value){
                      setState(() {
                        gender = 0;
                      });
                }),
                Text("Male",style: TextStyle(fontSize: 15)),
                Checkbox(
                    value: gender == 1,
                    onChanged: (value){
                      setState(() {
                        gender = 1;
                      });
                    }),
                Text("Female",style: TextStyle(fontSize: 15)),
                Checkbox(
                    value: gender == 2,
                    onChanged: (value){
                      setState(() {
                        gender = 2;
                      });
                    }),
                Text("Other",style: TextStyle(fontSize: 15)),
              ],
            ),

            // required assistent

            Row(
              children: [
                Text("Require Assistent ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Switch(value: assistent, onChanged: (value){
                  setState(() {
                    assistent = !assistent ;

                  });
                }),

              ],
            ),

            TextField(controller: help,
                decoration:InputDecoration(labelText: " Help Required for what ") ,enabled:assistent ),
            Text("Prefrred Salary",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),

            // Salary

            Slider(value: salary, onChanged: (value){
              setState(() {
                salary = value ;
              });

            },min: 0,max: 50000,divisions: 5000),
            // Spacer(),

            // clear button


            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      name.clear();
                      password.clear();
                      email.clear();
                    });

                  },
                  child: Text("Clear form data ",textAlign: TextAlign.right ,)
              ),
            ),


            // register button

            ElevatedButton(
              onPressed: (){
                setState(() {
                  tfname = name.text ;
                  tfemail = email.text ;
                  tfpassword = password.text ;
                });
              },
              child:Text("Register"),
              style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(color),
                  foregroundColor:MaterialStateProperty.all(Colors.white)
              ),
            ),

            Text("\n Name :$tfname \n email :$tfemail \n password : $tfpassword \n gender:${gender!=null ? genders.firstWhere((element)=>element['index']==gender)['gender'] : ""} \n salary = ${salary.toString()}" )
          ],
        ),
      ),

      // floating button

      floatingActionButton: FloatingActionButton(
        child: Text("Click"),
        onPressed: (){
          setState(() {
            if(color ==  Colors.blue){
              color = Colors.red ;
            }
            else {
              color = Colors.blue ;
            }

          });
        },
      ),

    );
  }
}
