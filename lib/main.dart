import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  String error = '';
  String loanAmount = "";
  String interest = "";
  String timePeriod = "";
  String final11 = "";
  String final22 = "";
  String final33 = "";


  void getPayment() async {

    double rate = double.parse(interest)/12/100;
    double time = double.parse(timePeriod) * 12;
    double powResult = pow(1+rate,time);

    double monthlyPayment = double.parse(loanAmount)*rate*((powResult)/(powResult-1));
    double totalAmount = (monthlyPayment*120);
    double interestPaid = totalAmount - double.parse(loanAmount);

    String final1 = monthlyPayment.toStringAsFixed(2);
    String final2 = totalAmount.toStringAsFixed(2);
    String final3 = totalAmount.toStringAsFixed(2);

    setState(() { final11 = final1.toString();
        final22 = final2.toString();
        final33 = final3.toString(); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children: <Widget>[
            SizedBox(
              height:10.0,
            ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),

          child:  Container(
              height:100,
              width: double.infinity,
              color:Colors.grey[200],
               child:Center(
                 child: Text("Loan Calculator",
                style: TextStyle(fontSize: 40.0, color: Colors.black,fontWeight: FontWeight.w700),
               ),),
            ),
             ),
             SizedBox(
               height: 20.0
             ),
             Container(
               child: Form(
               key: _formKey,
              child: Column(
               children:<Widget>[
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Loan Amount(In Rs.)",
             ),
             
                 validator: (val) => val.isEmpty ? 'Enter the value of Loan Amount' : null,
                  onChanged: (val) {
                  setState(() => loanAmount = (val));
                },
              ),
              ),
               SizedBox(
               height: 20.0
             ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child:
             TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Interest Rate(In %)",
             ),
              validator: (val) => val.isEmpty ? 'Enter the value of interest in %' : null,
               onChanged: (val) {
                  setState(() => interest = val);
                },
              ),
              ),
               SizedBox(
               height: 20.0
             ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child:
              TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Time Period(In Years)",
             ),
              validator: (val) => val.isEmpty ? 'Enter the tenure' : null,
               onChanged: (val) {
                  setState(() => timePeriod = val);
                },
              ),
              ),
               SizedBox(
               height: 20.0,
             ),
               RaisedButton(
               color: Colors.blue,
              child: Text("Calculate", style: TextStyle(color: Colors.white)),
              onPressed: (){
                 if (_formKey.currentState.validate()) {
                getPayment();
                 }
                },
            ),
               ],
             ),
              ),
             ),
             SizedBox(
              height:10.0,
            ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
             child: Container(
              height:80,
              width: double.infinity,
              color:Colors.grey[200],
               child:Center(
                 child: Text("Result",
                style: TextStyle(fontSize: 40.0, color: Colors.black,fontWeight: FontWeight.w700),
               ),),
            ),
             ),
             
            SizedBox(
              height:10.0,
            ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height:50,
              width: double.infinity,
              color:Colors.grey[400],
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                  child:Text(
                  'Monthly Payment(in Rs)',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),),
                Center(
                child:Text(
                    final11,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),),
                ],
               ),
            ),

             ),
            SizedBox(
              height:10.0,
            ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:Container(
              height:50,
              width: double.infinity,
              color:Colors.grey[400],
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Center(
                  child:Text(
                  'Total Payment(in Rs)',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),),
                  Divider(),
                Center(
                child:Text(
                  final22,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),),
                ],
               ),
            ),
             ),
            SizedBox(
              height:10.0,
            ),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:Container(
              height:50,
              width: double.infinity,
              color:Colors.grey[400],
                child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                  child:Text(
                'Interest Added(in Rs)',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),),
                Center(
                child:Text(
                  final33,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),),
                ],
               ),
            ),
             ),
          ]
        ),
      ),
    );
  }
}

