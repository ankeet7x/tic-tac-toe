import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/logic_controller.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final LogicController controller = Get.put(LogicController());

  Widget buildPlayAgainButton() {
    return ElevatedButton(
        onPressed: () {
          controller.createMatrix(3, 3);
          controller.drawValue = false;
          controller.changeValue = false;
        },
        child: Text("Play Again"));
  }

  Widget showWinnerDetailsButton() {
    return Text(
      controller.draw ? "Draw" : "${controller.winner} is the winner",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.75,
            ),
            controller.gameOver
                ? showWinnerDetailsButton()
                : Text(
                    controller.count % 2 == 0
                        ? "Player O's turn"
                        : "Player X's turn",
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
            controller.gameOver ? buildPlayAgainButton() : Container(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  checkGameStatus() {
    if (controller.matrix[0][1] == controller.matrix[0][0] &&
        controller.matrix[0][0] == controller.matrix[0][2] &&
        controller.matrix[0][0] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[1][1] == controller.matrix[1][0] &&
        controller.matrix[1][0] == controller.matrix[1][2] &&
        controller.matrix[1][0] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[2][1] == controller.matrix[2][0] &&
        controller.matrix[2][0] == controller.matrix[2][2] &&
        controller.matrix[2][0] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[1][0] == controller.matrix[0][0] &&
        controller.matrix[0][0] == controller.matrix[2][0] &&
        controller.matrix[0][0] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[0][1] == controller.matrix[1][1] &&
        controller.matrix[1][1] == controller.matrix[2][1] &&
        controller.matrix[1][1] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[0][2] == controller.matrix[1][2] &&
        controller.matrix[0][2] == controller.matrix[2][2] &&
        controller.matrix[0][2] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[0][0] == controller.matrix[1][1] &&
        controller.matrix[1][1] == controller.matrix[2][2] &&
        controller.matrix[1][1] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[2][0] == controller.matrix[1][1] &&
        controller.matrix[1][1] == controller.matrix[0][2] &&
        controller.matrix[1][1] != "") {
      controller.count % 2 == 0
          ? controller.winnerValue = "X"
          : controller.winnerValue = "O";
      controller.changeValue = true;
    } else if (controller.matrix[0][0] != "" &&
        controller.matrix[0][1] != "" &&
        controller.matrix[0][2] != "" &&
        controller.matrix[1][0] != "" &&
        controller.matrix[1][1] != "" &&
        controller.matrix[1][2] != "" &&
        controller.matrix[2][0] != "" &&
        controller.matrix[2][1] != "" &&
        controller.matrix[2][2] != "") {
      controller.drawValue = true;
      controller.changeValue = true;
    }
  }

  Widget buildBox(i, j) {
    return GestureDetector(
        onTap: () {
          controller.increaseCount();
          if (controller.count % 2 == 0 && controller.matrix[i][j] == '') {
            controller.gameOver
                ? showGameOverMessage()
                : controller.matrix[i][j] = 'X';
          } else if (controller.count % 2 != 0 &&
              controller.matrix[i][j] == '') {
            controller.gameOver
                ? showGameOverMessage()
                : controller.matrix[i][j] = 'O';
          }
          if (!controller.gameOver) {
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
              controller.matrix[i][j].toString(),
              style: TextStyle(color: Colors.black, fontSize: 55),
            ),
          ),
        ));
  }

  showGameOverMessage() {
    Get.snackbar("Game's already over", "Tap play again to play",
        backgroundColor: Colors.yellow, colorText: Colors.black);
  }
}
