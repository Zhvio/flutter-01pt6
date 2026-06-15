import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/mahasiswa-list');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(140, 100),
                ),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.switch_account_rounded,size:40),
                    Text('Data Mahasiswa')
                    ],
                  )
                ),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/mahasiswa-form');
                }, 
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(160, 100)
                ) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_library_add,size: 40,),
                    Text('Tambah Mahasiswa')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
