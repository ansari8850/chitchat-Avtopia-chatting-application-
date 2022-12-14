import 'package:chitchat/presentation/pages/sub_pages/single_item_story_page.dart';
import 'package:chitchat/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: Stack(
        children: <Widget>[
          _customFloatingActionButton(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _storyWidget(),
                SizedBox(
                  height: 8,
                ),
                _recentTextWidget(),
                SizedBox(
                  height: 8,
                ),
                _listStories(),
              ],
            ),
          )
        ],
      ),
    ));
  }

  //camera & draw icon in status
  Widget _customFloatingActionButton() {
    return Positioned(
        right: 10,
        bottom: 15,
        child: Column(
          children: <Widget>[
            //CONTAINER1
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4.0),
                      blurRadius: 0.50,
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 0.10)
                ],
              ),
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey,
              ),
            ),

            SizedBox(
              height: 8.0,
            ),

            //CONTAINER2
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4.0),
                      blurRadius: 0.50,
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 0.10)
                ],
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }

  //STORY OF PEOPLE
  Widget _storyWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 4),
      child: Row(
        children: <Widget>[
          Container(
            height: 55,
            width: 55,
            child: Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset("assets/help.webp"),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ))
            ]),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Tap to add status update",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recentTextWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Text("Recent updates"),
    );
  }

  Widget _listStories() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return SingleItemStoryPage();
      },
    );
  }
}
