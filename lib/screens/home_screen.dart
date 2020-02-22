import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suitable_flat/main.dart';
import 'package:suitable_flat/models/suit_models.dart';
import 'package:suitable_flat/provider/theme_provider.dart';
import 'package:suitable_flat/screens/details_screen.dart';
import 'package:suitable_flat/widgets/StartRating.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int ratttting=0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark=false;
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){

          },
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),


                child: Image(
                  image: AssetImage("assest/images/man.jpg"),
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                )
            ),
          ),

        ],
      ),
      body: Column(

        children: <Widget>[


          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 40.0),


            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Find a",style: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 30.0
                    ),),
                    SizedBox(height: 10.0,),
                    Text("Suitable Flat",style: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        fontSize: 30.0),
                    ),
                  ],
                ),

                Container(
                  width: 40,
                  height: 40.0,


                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)
                  ),

                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.filter),
                    color: Colors.black45,
                    onPressed: (){
                      isDark=!isDark;

                    },
                  ),




                ),

                Switch(
                  value: themeProvider.isLightTheme,
                  onChanged: (val){
                    themeProvider.setThemeData=val;
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Expanded(


            child: _buildListView()
          )

        ],
      ),

    );
  }



  _buildImageListView(Suitable suit) {

    return Positioned(
      right: 30.0,
      child: Container(
        width: 180.0,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),

            boxShadow: [BoxShadow(
              color: Colors.black45,
              offset: Offset.fromDirection(0.0,0.2),
              blurRadius: 18,
            )]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 260.0,
                child: Hero(
                  tag: suit.id,
                  child: Image(
                    image: AssetImage(suit.imgUrl),
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 50.0 ,
                    width: 180.0,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Colors.black45,
                            blurRadius: 16,
                            offset: Offset.fromDirection(0.0,0.2)

                        )]
                    ),

                  )
              ),
              Positioned(
                bottom: 10.0,
                right: 4.0,
                left: 4.0,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      child: Text(suit.title,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,

                      ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,

                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.locationArrow),
                        onPressed: (){

                        },
                        color: Colors.white,
                        iconSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _buildBoxInfo(Suitable suit) {
    return Positioned(
      right: 150.0,
      left: 20.0,
      top: 30.0,
      child: Container(


        height: 160.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [BoxShadow(
                color: Theme.of(context).accentColor,
                offset: Offset.fromDirection(0.0,0.2),
                blurRadius: 5
            )]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('\$${suit.price}',style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10.0,),
                Text("per month",style: TextStyle(

                ),),
              ],
            ),
            SizedBox(height: 10.0,),
            Text(suit.categorie),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StarRating(
                  starCount: 5,
                  rating: suit.rating,
                  color: Colors.orange,
                  iconSize: 12.0,


                ),
                SizedBox(width: 5.0,),
                Text('${suit.total_review} reviews',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0
                ),),

              ],

            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage("assest/images/man.jpg"),
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 5.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage("assest/images/woman.jpeg"),
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 5.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Center(child: Text("+99",style: TextStyle(
                      color: Colors.white,
                    fontSize: 12.0
                  ),)),
                ),


              ],
            )

          ],
        ),

      ),
    );
  }

  _buildListView() {
    return ListView.builder(

      itemCount: listSuitable.length,
      itemBuilder: (BuildContext context,int index){
        Suitable suit = listSuitable[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(suit)));
          },
          child: Container(
            height: 280.0,

            child: Stack(

              children: <Widget>[
                _buildImageListView(suit),
                _buildBoxInfo(suit)


              ],
            ),
          ),
        );
      },
    );
  }


}
