import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final _appBarTitle = "Instagram";
  final _titlebg =
      "https://pixabay.com/get/gc1117b321e523c40ae9f9f6bb7d1fdf7ad6bfb6b91407d9c60a533b2ba869790cecebb91e6f19f7798ce167f543341fa_1280.jpg";

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(flex: 5, child: buildListViewTab(context)),
          Expanded(
            flex: 1,
            child: buildListView(),
          ),
          Expanded(
            flex: 1,
            child: buildDismissibleButtomCard(),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      actions: [buildIconButtonFavourite(context)],
      title: buildRowAppBarTitle(context),
    );
  }

  IconButton buildIconButtonFavourite(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Column(),
        );
      },
      icon: Icon(Icons.favorite),
    );
  }

  Row buildRowAppBarTitle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.wallpaper),
        buildTextApp(context),
      ],
    );
  }

  Text buildTextApp(BuildContext context) {
    return Text(
      _appBarTitle,
      style: Theme.of(context)
          .primaryTextTheme
          .headline6!
          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }

  ListView buildListViewTab(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.height * 0.1,
          color: randomColor,
        ),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildListViewCard(context, index);
      },
    );
  }

  SizedBox buildListViewCard(BuildContext context, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: ListTile(
          onTap: () {
            print("$index . Satırdaki User a Tıklanıldı.");
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_titlebg),
          ),
          title: Text("$_appBarTitle, $index"),
          trailing: Icon(Icons.ac_unit_sharp),
        ),
      ),
    );
  }

  Dismissible buildDismissibleButtomCard() {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.black,
      ),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      child: buildContainerButtom(),
    );
  }

  Container buildContainerButtom() {
    return Container(
      color: Colors.blue,
    );
  }
}
