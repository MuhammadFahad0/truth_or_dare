import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/components/side_drawer.dart';
import 'package:truth_or_dare/constants/enum.dart';
import 'package:truth_or_dare/get/GetHomeController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GetHomeController getHomeController = Get.put(GetHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideDrawer(),
      body: GetBuilder<GetHomeController>(
          init: getHomeController,
          builder: (c) {
            if (c.loadState == LoadState.loading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Loading"),
                  ],
                ),
              );
            }
            if (c.loadState == LoadState.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Error !", textAlign: TextAlign.center),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(children: [
                Card(
                  elevation: 20,
                  child: SizedBox(
                    height: Get.height * .3,
                    child: ClipPath(child: Image.asset("assets/family.jpg")),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]
                  // [
                  //   Card(
                  //     color: Colors.amber.shade200,
                  //     elevation: 20,
                  //     child: const ListTile(
                  //       contentPadding: EdgeInsets.all(10),
                  //       leading: CircleAvatar(
                  //         backgroundColor: Colors.amber,
                  //         radius: 40,
                  //         child: Icon(Icons.family_restroom, color: Colors.white),
                  //       ),
                  //       title: Text(
                  //         "Family Truth or Dare",
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       //      onTap: () => dialogPrizeBondList(context),
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Card(
                  //     color: Colors.blue.shade200,
                  //     elevation: 20,
                  //     child: const ListTile(
                  //       contentPadding: EdgeInsets.all(10),
                  //       leading: CircleAvatar(
                  //         backgroundColor: Colors.blue,
                  //         radius: 40,
                  //         child: Icon(Icons.videogame_asset_outlined,
                  //             color: Colors.white),
                  //       ),
                  //       title: Text(
                  //         "Friends Truth or Dare",
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       //      onTap: () => dialogPrizeBondList(context),
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Card(
                  //     color: Colors.purple.shade200,
                  //     elevation: 20,
                  //     child: const ListTile(
                  //       contentPadding: EdgeInsets.all(10),
                  //       leading: CircleAvatar(
                  //         backgroundColor: Colors.purple,
                  //         radius: 40,
                  //         child: Icon(Icons.tag_faces_sharp, color: Colors.white),
                  //       ),
                  //       title: Text(
                  //         "Funny Truth or Dare",
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       //      onTap: () => dialogPrizeBondList(context),
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  //   Card(
                  //     color: Colors.teal.shade200,
                  //     elevation: 20,
                  //     child: const ListTile(
                  //       contentPadding: EdgeInsets.all(10),
                  //       leading: CircleAvatar(
                  //         backgroundColor: Colors.teal,
                  //         radius: 40,
                  //         child: Icon(Icons.refresh_rounded, color: Colors.white),
                  //       ),
                  //       title: Text(
                  //         "Random Truth or Dare",
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       //      onTap: () => dialogPrizeBondList(context),
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     height: 10,
                  //   ),
                  // ],
                  ),
            );
          }),
    );
  }
}
