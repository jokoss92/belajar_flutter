import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  FormState createState() => FormState();
}

class FormState extends State<HomeScreen> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Belajar Flutter'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.add_to_queue,
              color: Colors.white,
            ),
            onPressed: () {
              //naviget ke second screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          )
        ],
      ),

      //dekalarasi myController
      //final myController = TextEditingController();

      //menambahan action button

      //menampilkan textfield
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),

      //menambahkan floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Menapilkan value text',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
        backgroundColor: Colors.red,
      ),
      //body: Image.asset('assets/images/location.png'),
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.apps, color: Colors.green, size: 40.0,),
              new Text('Apps')
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.add_a_photo, color: Colors.green, size: 40.0,),
              new Text('Galeri')
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.alarm, color: Colors.green, size: 40.0,),
              new Text('Alarm')
            ],
          ),
        ],
      ),

      //bottom menu
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Message'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.person),
          title: new Text('Profle'),
        )
      ]),
    );
  }
}
