import 'package:flutter/cupertino.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _controller = TextEditingController();
  String _result = '0';
  String _operator = '';
  double _firstNumber = 0;

  void _onNumberPressed(String number) {
    setState(() {
      _controller.text += number;
    });
  }

  void _onOperatorPressed(String operator) {
    if (_controller.text.isNotEmpty) {
      _firstNumber = double.parse(_controller.text);
      _operator = operator;
      _controller.clear();
    }
  }

  void _calculate() {
    if (_controller.text.isNotEmpty) {
      double secondNumber = double.parse(_controller.text);
      double calculationResult;

      switch (_operator) {
        case '+':
          calculationResult = _firstNumber + secondNumber;
          break;
        case '-':
          calculationResult = _firstNumber - secondNumber;
          break;
        case '*':
          calculationResult = _firstNumber * secondNumber;
          break;
        case '/':
          calculationResult = _firstNumber / secondNumber;
          break;
        default:
          return;
      }

      setState(() {
        _result = calculationResult.toString();
        _controller.clear();
        _operator = '';
      });
    }
  }

  void _clear() {
    setState(() {
      _controller.clear();
      _result = '0';
      _operator = '';
      _firstNumber = 0;
    });
  }



