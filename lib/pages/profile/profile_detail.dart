import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileDetail extends StatelessWidget {
  const profileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // appBar: AppBar(
        //   title: Text("Nama gue nih bro"),
        //   centerTitle: true,
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Inky Pramudia Ramdhani',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'id: 97867674354',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text('Gender'),
                          subtitle: Text('laki"'),
                        ),
                        ListTile(
                          title: Text('Tempat, Tanggal lahir'),
                          subtitle: Row(
                            children: const [
                              Text('Majalengka'),
                              Text('20-11-2003'),
                            ],
                          ),
                        ),
                        const ListTile(
                          title: Text('Agama'),
                          subtitle: Text('ISLAM"'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Status perkawinan'),
                          subtitle: Text('jomblo'),
                        ),
                        ListTile(
                            title: Text('pekerjaan'), subtitle: Text('PNS')),
                        ListTile(
                          title: Text('Kewarganegaraan'),
                          subtitle: Text('WNI'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ListTile(
                title: Text('alamat'),
                subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              ),
              const ListTile(
                title: Text('BNI a/n Inky ddaaa jdkd'),
                subtitle: Text('5475748456'),
                trailing: InkWell(child: Icon(Icons.edit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
