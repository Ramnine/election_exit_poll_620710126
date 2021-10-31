import 'package:election_exit_poll_620710126/model/modelf.dart';
import 'package:election_exit_poll_620710126/model/resultmodel.dart';
import 'package:election_exit_poll_620710126/services/api.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<reExitpoll>? _Data;

  @override
  Widget build(BuildContext context) {
    return _Data == null
        ? Container(
            child: Text('กรุณารอสักครู่ กำลังโหลดข้อมูล'),
          )
        : Scaffold(
            body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "RESULT",
                    style: TextStyle(fontSize: 30),
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(_Data![0].id.toString()+"  ",
                                    style: TextStyle(fontSize: 25)),
                                Text(_Data![0].title,
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![0].firstname+" ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![0].lastname+"         ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![0].socre.toString(),
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(_Data![1].id.toString()+"  ",
                                    style: TextStyle(fontSize: 25)),
                                Text(_Data![1].title,
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![1].firstname+" ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![1].lastname+"         ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![1].socre.toString(),
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(_Data![2].id.toString()+"  ",
                                    style: TextStyle(fontSize: 25)),
                                Text(_Data![2].title,
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![2].firstname+" ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![2].lastname+"         ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![2].socre.toString(),
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(_Data![3].id.toString()+"  ",
                                    style: TextStyle(fontSize: 25)),
                                Text(_Data![3].title,
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![3].firstname+" ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![3].lastname+"         ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![3].socre.toString(),
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(_Data![4].id.toString()+"  ",
                                    style: TextStyle(fontSize: 25)),
                                Text(_Data![4].title,
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![4].firstname+" ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![4].lastname+"         ",
                                    style: TextStyle(fontSize: 20)),
                                Text(_Data![4].socre.toString(),
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ));
  }

  Future<List<reExitpoll>> GET() async {
    List list = await Api().fetch("exit_poll/result");
    var Data = list.map((item) => reExitpoll.fromJson(item)).toList();

    return Data;
  }

  @override
  void initState() {
    super.initState();
    GET().then((list) {
      _Data = list;
    });
  }
}
