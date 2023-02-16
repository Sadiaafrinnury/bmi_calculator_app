import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isMale=true;
  Color cardClr=Color(0xff1D1F33);
  int weight=5;
  int age=20;
  int height=180;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff090D1E),
        appBar: AppBar(
          title: Text('BMI Calculator', style: TextStyle(
              fontSize: 27.0, fontWeight: FontWeight.bold,fontFamily:'Raleway')),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 20,
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isMale=true;
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                              color: isMale==true?Colors.teal:cardClr,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.male,size: 80,color: Colors.white,),
                                  Text("Male",style: TextStyle(color: Colors.grey,fontSize: 20),)
                                ],
                              ),
                            ),
                          )),
                      SizedBox(width: 6),
                      Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isMale=false;
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                              color: isMale==false?Colors.teal:cardClr,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.female,size: 80,color: Colors.white,),
                                  Text("Female",style: TextStyle(color: Colors.grey,fontSize: 20),)
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                  ),
              Expanded(
                flex: 22,
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                    color: cardClr,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",style: TextStyle(color: Colors.grey,fontSize: 22),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("$height",style: TextStyle(color: Colors.white,fontSize: 40),),
                            Text("cm",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ],
                        ),
                        SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              ),
                              thumbColor: Colors.pinkAccent,
                              overlayColor: Colors.grey,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.red,
                            ),
                            child: Slider(
                              min: 50,
                                max: 210,
                                value: height.toDouble(),
                                onChanged: (double value){
                              setState(() {
                                height=value.toInt();

                              });
                                }))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                            color: cardClr,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Weight",style: TextStyle(color: Colors.grey,fontSize: 20),),
                                Text("$weight",style: TextStyle(color: Colors.white,fontSize: 45),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                        onPressed: (){
                                          setState(() {
                                            if (weight>0){
                                              weight--;
                                            }

                                          });
                                        },
                                      backgroundColor: Colors.white38,
                                    child: Icon(Icons.remove),isExtended: true,),
                                    SizedBox(width: 6),
                                    FloatingActionButton(
                                      onPressed: (){
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      backgroundColor: Colors.white38,
                                      child: Icon(Icons.add),isExtended: true,)
                                  ],
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: 6),
                      Expanded(
                          flex: 5,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                            color: cardClr,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Age",style: TextStyle(color: Colors.grey,fontSize: 20),),
                                Text("$age",style: TextStyle(color: Colors.white,fontSize: 45),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: (){
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      backgroundColor: Colors.white38,
                                      child: Icon(Icons.remove),isExtended: true,),
                                    SizedBox(width: 6),
                                    FloatingActionButton(
                                      onPressed: (){
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      backgroundColor: Colors.white38,
                                      child: Icon(Icons.add),isExtended: true,)
                                  ],
                                )
                              ],
                            ),
                          )),

                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  var heightSquare=height*height/10000;
                  var result= weight/heightSquare;
                  print("our result is $result");
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title:Text("BMI Result"),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Your BMI is ${result.toStringAsFixed(0)}",style: TextStyle(),),
                          Text(result<=19?"You are underwait please eat more":result<=25?"you are perfact":"you are overweight",
                          style: TextStyle(),),
                        ],
                      ),
                    );
                  });
                  },
                child: Expanded(
                  flex: 10,
                  
                  child: Container(
                    color: Colors.pinkAccent,
                    alignment: Alignment.center,
                    child: Text("Calculate",style: TextStyle(fontSize: 25,color: Colors.white),),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
