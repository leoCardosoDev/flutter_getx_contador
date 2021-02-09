import 'package:flutter/material.dart';
import 'package:flutter_getx_esp_contador/controllers/home_controller.dart';
import 'package:flutter_getx_esp_contador/models/users.dart';
import 'package:get/get.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'users',
        builder: (_) {
          return _.loading
              ? Center(child: LinearProgressIndicator())
              : ListView.builder(
                  itemBuilder: (ctx, idx) {
                    final User user = _.users[idx];
                    return ListTile(
                      title: Text(user.firstName),
                      subtitle: Text(user.email),
                      onTap: () => _.showUserProfile(user),
                    );
                  },
                  itemCount: _.users.length,
                );
        });
  }
}
