import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI CALCULATOR",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  var weightController = TextEditingController(); // TextField associated with Weight
  var feetController = TextEditingController();  // TextField associated with Feet
  var inchController = TextEditingController();  // TextField associated with Inches

  double? bmi;
  // the message at the beginning
  var result = " ";
// This function is triggered when the user pressess the "Calculate" button
  void Calculate(){
    var weight = weightController.text.toString();
    var feet = feetController.text.toString();
    var inches = inchController.text.toString();


    if( weight!= "" &&  feet!= "" && inches!= ""){
      //BMI Calculator
      var myweight = int.parse(weight);
      var myfeet = int.parse(feet);
      var myinch = int.parse(inches);

      var resultInInch = (myfeet * 12) + myinch;
      var resultInCM = resultInInch * 2.54;
      var totalMeasure = resultInCM/100;
      var bmi = myweight/(totalMeasure * totalMeasure);

      setState(() {

        if (bmi! < 18.5) {
          result = "You are underweight";
        } else if (bmi! < 25) {
          result = 'Your body is fine';
        } else if (bmi! < 30) {
          result = 'You are overweight';
        } else {
          result = 'You are obese';
        }
      });

      setState( (){
        result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
      });
    }else{
      setState( (){
        result = "Please fill all requirement in blanks!";
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text("BMI CALCULATOR"),
      centerTitle: true,
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w400
                ),),

                SizedBox(height: 35),

                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Weight(in feet)"),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12),

                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height(in feet)"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12),

                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height(in inches)"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15,),

                ElevatedButton(
                  onPressed:() {
                    Calculate();

                  }, child: Text("Calculate"),
                ),

                SizedBox(height: 20,),

                Text( result, style: TextStyle( fontSize: 20), ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}