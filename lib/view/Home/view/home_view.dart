import 'package:blue_savers/models/contest.dart';
import 'package:blue_savers/services/auth_service.dart';
import 'package:blue_savers/services/firestore_service.dart';
import 'package:blue_savers/view/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/list.dart';
import '../../Map/view/adress_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var activeUserId;
  List<Contest>? contests;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    activeUserId = Provider.of<Auth>(context, listen: false).activeUserId;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60),
        child: Column(
          children: [
            buildAppBar(),
            space2,
            buildSearchBar(context),
            space2,
            buildHeadline1(),
            space2,
            buildContestCards(),
            space2,
            buildHeadline2(),
            space2,
            buildNews(context),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 35,
                color: ConstantColors().mainBlue,
              ),
              const Text(
                "Muğla, ",
                style: TextStyle(
                    fontFamily: "Futura",
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Turkey",
                style: TextStyle(fontFamily: "Futura", fontSize: 24),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
                hintText: "Search contest",
                hintStyle: TextStyle(
                    fontFamily: "Futura", color: Colors.grey, fontSize: 18),
                border: InputBorder.none,
                icon: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }

  buildHeadline1() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Headline(
          label: "Nearest Contests",
          size: 18,
          color: ConstantColors().headlineGrey,
        ));
  }

  buildList(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getContests(),
        builder: (context, dynamic snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          contests = snapshot.data;
          return buildContestCards();
        });
  }

  buildContestCards() {
    return SizedBox(
        height: 270,
        width: 500,
        child: FutureBuilder(
            future: FirestoreService().getContests(),
            builder: (context, dynamic snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              contests = snapshot.data;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdressView(
                                      contest: contests![index],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 310,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 170,
                                    width: 290,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        contests![index].photoURL,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      space1,
                                      Text(
                                        contests![index].placeName,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        contests![index].date,
                                        style: const TextStyle(
                                            fontSize: 16, fontFamily: "Lato"),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        contests![index].hours,
                                        style: const TextStyle(
                                            fontSize: 16, fontFamily: "Lato"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    );
                  });
            }));
  }

  get space1 => const SizedBox(
        height: 20,
      );

  get space2 => const SizedBox(
        height: 20,
      );

  buildHeadline2() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Headline(
          label: "News",
          size: 18,
          color: ConstantColors().headlineGrey,
        ));
  }

  buildNews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        height: 220 * 3,
        width: double.infinity,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: Image.asset(
                          "lib/assets/images/${Lists().newsImage[index]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              Lists().news[index],
                              style: const TextStyle(fontFamily: "Lato"),
                            ),
                          ),
                          const Text(
                            "Read more..",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato"),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
