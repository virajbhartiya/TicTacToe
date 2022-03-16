import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool turn = false;

  int oScore = 0;
  int xScore = 0;
  int dScore = 0;

  int c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Player X',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(xScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Draw',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          )),
                      Text(dScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Player O',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          )),
                      Text(oScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(
      () {
        if (displayXO[index] == '') {
          if (turn) {
            displayXO[index] = 'O';
            c += 1;
          } else {
            displayXO[index] = 'X';
            c += 1;
          }
        }
        turn = !turn;
        _checkWinner(index);
      },
    );
  }

  void _checkWinner(int index) {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(
        () {
          c = 0;
        },
      );
      _showDialog(displayXO[index].toString());
    } else if (c == 9) {
      _drawAlert();
      //print(c);
      setState(
        () {
          c = 0;
          dScore += 1;
        },
      );
    }
  }

  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text("Winner: " + winner), actions: <Widget>[
          FlatButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'))
        ]);
      },
    );
    setState(() {
      if (winner == 'O')
        oScore += 1;
      else if (winner == 'X')
        xScore += 1;
      else
        dScore += 1;
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
  }

  void _drawAlert() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Draw'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'))
          ],
        );
      },
    );
  }
}
