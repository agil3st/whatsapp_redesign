import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_redesign/components/text_builder.dart';
import 'package:whatsapp_redesign/themes/color_library.dart';
import 'package:whatsapp_redesign/themes/size_controller.dart';
import 'package:whatsapp_redesign/themes/text_formatter.dart';

class IndexScreen extends StatefulWidget {

  final int pageIndex;
  final String title;

  IndexScreen({Key key, this.title, this.pageIndex}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  String title = 'WhatsApp';

  @override
  Widget build(BuildContext context) {
    Size screenSize = SizeController.getCurrentSize(context);

    buildCircleContainer({
      double width,
      double height,
      String imageURL,
      double marginBottom,
      BoxShadow shadow
    }) {
      return Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(bottom: marginBottom, top: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.cover
            ),
            color: ColorLibrary.whiteChocolate,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              shadow
            ]
        ),
      );
    }

    buildCircleBadge(
        String value, {
          double width,
          double height,
          double textSize,
          Color badgeColor,
          Color textColor,
          double borderWidth,
          BorderStyle borderStyle,
          Color borderColor,
        }) {

      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: badgeColor,
            border: Border.all(
                color: borderColor,
                width: borderWidth,
                style: borderStyle
            )
        ),
        child: Center(
            child: TextBuilder.write(
                '$value',
                color: textColor,
                size: textSize
            )
        ),
      );
    }

    buildTitleBar() {
      return Container(
        margin: EdgeInsets.all(SizeController.defaultPadding),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: TextBuilder.write(
                title,
                weight: FontWeight.bold,
                size: 28,
                color: ColorLibrary.darkTabBar.withAlpha(180)
              )
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.search,
                      color: ColorLibrary.darkTabBar.withAlpha(180),
                      size: 25,
                    ),
                  )
                ],
              )
            )
          ],
        ),
      );
    }

    buildStoryViewer() {
      return showGeneralDialog(
        context: context,
        transitionDuration: Duration(milliseconds: 200),
        barrierLabel: '',
        barrierDismissible: true,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      // color: Colors.redAccent,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[Colors.black54, Colors.transparent],
                          )),
                    ),
                    elevation: 0.0,
                    title: TextBuilder.write(
                        'Story ...',
                        weight: FontWeight.bold,
                        size: 17,
                        color: ColorLibrary.whiteChocolate
                    ),
                    leading: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage('https://placeimg.com/150/120/person'),
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white70,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      child: CachedNetworkImage(
                        imageUrl: 'https://placeimg.com/400/800/person',
                        fit: BoxFit.cover,
                        imageBuilder: (context, image) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        progressIndicatorBuilder: (context, url, progress) => Center(
                          child: CircularProgressIndicator(value: progress.progress)
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: screenSize.width,
                        color: Colors.black.withOpacity(0.5),
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: TextBuilder.write(
                              'Lorem ipsum dolor sit amet consectetur adipisicing elit. '
                                  'Tempora eum placeat rerum ipsum sequi maiores alias laborum. '
                                  'Obcaecati, assumenda fuga!',
                              color: ColorLibrary.whiteChocolate,
                              size: 15,
                              align: TextAlign.center
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        pageBuilder: (context, animation1, animation2) {},
      );
    }

    buildStatusScroller() {
      final stories = [
        ['http://placeimg.com/120/120/people/12', 4],
        ['http://placeimg.com/120/120/people/312', 2],
        ['http://placeimg.com/120/120/people/162', 1],
        ['http://placeimg.com/120/120/people/132', 4],
        ['http://placeimg.com/120/120/people/3242', 4],
        ['http://placeimg.com/120/120/people/165', 1],
        ['http://placeimg.com/120/120/people/532', 7],
      ];

      return Container(
        width: screenSize.width,
        height: 100,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: SizeController.defaultPadding),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            var story = stories[index];
            return GestureDetector(
              child: Stack(
                children: [
                  buildCircleContainer(
                    width: 80,
                    height: 80,
                    imageURL: story[0],
                    marginBottom: 20,
                    shadow: BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 7)
                    )
                  ),
                  Positioned(
                    right: 0,
                    bottom: 20,
                    child: buildCircleBadge(
                      '${story[1]}',
                      width: 20,
                      height: 20,
                      textSize: 10,
                      badgeColor: ColorLibrary.tealGreen,
                      textColor: ColorLibrary.whiteChocolate,
                      borderColor: ColorLibrary.whiteChocolate,
                      borderStyle: BorderStyle.solid,
                      borderWidth: 2
                    ),
                  )
                ],
              ),
              onTap: () {
                log('Story ${story[0]} Tapped!');
                return buildStoryViewer();
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 15);
          },
        ),
      );
    }

    buildChatItem(
        String name,
        String photo,
        String date,
        String lastMessage,
        {
          bool isPinned,
          int lastMessageStatus,
          int unreadMessageCount,
          bool isMuted,
          bool isUnread,
          int networkStatus
        }) {

      final messageStatus = [
        // Sent
        FaIcon(FontAwesomeIcons.check, size: 13, color: ColorLibrary.semiDark.withAlpha(150)),
        // Delivered
        FaIcon(FontAwesomeIcons.check, size: 13, color: ColorLibrary.blue),
        // Read
        FaIcon(FontAwesomeIcons.check, size: 13, color: ColorLibrary.lightGreen),
      ];

      final userNetworkStatus = [
        // Offline
        ColorLibrary.lightGrey,
        // Away
        ColorLibrary.darkYellow,
        // Online
        ColorLibrary.tealGreenLight
      ];

      return Container(
        margin: EdgeInsets.symmetric(horizontal: SizeController.defaultPadding),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: SizeController.defaultPadding - 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorLibrary.whiteChocolate,
          boxShadow: [
            ColorLibrary.baseShadow
          ],
          gradient: ColorLibrary.baseGradient
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  buildCircleContainer(
                    width: 60,
                    height: 60,
                    imageURL: photo,
                    marginBottom: 0,
                    shadow: BoxShadow(),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 10,
                    child: buildCircleBadge(
                      '',
                      width: 13,
                      height: 13,
                      badgeColor: userNetworkStatus[networkStatus],
                      borderWidth: 1.5,
                      borderStyle: BorderStyle.solid,
                      borderColor: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.all(SizeController.defaultPadding - 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBuilder.write(
                      name,
                      color: ColorLibrary.darkTabBar.withAlpha(180),
                      size: 16,
                      weight: FontWeight.bold
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        messageStatus[lastMessageStatus],
                        SizedBox(width: 5),
                        TextBuilder.write(
                            lastMessage,
                            size: 12,
                          color: ColorLibrary.darkTabBar.withAlpha(180),
                          weight: FontWeight.bold
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextBuilder.write(
                    date,
                    size: 10,
                    color: ColorLibrary.darkTabBar.withAlpha(180)
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      unreadMessageCount > 0 ? buildCircleBadge(
                          '$unreadMessageCount',
                          width: 22,
                          height: 22,
                          textSize: 10,
                          textColor: ColorLibrary.whiteChocolate,
                          badgeColor: ColorLibrary.tealGreenLight,
                          borderWidth: 0,
                          borderColor: ColorLibrary.tealGreenLight,
                          borderStyle: BorderStyle.solid
                      ) : Container(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    buildChatList() {
      var chatList = [
        ['http://placeimg.com/120/120/people/12', 'Agil Setiawan', 'Halo halo', '8:35 AM', 1, 5, 2],
        ['http://placeimg.com/120/120/people/1392', 'James Cordesky', 'My name is..', '1:35 PM', 0, 0, 2],
        ['http://placeimg.com/120/120/people/393', 'William Fenning', 'Agill..', '11:35 AM', 2, 0, 0],
        ['http://placeimg.com/120/120/people/15', 'Jimmy Touring', 'Cuk', '9:12 PM', 1, 3, 1],
        ['http://placeimg.com/120/120/people/2101', 'Hilda Heyes', 'Hey gil', '8:15 PM', 0, 22, 0],
        ['http://placeimg.com/120/120/people/232', 'Kimberly Dalton', 'Sayaaanng', '7:35 AM', 2, 12, 1],
        ['http://placeimg.com/120/120/people/212', 'Hannung Kraten', 'Meet me at 10', '7:35 AM', 2, 96, 0],
        ['http://placeimg.com/120/120/people/44', 'Wendy White', 'Dont worry', '7:35 AM', 2, 14, 2],
        ['http://placeimg.com/120/120/people/71', 'Vranda Tery', 'Lets grab some food', '7:35 AM', 2, 3, 0],
        ['http://placeimg.com/120/120/people/96', 'Harley Quinn', 'OMG :v', '7:35 AM', 2, 0, 1],
      ];

      return Container(
        child: Builder(
          builder: (context) {
            List<Widget> items = [];
            chatList.forEach((chatItem) {
              items.add(buildChatItem(
                chatItem[1],
                chatItem[0],
                chatItem[3],
                TextFormatter.formatSubtitle(chatItem[2]),
                lastMessageStatus: chatItem[4],
                unreadMessageCount: chatItem[5],
                networkStatus: chatItem[6]
              ));
              items.add(SizedBox(height: 20));
            });

            return Container(
              child: Column(
                children: items,
              ),
            );
          },
        ),
      );
    }

    buildMenuGrid() {
      final menu = [
        ['Chats', Icons.message],
      ];

    }

    buildBackdrop() {
      return Container(
        width: screenSize.width,
        height: 310,
        child: SvgPicture.asset(
          'asset/images/backdrop_1.svg',
          fit: BoxFit.fill,
        ),
      );
    }

    buildContent() {
      return Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              buildBackdrop(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTitleBar(),
                  SizedBox(height: 10),
                  buildStatusScroller(),
                  SizedBox(height: 20),
                  buildChatList(),
                  SizedBox(height: 80)
                ],
              )
            ],
          ),
        ),
      );
    }

    buildCircleFAB() {
      final addMessageButton = Container(
        child: FloatingActionButton(
          backgroundColor: ColorLibrary.tealGreenLight,
          elevation: 10,
          child: FaIcon(FontAwesomeIcons.paperPlane),
        ),
      );

      final addStatusButton = Container(
        child: FloatingActionButton(
          backgroundColor: ColorLibrary.tealGreenLight,
          elevation: 10,
          child: FaIcon(FontAwesomeIcons.eye),
        ),
      );

      final addGroupButton = Container(
        child: FloatingActionButton(
          backgroundColor: ColorLibrary.tealGreenLight,
          elevation: 10,
          child: FaIcon(FontAwesomeIcons.userFriends),
        ),
      );

      return Builder(
        builder: (context) => FabCircularMenu(
          // Cannot be `Alignment.center`
          alignment: Alignment.bottomRight,
          ringColor: Colors.white.withAlpha(25),
          ringDiameter: 250.0,
          ringWidth: 50.0,
          fabSize: 64.0,
          fabElevation: 8.0,

          // Also can use specific color based on wether
          // the menu is open or not:
          // fabOpenColor: Colors.white
          // fabCloseColor: Colors.white
          // These properties take precedence over fabColor
          fabColor: ColorLibrary.darkRed,
          fabCloseColor: ColorLibrary.tealGreenLight,
          fabCloseIcon: Icon(Icons.close, color: Colors.white),
          fabOpenIcon: Icon(Icons.add, color: Colors.white),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          children: [
            addStatusButton,
            addMessageButton,
            addGroupButton
          ],
        ),
      );
    }

    buildScreen() {
      return Scaffold(
        backgroundColor: Colors.white.withAlpha(248),
        body: buildContent(),
        floatingActionButton: buildCircleFAB(),
      );
    }

    return buildScreen();
  }
}