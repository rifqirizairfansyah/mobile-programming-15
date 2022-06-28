import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pertemuan15/model/profile.dart';
import 'package:pertemuan15/screens/profile/widgets/custom_experience.dart';
import 'package:pertemuan15/screens/profile/widgets/custom_grid.dart';
import 'package:pertemuan15/screens/profile/widgets/experience.dart';
import 'package:pertemuan15/screens/profile/widgets/person_info.dart';
import 'package:pertemuan15/screens/profile/widgets/login.dart';
import 'package:pertemuan15/screens/profile/widgets/tab_sliver_delegate.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:pertemuan15/services/remote_service.dart';

class ProfilePage extends StatelessWidget {
  final profile = Profile.genreateProfile();

  final tabs = ['Portofolio', 'Users'];

  ProfilePage({Key? key}) : super(key: key);

  List<Post>? experience;
  var isLoaded = false;

  getList() async {
    experience = await RemoteService().getPosts();
    if (experience != null) {
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Center(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: PersonInfo(profile),
                ),
                SliverPersistentHeader(
                  delegate: TabSliverDelegate(TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                    indicatorColor: Colors.black,
                    tabs: tabs
                        .map((e) => Tab(
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ))
                        .toList(),
                  )),
                  pinned: true,
                )
              ];
            },
            body: TabBarView(
              children: [
                CustomGrid('Portofolio', profile.creations!),
                ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      // ignore: avoid_unnecessary_containers
                      return Container(
                          child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 5.0),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9.0),
                            boxShadow: [
                              BoxShadow(
                                  color: (Colors.grey[200])!,
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 3))
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          experience![index].nama,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          experience![index].agama,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.apply(
                                                color: Colors.grey,
                                              ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                experience![index].nim,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.apply(color: Colors.grey),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 9),
                              Text(
                                experience![index].prodi,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.apply(fontWeightDelta: 2),
                              )
                            ],
                          ),
                        ),
                      ));
                    })
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: _buildIcon(Icons.arrow_back_ios_new_outlined, context),
      actions: [_buildIcon(Icons.more_horiz_outlined, context)],
    );
  }

  IconButton _buildIcon(IconData icon, context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Login()));
        },
        splashRadius: 25,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ));
  }
}
