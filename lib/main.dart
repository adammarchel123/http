import 'package:flutter/material.dart';
import 'package:http_tiga/person.dart';
import 'package:http_tiga/repository.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> listPerson = [];
  Repository repository = Repository();

  getData() async {
    listPerson = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Req'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listPerson[index].name),
              subtitle: Text(listPerson[index].message),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(listPerson[index].image),
                        fit: BoxFit.cover)),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listPerson.length),
    );
  }
}
