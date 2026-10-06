
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/data/response/status.dart';
import 'package:mvc_pattern/res/routes/routes_name.dart';
import 'package:mvc_pattern/view_models/controller/home/home_view_models.dart';
import 'package:mvc_pattern/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeController = Get.put(HomeController()) ;
  UserPreference userPreference = UserPreference() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi() ;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              userPreference.removeUser().then((value) {
                Get.toNamed(RouteName.loginView) ;
              },);
            },
            icon: Icon(
                Icons.logout,
                color: Colors.white,
            ),
          ),
        ],
      ),

      body: Obx(() {

        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Text("Something went wrong");
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                      ),
                      title: Text(homeController.userList.value.data![index].firstName.toString()),
                      subtitle: Text(homeController.userList.value.data![index].email.toString()),
                    ),
                  );
                },);

        }


      },),

    );
  }
}
