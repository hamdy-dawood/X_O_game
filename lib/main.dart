import 'package:flutter/material.dart';
void main(){
  runApp(XandOgame());
}class XandOgame extends StatefulWidget {
  @override
  _XandOgameState createState() => _XandOgameState();
}

class _XandOgameState extends State<XandOgame> {
  List <String> XorO = ['', '', '', '', '', '', '', '', ''];
  bool turn = true;
  String winner;
  int Xscore = 0;
  int Oscore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

          backgroundColor: Colors.black,

          body: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50,),
                      Text('Player X',
                        style: TextStyle(color: Colors.orange, fontSize: 25),),
                      SizedBox(height: 10,),
                      Text(Xscore.toString(),
                        style: TextStyle(color: Colors.orange, fontSize: 25),)
                    ],
                  ),
                  Column(

                    children: [
                      SizedBox(height: 60,),
                      Text('Player O',
                        style: TextStyle(color: Colors.orange, fontSize: 25),),
                      SizedBox(height: 10,),
                      Text(Oscore.toString(),
                        style: TextStyle(color: Colors.orange, fontSize: 25),)

                    ],
                  )
                ],
              ),
              Expanded(
                flex: 2,
                child: GridView.builder(itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            if (turn && XorO[index] == '') {
                              setState(() {
                                XorO[index] = 'X';
                                turn = !turn;
                              });
                            }
                            else if (!turn && XorO[index] == '') {
                              setState(() {
                                XorO[index] = 'O';
                                turn = !turn;
                              });
                            }
                            checkwinner();
                            score();

                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)
                              ),
                              child: Center(
                                child: Text(XorO[index].toString(),
                                  style: TextStyle(color: Colors.orange[300],
                                      fontSize: 50),),)
                          )
                      );
                    }
                ),
              ),


              Expanded(
                child: Column(
                    children: [
                      GestureDetector(
                        onTap: Playagain,
                          child:
                          Container(
                              width: 250,
                              height: 40,
                              child: Center(child: Text('Play Again',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),)),
                              decoration: BoxDecoration(

                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)
                              )
                            )
                          ),



                      SizedBox(height: 15,),
                      GestureDetector(onTap: Endgame,
                          child: Container(
                            width: 250,
                            height: 40,
                            child: Center(child: Text('End game',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),)),
                            decoration: BoxDecoration(

                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)
                            )

                        ),
                      )
                    ]),
              )
            ],
          )

      ),
    );
  }

  void checkwinner() {
    if (XorO[0] == XorO[1] && XorO[0] == XorO[2] && XorO[0] != '') {
      winner = XorO[0];
      print(winner);
    }
    if (XorO[3] == XorO[4] && XorO[3] == XorO[5] && XorO[3] != '') {
      winner = XorO[3];
      print(winner);
    }
    if (XorO[6] == XorO[7] && XorO[6] == XorO[8] && XorO[6] != '') {
      winner = XorO[6];
      print(winner);
    }
    if (XorO[0] == XorO[3] && XorO[0] == XorO[6] && XorO[0] != '') {
      winner = XorO[0];
      print(winner);
    }
    if (XorO[1] == XorO[4] && XorO[1] == XorO[7] && XorO[1] != '') {
      winner = XorO[1];
      print(winner);
    }
    if (XorO[2] == XorO[5] && XorO[2] == XorO[8] && XorO[2] != '') {
      winner = XorO[2];
      print(winner);
    }
    if (XorO[0] == XorO[4] && XorO[0] == XorO[8] && XorO[0] != '') {
      winner = XorO[0];
      print(winner);
    }
    if (XorO[2] == XorO[4] && XorO[2] == XorO[6] && XorO[2] != '') {
      winner = XorO[2];
      print(winner);
    }
    else {
      print('Draw');
    }
  }

  void score() {

      if (winner == 'X') {
        setState(() {
          Xscore++;

        });
      }
      else if (winner =='O') {
        setState(() {
          Oscore++;


        });

    }
  }
  void Playagain (){
    for(int i=0 ; i<9 ; i++){
      setState(() {
        winner=='';
        XorO[i]='';

      });
    }
  }
  void Endgame(){
    for(int i=0 ; i<9 ; i++){
      setState(() {
        winner=='';
        XorO[i]='';
        Xscore = 0;
        Oscore = 0;
      });
    }
  }
}
