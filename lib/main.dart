import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  String result = "";
  var bgColor =Colors.cyanAccent;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("yourBMI"),
      ),
      body: Container(
        //color:  bgColor,
        decoration: BoxDecoration(
          //gradient: LinearGradient(colors: [
          gradient: RadialGradient(colors: [
            Color(0xffffecd2),
            //Color(0xfffcb69f),
            // Colors.deepOrange.shade200,
             Colors.purple.shade200,
            // Colors.cyanAccent.shade200
          ],
         // begin: FractionalOffset(1.0,0.5),
          //end: FractionalOffset(0.0, 0.5),
              center: Alignment.bottomCenter,
            stops: [0.0,1.0]
          )
        ),
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Body Mass Index (BMI)",style: TextStyle(
                  fontSize: 32,fontWeight: FontWeight.w700,
                ),
                       ),
                SizedBox(height: 40,),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Weight in kg'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height in in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),
                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height in inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if(ft!="" && inch!="" && wt!=""){


                    // BMI calculation

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25){

                      msg = "You are OverWeight!!";
                      bgColor = Colors.yellowAccent;
                    }else if(bmi<18){
                      msg = "You're UnderWeight ";
                      bgColor = Colors.redAccent;
                    }else{
                      msg = "You're Healthy!!";
                      bgColor= Colors.greenAccent;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                    });

                  }else{
                    setState(() {
                      Container(
                        width: 300,
                          height: 200,
                          child: Text(result = "Please fill all the required field!!",));
                    });

                  }

                }, child: Text('Calculate'),
                ),

                SizedBox(height: 150,),
                Text(result, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)

              ],

            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
