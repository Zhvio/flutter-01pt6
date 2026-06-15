import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MahasiswaListPage extends StatefulWidget {
  const MahasiswaListPage({super.key});

  @override
  State<MahasiswaListPage> createState() => _MahasiswaListPageState();
}

class _MahasiswaListPageState extends State<MahasiswaListPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void deleteData(id){
    EasyLoading.show();
    var url = Uri.parse('https://belajar-api.unama.ac.id/api/mahasiswa/$id');
    http.delete(url).then( (response) {
    if (response.statusCode == 200){
      EasyLoading.showSuccess('Data berhasil dihapus');
      getData();
    }else{
      var responJson = jsonDecode(response.body);
      EasyLoading.showError('Opss...' + responJson['message']);
    }
    });
  }

  List listData = [];

  void getData() async {
    EasyLoading.show();
    var url = Uri.parse('https://belajar-api.unama.ac.id/api/mahasiswa');
    var respon = await http.get(url);
    var responJson = jsonDecode(respon.body);
    setState(() {
      listData = responJson['data'];
    });
    EasyLoading.dismiss();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    deleteData(listData[index]['id']);
                  }, icon: Icon(Icons.delete)),
                  IconButton(onPressed: (){
                    Navigator.pushNamed(context, '/mahasiswa-edit',arguments: listData[index]);
                  }, icon: Icon(Icons.edit)),
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/mahasiswa-detail', arguments: listData[index]);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listData[index]['foto']),
            ),
            title: Text('Nama: ${listData[index]['nama']}'),
            subtitle: Text('NIM: ${listData[index]['nim']}'),
          );
        },
      ),
    );
  }
}