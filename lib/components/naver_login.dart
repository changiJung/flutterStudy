import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:com.sing_in_map/main.dart';

import 'package:flutter_naver_login/flutter_naver_login.dart';

/**
 * 노드 서버 기반 naver Login
 * 웹뷰로 로그인 화면 만들어서 로그인 해야함
 */
// class NaverLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2,
//       child: RaisedButton(
//         color: Colors.greenAccent[700],
//         textColor: Colors.white,
//         child: Text("Naver Login"),
//         onPressed: () async {
//           String naver_url = "http://124.49.227.243:8188/naverlogin";
//           String _nToken = await Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => WebviewScaffold(
//                     url: naver_url,
//                     javascriptChannels: Set.from([
//                       JavascriptChannel(
//                           name: "test",
//                           onMessageReceived: (JavascriptMessage result) async {
//                             if (result.message != null)
//                               return Navigator.of(context).pop(result.message);
//                             return Navigator.of(context).pop();
//                           }),
//                     ]),
//                   )));
//           if (_nToken != null)
//             return Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(
//                     builder: (BuildContext context) => MainPage()),
//                 (route) => false);
//         },
//       ),
//     );
//   }
// }

class NaverLogin extends StatefulWidget {
  NaverLogin({Key key}) : super(key: key);
  @override
  _NaverLogin createState() => new _NaverLogin();
}

class _NaverLogin extends State<NaverLogin> {
  bool isLogin = false;

  String accesToken;

  String expiresAt;

  String tokenType;

  String name;

  String refreshToken;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Flutter Naver Login Sample',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text('isLogin: $isLogin\n'),
                new Text('accesToken: $accesToken\n'),
                new Text('tokenType: $tokenType\n'),
                new Text('user: $name\n'),
              ],
            ),
            new FlatButton(
                key: null,
                onPressed: buttonLoginPressed,
                child: new Text(
                  "LogIn",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto"),
                )),
            new FlatButton(
                key: null,
                onPressed: buttonLogoutPressed,
                child: new Text(
                  "LogOut",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto"),
                )),
            new FlatButton(
                key: null,
                onPressed: buttonTokenPressed,
                child: new Text(
                  "GetToken",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto"),
                )),
            new FlatButton(
                key: null,
                onPressed: buttonGetUserPressed,
                child: new Text(
                  "GetUser",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto"),
                ))
          ]),
    );
  }

  // 로그인시 닉네임 가져오고 로그인 여부 true
  Future<void> buttonLoginPressed() async {
    NaverLoginResult res = await FlutterNaverLogin.logIn();
    print(res);
    setState(() {
      name = res.account.nickname;
      isLogin = true;
    });
  }

  // 네이버 로그인 toKen 값 가져오기
  Future<void> buttonTokenPressed() async {
    NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;
    setState(() {
      accesToken = res.accessToken;
      tokenType = res.tokenType;
    });
  }

  // 로그아웃 사용자 정보 삭제
  Future<void> buttonLogoutPressed() async {
    FlutterNaverLogin.logOut();
    setState(() {
      isLogin = false;
      accesToken = null;
      tokenType = null;
      name = null;
    });
  }

  // 사용자 정보 가져오기
  Future<void> buttonGetUserPressed() async {
    NaverAccountResult res = await FlutterNaverLogin.currentAccount();
    setState(() {
      name = res.name;
    });
  }
}
