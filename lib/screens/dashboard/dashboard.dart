import 'package:bytebankapp/screens/contacts_list/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard ByteBankApp"),
      ),
      body: Column(
        // Alinhamento entre os componentes
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Alinhamento Horizontal
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // Envolver o Widget com funções de animaçao
            child: Material(
              // Neste caso o Material determina as cores
              color: Theme.of(context).primaryColor,

              // Envolver o Widget com funções de click
              child: InkWell(
                // Rota de navegação para a próxima página
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactsList();
                      },
                    ),
                  );
                },
                child: Container(
                  // Padding interno do container
                  padding: EdgeInsets.all(8.0),
                  height: 120,
                  width: 120,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
