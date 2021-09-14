import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Lex Avila'), 
              accountEmail: Text('lexavila@algo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://s.pacn.ws/1500/h1/nendoroid-no-327-animal-crossing-new-leaf-shizue-isabelle-306775.6.jpg'),
                //child: Icon(Icons.verified_user),
              ),
              decoration: BoxDecoration(
                color: ColorSettings.colorPrimary
              ),
            ),
            ListTile(
              title: Text('Propinas'),
              subtitle: Text('Calculadora de Propinas'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/opc1');
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
          ],
        ),
      ),
    );
  }
}