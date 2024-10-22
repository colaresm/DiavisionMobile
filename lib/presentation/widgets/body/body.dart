import 'package:diavision/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Body extends StatelessWidget {
  const Body({required this.content, required this.onRefresh, super.key});
  final Widget content;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 50, 139, 53),
      ),
      body: SmartRefresher(
        onRefresh: () {
          onRefresh();
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        child: content,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(Icons.video_call),
            label: 'Capturar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Exames',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.green,
        onTap: (int e) {
          redirectToRegisterCaptureImagesPage(context);
        },
      ),
    );
  }
}
