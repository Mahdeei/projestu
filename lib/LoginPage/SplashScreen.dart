import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/mahde/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final skaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    checkinternet();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: skaffoldKey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              containerSplash(),
              textSplashScreen()
            ],
          )
        ],
      ),
    );
  }

  checkinternet() async {
    if (await netConnet()) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      print('not connected internet');
      skaffoldKey.currentState.showSnackBar(new SnackBar(
          duration: Duration(hours: 2),
          content: new GestureDetector(
            onTap: () {
              checkinternet();
              skaffoldKey.currentState
                  .hideCurrentSnackBar();
                  // reason: SnackBarClosedReason.hide
            },
            child: row()
          )));
    }
  }

  Row row(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text('اینترنت وصل نیست'),
        new Icon(Icons.wifi_lock,color: Colors.white,)],
    );
  }

  Future<bool> netConnet() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
