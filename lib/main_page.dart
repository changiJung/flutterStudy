import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _loginPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
//    final sizeWidth = size.width;
//    final sizeHeight = size.height;

    return MaterialApp(
        home: Scaffold(
            body: Stack(alignment: Alignment.center,
                //stack 의 맨 아내라 화면에서는 제일 위로
                children: <Widget>[
          Container(
            color: Colors.white10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200'),
                      )
//                  FadeInImage.assetNetwork(placeholder:'images/loading.gif', image: 'https://picsum.photos/200')
                      ),
                ),
              ),

//Container 이용한 이미지 넣기
//              Container(
//                  width: 200,
//                  height: 200,
//                  color: Colors.white,
//                  child:
//                  FadeInImage.assetNetwork(placeholder:'images/loading.gif', image: 'https://picsum.photos/200')
//              ),

              Stack(children: <Widget>[
                Stack(
                  children: <Widget>[
                    _inputForm(size),
                    Positioned(
                      left: size.width * 0.18,
                      right: size.width * 0.18,
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: _button(size, '회원가입', context)),
                          Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: _button(size, '로그인', context))
                        ],
                      ),
                    )
                  ],
                ),
//                Container(
//                  width: 200,
//                  height: 50,
//                  color: Colors.white,
//                ),
              ]),
              Container(
                width: 200,
                height: 50,
                color: Colors.blueGrey,
              )
            ],
          )
        ])));
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 16, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: _loginIdController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle), labelText: "아이디"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "아이디를 입력해주세요";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _loginPwController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key), labelText: "비밀번호"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
              ])),
        ),
      ),
    );
  }

  Widget _button(Size size, String text, BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: () {

        if(text =='회원가입') {

        } else {
          print(_loginIdController.text.toString());
          if (_formKey.currentState.validate()) {
            if (_loginIdController.text.toString() != 'test1') {
              showAlertDialog(context, '존재하지 않는 아이디 입니다', "오류" , "확인");
              return false;
            }
            if (_loginPwController.text.toString() != 'test2') {
              showAlertDialog(context, '비밀번호가 일치하지 않습니다', "오류" , "확인");
              return false;
            }
          }
          showAlertDialog(context, '로그인 성공', "성공" , "확인");
        }

      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.bold),
      ),
      color: Colors.amber,
    );
  }

  showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle) {
    // set up the buttons
//    Widget cancelButton = FlatButton(
//      child: Text(buttonCancelTitle),
//      onPressed: () {},
//    );
    Widget continueButton = FlatButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
