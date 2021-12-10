import 'package:flutter/material.dart';
import 'package:http_tiga/create_page.dart';
import 'package:http_tiga/person.dart';
import 'package:http_tiga/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        'home': (context) => HomePage(),
        'create': (context) => CreatePage()
      },
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
      body: ListView.builder(
          itemBuilder: (context, index) {
            Person person = listPerson[index];
            return ListTile(
              title: Text('${person.firstName} ${person.lastName}'),
              subtitle: Text(
                person.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.balitbangham.go.id/po-content/po-upload/news-default.jpg'),
                        fit: BoxFit.cover)),
              ),
            );
          },
          itemCount: listPerson.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
