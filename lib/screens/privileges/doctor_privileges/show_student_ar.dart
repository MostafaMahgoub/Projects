import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class showstudentar extends StatefulWidget{
  static String routeName = "/showstudentar";
  _showstudentar createState()=> _showstudentar();
}

class _showstudentar extends State<showstudentar>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Academic Record",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color : Colors.white70,
          ),
        ),
      ),
      body :
          ListView(
              children : <Widget>[Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(20)),
              Container(
              alignment: Alignment.center,
              child : Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(

                  padding :EdgeInsets.symmetric(horizontal: 150),
                 child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      // ignore: deprecated_member_use
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [

                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/ASLOGO.png"),
                        ),
                        Positioned(
                          right: -16,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,

                          ),
                        )
                      ],
                    ),
                  ),
    ),



              ],
            ),
    ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Student Name : Mostafa Reda Mahmoud', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Program : Computer Science', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Academic ID : 9843769346', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),


              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Level : Fourth', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),
              Text("-------------------------------------------------",textAlign: TextAlign.center,),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text("Fall 2017/2018",textAlign: TextAlign.center,
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              DataTable(
                columns: [
                  DataColumn(label:Container(width: 60,
                    child: Text('Course'),
                  ),
                  ),
                  DataColumn(label:Container(width: 50,
                    child: Text('Degree'),
                  ),),
                  DataColumn(label:Container(width: 30,
                    child: Text('C.H'),
                  ),),
                  DataColumn(label:Container(width: 30,
                    child: Text('G.L.'),
                  ),),
                ],
                rows: [
                  DataRow(cells:[ DataCell(Text('COMP401')),
                    DataCell(Text('0')),
                    DataCell(Text('4')),
                    DataCell(Text('F')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP402')),
                    DataCell(Text('20')),
                    DataCell(Text('3')),
                    DataCell(Text('D')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP403')),
                    DataCell(Text('8')),
                    DataCell(Text('3')),
                    DataCell(Text('A-')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP404')),
                    DataCell(Text('28')),
                    DataCell(Text('3')),
                    DataCell(Text('A')),


                  ]),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('S.GPA: 1.9555 (Fail) (F) , C.GPA:1.75466 (Fail) (F)', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),

              Text("-------------------------------------------------",textAlign: TextAlign.center,),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text("Spring 2017/2018",textAlign: TextAlign.center,
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              DataTable(
                columns: [
                  DataColumn(label:Container(width: 60,
                    child: Text('Course'),
                  ),
                  ),
                  DataColumn(label:Container(width: 50,
                    child: Text('Degree'),
                  ),),
                  DataColumn(label:Container(width: 30,
                    child: Text('C.H'),
                  ),),
                  DataColumn(label:Container(width: 30,
                    child: Text('G.L.'),
                  ),),
                ],
                rows: [
                  DataRow(cells:[ DataCell(Text('COMP401')),
                    DataCell(Text('0')),
                    DataCell(Text('4')),
                    DataCell(Text('F')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP402')),
                    DataCell(Text('20')),
                    DataCell(Text('3')),
                    DataCell(Text('D')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP403')),
                    DataCell(Text('8')),
                    DataCell(Text('3')),
                    DataCell(Text('A-')),


                  ]),
                  DataRow(cells:[ DataCell(Text('COMP404')),
                    DataCell(Text('28')),
                    DataCell(Text('3')),
                    DataCell(Text('A')),


                  ]),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('S.GPA: 1.9555 (Fail) (F) , C.GPA:1.75466 (Fail) (F)', textAlign: TextAlign.center,
                      style : TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),


                ],
              ),

             ]
        )
]
    ),
    );
  }
}