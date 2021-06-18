import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/logic_controller.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final LogicController controller = Get.put(LogicController());

  late List<List> matrix;
  int count = 0;
  late String winner = "X";
  bool draw = false;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    createMatrix(3, 3);
  }

  createMatrix(rows, columns) {
    setState(() {
      matrix = List.generate(
          rows, (_) => List.generate(3, (_) => "", growable: false),
          growable: false);
    });
  }

  Widget buildPlayAgainButton() {
    return ElevatedButton(
        onPressed: () {
          createMatrix(3, 3);
          draw = false;
          _gameOver = false;
        },
        child: Text("Play Again"));
  }

  Widget showWinnerDetailsButton() {
    return Text(
      draw ? "Draw" : "$winner is the winner",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.75,
          ),
          _gameOver
              ? showWinnerDetailsButton()
              : Text(
                  count % 2 == 0 ? "Player O's turn" : "Player X's turn",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildBox(0, 0), buildBox(0, 1), buildBox(0, 2)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildBox(1, 0), buildBox(1, 1), buildBox(1, 2)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildBox(2, 0), buildBox(2, 1), buildBox(2, 2)],
          ),
          Spacer(),
          _gameOver ? buildPlayAgainButton() : Container(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  checkGameStatus() {
    if (matrix[0][1] == matrix[0][0] &&
        matrix[0][0] == matrix[0][2] &&
        matrix[0][0] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[1][1] == matrix[1][0] &&
        matrix[1][0] == matrix[1][2] &&
        matrix[1][0] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[2][1] == matrix[2][0] &&
        matrix[2][0] == matrix[2][2] &&
        matrix[2][0] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[1][0] == matrix[0][0] &&
        matrix[0][0] == matrix[2][0] &&
        matrix[0][0] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[0][1] == matrix[1][1] &&
        matrix[1][1] == matrix[2][1] &&
        matrix[1][1] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[0][2] == matrix[1][2] &&
        matrix[0][2] == matrix[2][2] &&
        matrix[0][2] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[0][0] == matrix[1][1] &&
        matrix[1][1] == matrix[2][2] &&
        matrix[1][1] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[2][0] == matrix[1][1] &&
        matrix[1][1] == matrix[0][2] &&
        matrix[1][1] != "") {
      setState(() {
        count % 2 == 0 ? winner = "X" : winner = "O";
        _gameOver = true;
      });
    } else if (matrix[0][0] != "" &&
        matrix[0][1] != "" &&
        matrix[0][2] != "" &&
        matrix[1][0] != "" &&
        matrix[1][1] != "" &&
        matrix[1][2] != "" &&
        matrix[2][0] != "" &&
        matrix[2][1] != "" &&
        matrix[2][2] != "") {
      setState(() {
        draw = true;
        _gameOver = true;
      });
    }
  }

  Widget buildBox(i, j) {
    return GestureDetector(
        onTap: () {
          count++;
          if (count % 2 == 0 && matrix[i][j] == '') {
            _gameOver
                ? sendToastMessage()
                : setState(() {
                    matrix[i][j] = 'X';
                  });
          } else if (count % 2 != 0 && matrix[i][j] == '') {
            _gameOver
                ? sendToastMessage()
                : setState(() {
                    matrix[i][j] = 'O';
                  });
          }
          if (!_gameOver) {
            checkGameStatus();
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.30,
          width: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
              border: Border(
                  bottom: i == 0
                      ? BorderSide(width: 15, color: Colors.yellow)
                      : BorderSide.none,
                  top: i == 2
                      ? BorderSide(width: 15, color: Colors.yellow)
                      : BorderSide.none,
                  right: j == 0
                      ? BorderSide(width: 15, color: Colors.yellow)
                      : BorderSide.none,
                  left: j == 2
                      ? BorderSide(width: 15, color: Colors.yellow)
                      : BorderSide.none)),
          child: Center(
            child: Text(
              matrix[i][j].toString(),
              style: TextStyle(color: Colors.black, fontSize: 55),
            ),
          ),
        ));
  }

  sendToastMessage() {
    return Fluttertoast.showToast(msg: "Game's already over");
  }
}
