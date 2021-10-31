import 'package:election_exit_poll_620710126/model/modelf.dart';
import 'package:election_exit_poll_620710126/pages/result.dart';
import 'package:election_exit_poll_620710126/services/api.dart';
import 'package:flutter/material.dart';

class ExitPoll extends StatefulWidget {
  const ExitPoll({Key? key}) : super(key: key);

  @override
  _ExitPollState createState() => _ExitPollState();
}

class _ExitPollState extends State<ExitPoll> {
  List<Exitpoll>? _Data;
  var socre ;
  @override

  Widget build(BuildContext context) {
    void _showsum() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('SUCCESS'),
            content: Text('บันทึกข้อมูลสำเร็จ $socre'),
            actions: [
              // ปุ่ม OK ใน dialog
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  // ปิด dialog
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return _Data == null ? Container(
      child: Text('กรุณารอสักครู่ กำลังโหลดข้อมูล'),
    ) : Scaffold(
            body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/vote_hand.png',
                    width: 240.0,
                  ),
                  Text(
                    "เลือกตั้ง อบต.",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text("รายชื่อผู้สมัครรับเลือกตั้ง",
                      style: TextStyle(fontSize: 20)),
                  Text("นายกองค์การบริหารส่วนตำบลเขาพระ",
                      style: TextStyle(fontSize: 20)),
                  Text("อำเภอเมืองนครนายก จังหวัดนครนายก",
                      style: TextStyle(fontSize: 20)),
                 Column(
                   children: [
                     Column(
                       children: [
                         TextButton(onPressed: (){
                           _showsum();
                         },
                             child: Row(
                               children: [
                                 Text(_Data![0].id.toString()+"  ",style: TextStyle(fontSize: 25)),
                                 Text(_Data![0].title,style: TextStyle(fontSize: 20)),
                                 Text(_Data![0].firstname+" ",style: TextStyle(fontSize: 20)),
                                 Text(_Data![0].lastname,style: TextStyle(fontSize: 20)),
                               ],
                             )
                         ),
                         TextButton(onPressed: (){
                           _showsum();
                         },
                             child: Row(
                               children: [
                                 Text(_Data![1].id.toString()+"  ",style: TextStyle(fontSize: 25)),
                                 Text(_Data![1].title,style: TextStyle(fontSize: 20)),
                                 Text(_Data![1].firstname+" ",style: TextStyle(fontSize: 20)),
                                 Text(_Data![1].lastname,style: TextStyle(fontSize: 20)),
                               ],
                             )
                         ),TextButton(onPressed: (){
                           _showsum();
                         },
                             child: Row(
                               children: [
                                 Text(_Data![2].id.toString()+"  ",style: TextStyle(fontSize: 25)),
                                 Text(_Data![2].title,style: TextStyle(fontSize: 20)),
                                 Text(_Data![2].firstname+" ",style: TextStyle(fontSize: 20)),
                                 Text(_Data![2].lastname,style: TextStyle(fontSize: 20)),
                               ],
                             )
                         ),TextButton(onPressed: (){
                           _showsum();
                         },
                             child: Row(
                               children: [
                                 Text(_Data![3].id.toString()+"  ",style: TextStyle(fontSize: 25)),
                                 Text(_Data![3].title,style: TextStyle(fontSize: 20)),
                                 Text(_Data![3].firstname+" ",style: TextStyle(fontSize: 20)),
                                 Text(_Data![3].lastname,style: TextStyle(fontSize: 20)),
                               ],
                             )
                         ),TextButton(onPressed: (){
                           _showsum();
                         },
                             child: Row(
                               children: [
                                 Text(_Data![4].id.toString()+"  ",style: TextStyle(fontSize: 25)),
                                 Text(_Data![4].title,style: TextStyle(fontSize: 20)),
                                 Text(_Data![4].firstname+" ",style: TextStyle(fontSize: 20)),
                                 Text(_Data![4].lastname,style: TextStyle(fontSize: 20)),
                               ],
                             )
                         ),
                       ],
                     )
                   ],
                 ),
                  Container(
                      height: 40.0,
                      width: 100.0,
                      //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                  child :TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result()),
                    );

                  }, child: Expanded(

                    child: Text("ดูผล",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            backgroundColor: Colors.teal,
                            )),
                  ))
                  )
                ],
              ),
            ),
          ));
  }

  Future<List<Exitpoll>> GET() async {
    List list = await Api().fetch("exit_poll");
    var Data = list.map((item) => Exitpoll.fromJson(item)).toList();
    return Data;
  }

  Future<void> POST() async {
    socre = await Api().submit("exit_poll",{'pin': 620710126});

      }

  @override
  void initState() {
    super.initState();
    GET().then((list) {
      _Data = list;
    });
    POST();
  }
}
