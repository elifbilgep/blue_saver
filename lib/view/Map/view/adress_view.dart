import 'package:blue_savers/constants/colors.dart';
import 'package:blue_savers/models/contest.dart';
import 'package:blue_savers/view/Profile/view/profile_view.dart';
import 'package:blue_savers/view/widgets/headline.dart';
import 'package:flutter/material.dart';
import '../../../constants/list.dart';
import 'adress_location_view.dart';
import 'google_map_view.dart';

class AdressView extends StatefulWidget {
  final Contest contest;

  const AdressView({
    Key? key,
    required this.contest,
  }) : super(key: key);

  @override
  State<AdressView> createState() => _AdressViewState();
}

class _AdressViewState extends State<AdressView> {
  final items = ["Maps", "Adress"];
  String selectedValue = 'Maps';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors().mainBlue,
          title: Text(
            widget.contest.point.toString() + " points 🏆",
            style: const TextStyle(fontSize: 22, fontFamily: "Lato"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              buildLocationDropDown(),
              const SizedBox(
                height: 20,
              ),
              buildLocationCard(),
              const SizedBox(
                height: 10,
              ),
              buildContestDetails(),
              const SizedBox(
                height: 10,
              ),
              buildOtherUsersHeadline(),
              const SizedBox(
                height: 10,
              ),
              buildOtherUsers(),
            ],
          ),
        ));
  }

  buildLocationDropDown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3))
          ]),

      // dropdown below..
      child: SizedBox(
        width: 300,
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (newValue) => setState(() => selectedValue = newValue!),
          items: items
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 190, left: 10),
                          child: Text(
                            value,
                            style: const TextStyle(fontFamily: "lato"),
                          ),
                        ),
                      ))
              .toList(),
          icon: const Icon(Icons.keyboard_arrow_down),
          underline: const SizedBox(),
        ),
      ),
    );
  }

  buildLocationCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          height: 400,
          width: 320,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: selectedValue == "Maps"
              ? MapSample(
                  contest: widget.contest,
                )
              : AdressLocationView(
                  contest: widget.contest,
                )),
    );
  }

  buildContestDetails() {
    return SizedBox(
      height: 80,
      width: 310,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Headline(
                  label: widget.contest.placeName,
                  size: 24,
                  color: ConstantColors().headlineGrey,
                ),
                Text(
                  widget.contest.hours,
                  style: const TextStyle(fontSize: 16, fontFamily: "Lato"),
                ),
                Text(
                  widget.contest.date,
                  style: const TextStyle(fontSize: 16, fontFamily: "Lato"),
                )
              ]),
          Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                color: ConstantColors().mainBlue,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "I will join!",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Futura", fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildOtherUsers() {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 40),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      CircleAvatar(
                        minRadius: 40,
                        backgroundImage: AssetImage(
                            "lib/assets/images/${Lists().userImages[index]}"),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        Lists().userNames[index],
                        style:
                            const TextStyle(fontFamily: "Lato", fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  buildOtherUsersHeadline() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Headline(
            label: "Attendees:",
            size: 18,
            color: ConstantColors().headlineGrey,
          )),
    );
  }
}
