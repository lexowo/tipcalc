import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';

class Propinas extends StatelessWidget {
  const Propinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    TextEditingController txtvalorCon = TextEditingController();

    TextField txtvalor = TextField(
      controller: txtvalorCon,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Introduce el total de la cuenta',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );

    ElevatedButton btncalc = ElevatedButton(
      onPressed: (){
        if(double.tryParse(txtvalorCon.text)==null){
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Valor invalido'),
              content: Text(
                'Introduzca un valor numerico con o sin punto decimal.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                )
              ],
            )
          );
        }else{
          double xd=double.parse(txtvalorCon.text);
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Propina de ${xd.toStringAsFixed(2)}'),
              content: Text(
                'Propina de 10% a 20% sugerida:\nDe ${(xd*.1).toStringAsFixed(2)} a ${(xd*.2).toStringAsFixed(2)}\n\nTotal sugerido:\nDe ${(xd+(xd*.1)).toStringAsFixed(2)} a ${(xd+(xd*.2)).toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                )
              ],
            )
          );
        }
      }, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calculate_outlined),
          Text('Calcular propina')
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Propinas'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            txtvalor,
            btncalc,
          ],
        ),
      ),
    );
  }
}