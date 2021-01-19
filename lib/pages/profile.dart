import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  String text = "cute button";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Профиль"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(                
                children: [
                    ListTile(
                        leading: 
                            CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://sun9-44.userapi.com/impg/c855436/v855436909/24e7d2/YmrFmtCmdtk.jpg?size=1280x960&quality=96&sign=533e62d98ac11ab5db72b710ae4cd3f9&type=album'),
                            ),
                        title: 
                            Text(
                                "Султанова Виктория", 
                                style: TextStyle(fontSize: 18, )),
                        subtitle: 
                            Text(
                                "vikasultanova96@gmail.com", 
                                style: TextStyle(fontSize: 14, )),
                    ), 
                    ListTile(                    
                        title: Text("История покупок"),
                        trailing: Icon(Icons.history),
                        onTap: () {},
                    ),
                    const Divider(
                        color: Colors.cyan,
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                    ),
                    ListTile(                        
                        title: Text("Учетная запись"),
                        trailing: Icon(Icons.account_box),
                        onTap: () {},
                    ),
                    const Divider(
                        color: Colors.cyan,
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                    ),
                    ListTile(                        
                        title: Text("Адреса доставки"),
                        trailing: Icon(Icons.present_to_all),
                        onTap: () {},
                    ),
                    const Divider(
                        color: Colors.cyan,
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                    ),
                    ListTile(                        
                        title: Text("Выйти"),
                        trailing: Icon(Icons.exit_to_app),
                        onTap: () {},
                    ),

                    
                    FlatButton(
                        color: Colors.pink, 
                        textColor: Colors.white,
                        child: Text(text.toString()),
                        onPressed: () => {
                        setState(() {
                            text = "you're cute";
                        })
                        },
                    ),                    
                ],
            ),
                
        ),
        
    );
  }
}
