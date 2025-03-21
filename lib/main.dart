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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Calculator'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                controller: _controller,
                readOnly: true,
                placeholder: 'Enter a number',
              ),
              SizedBox(height: 20),
              CupertinoTextField(
                controller: TextEditingController(text: _result),
                readOnly: true,
                placeholder: 'Result',
              ),
              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('1'),
                    onPressed: () => _onNumberPressed('1'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('2'),
                    onPressed: () => _onNumberPressed('2'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('3'),
                    onPressed: () => _onNumberPressed('3'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('+'),
                    onPressed: () => _onOperatorPressed('+'),
                  ),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('4'),
                    onPressed: () => _onNumberPressed('4'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('5'),
                    onPressed: () => _onNumberPressed('5'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('6'),
                    onPressed: () => _onNumberPressed('6'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('-'),
                    onPressed: () => _onOperatorPressed('-'),
                  ),
                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('7'),
                    onPressed: () => _onNumberPressed('7'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('8'),
                    onPressed: () => _onNumberPressed('8'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('9'),
                    onPressed: () => _onNumberPressed('9'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('*'),
                    onPressed: () => _onOperatorPressed('*'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('0'),
                    onPressed: () => _onNumberPressed('0'),
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemRed,
                    child: Text('C'),
                    onPressed: _clear,
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('='),
                    onPressed: _calculate,
                  ),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    child: Text('/'),
                    onPressed: () => _onOperatorPressed('/'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



