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
      title: 'Magic Phase Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
        scaffoldBackgroundColor:const Color.fromARGB(255, 229, 229, 229)
      ),
      home: const MyHomePage(title: 'Magic Phase Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


Widget visibilitySwitch(BuildContext context, bool visibilityCondition, String maintext, String secondtext, bool val, Function onChangedMethod, int num, Icon icon){
  return Visibility(
      maintainSize: false, 
      maintainAnimation: false,
      maintainState: true,
      visible: visibilityCondition, 
      child:  
        Expanded(
          child: mySwitch(context, maintext, secondtext, val, onChangedMethod, num, icon, true))
      
      );
}


Widget mySwitch(BuildContext context, String maintext, String secondtext, bool val, Function onChangedMethod, int num, Icon icon, bool isSub){

  return 
  Padding(
    padding: const EdgeInsets.all(1.0),
    child:
      Container(
        color: Colors.white70,
        child: 

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isSub ? MediaQuery.of(context).size.width-35 : MediaQuery.of(context).size.width-3,
                  child: SwitchListTile(
                    title: Text(maintext, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(secondtext),
                    secondary: SizedBox(
                      width: 40,
                      height: 80,
                      
                      child: icon
                    ),
                    value: val,
                    onChanged: (value) {
                      onChangedMethod(value, num);
                    },
                  ),
                ),
              ],
            ))
      )
    );
}


Widget lifeTotal(int life, Function subtractLife, Function addLife){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () {subtractLife();},
        ),
        Row (
        children: [
          Text(life.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          const Icon(Icons.favorite, color: Colors.redAccent)
        ]
        ),
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {addLife();},
        ),
      ],
    ))
  );
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  
  int life = 20;
  
  changeSwitch(bool newValue, int num){
    setState(() {

      switch(num){
        case 1:
          isChecked1 = newValue;
          if(newValue){
            isChecked2 = true;
            isChecked3 = false;
          }else{
            isChecked2 = false;
            isChecked3 = false;
            isChecked4 = false;
            isChecked5 = false;
            isChecked6 = false;
            isChecked7 = false;
            isChecked8 = false;
            isChecked9 = false;
          }
          break;
        case 2:
          isChecked2 = newValue;
          if(newValue){
            isChecked1 = true;
          }
          break;
        case 3:
          isChecked3 = newValue;
          if(newValue){
            isChecked2 = true;
            isChecked1 = true;
          }
          break;
        case 4:
          isChecked4 = newValue;
          if(newValue){
            isChecked2 = true;
            isChecked3 = true;
            isChecked1 = true;
          }else{
            isChecked5 = false;
            isChecked6 = false;
            isChecked7 = false;
            isChecked8 = false;
            isChecked9 = false;
          }
          break;
        case 5:
          isChecked5 = newValue;
          if(newValue){
            isChecked1= true;
            isChecked2 = true;
            isChecked3 = true;
            isChecked4 = true;
          }else{
            isChecked6 = false;
            isChecked7 = false;
            isChecked8 = false;
            isChecked9 = false;
          }
          break;
        case 6:
          isChecked6 = newValue;
          if(newValue){
            isChecked1= true;
            isChecked2 = true;
            isChecked3 = true;
            isChecked4 = true;
            isChecked5= true;
            }else{
            isChecked7 = false;
            isChecked8 = false;
            isChecked9 = false;
          }
          break;
        case 7: //end phase
        isChecked7 = newValue;
          if(newValue){
            isChecked1 = true;
            isChecked2 = true;
            isChecked3 = true;
            isChecked4 = true;
            isChecked5 = true;
            isChecked6 = true;
            isChecked8 = true;
          }
          break;

        case 8:
          if(newValue){
            
          }
          break;
        case 9:
          if(newValue){
            isChecked1 = false;
            isChecked2 = false;
            isChecked3 = false;
            isChecked4 = false;
            isChecked5 = false;
            isChecked6 = false;
            isChecked7 = false;
            isChecked8 = false;
            isChecked9 = false;
          }
          break;
      }
    });

  }


  subtractLife(){
    setState(() {
      life--;
    });
  }

  addLife(){
    setState(() {
      life++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


        title:  Text(widget.title, style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        )),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mySwitch(context, "Upkeep", "Draw a card", isChecked1, changeSwitch, 1, const Icon(Icons.start), false),
                Visibility(
                  maintainSize: false, 
                  maintainAnimation: false,
                  maintainState: true,
                  visible: isChecked1 && !isChecked3, 
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column( children: [
                            mySwitch(context, "Untap", "Stappa stappa!", isChecked2, changeSwitch, 2, const Icon(Icons.autorenew), true),
                            mySwitch(context, "Draw card", "Credi nel cuore delle carte", isChecked3, changeSwitch, 3, const Icon(Icons.library_books), true),
                    ])
                )),
                //untap; Draw
                mySwitch(context, "Main phase", "Daje strategia", isChecked4, changeSwitch, 4, const Icon(Icons.hourglass_top), false),
                mySwitch(context, "Combat phase", "Lancia magie che spaccano", isChecked5, changeSwitch, 5, const Icon(Icons.flash_on), false),
                mySwitch(context, "Second main phase", "N'altra fase? che si fa qua?", isChecked6, changeSwitch, 6, const Icon(Icons.timeline), false),
                mySwitch(context, "End phase", "Oh finalmente finito", isChecked7, changeSwitch, 7, const Icon(Icons.check_circle), false),
                Visibility(
                  maintainSize: false, 
                  maintainAnimation: false,
                  maintainState: true,
                  visible: isChecked7 && !isChecked9, 
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column( children: [
                            mySwitch(context, "Begin end phase", "L'inizio della fine?", isChecked8, changeSwitch, 8, const Icon(Icons.flag), true),
                            mySwitch(context, "End", "Mo so cazzi", isChecked9, changeSwitch, 9, const Icon(Icons.hourglass_empty), true),
                    ])
                ))],
                //Beginning; End
              ),
            
            lifeTotal(life, subtractLife, addLife)
          ],
        )
    );
  }
}
