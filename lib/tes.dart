import 'package:flutter/material.dart';

class Tesss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Hide Show Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScrollHideShowDemo(),
    );
  }
}

class ScrollHideShowDemo extends StatefulWidget {
  @override
  _ScrollHideShowDemoState createState() => _ScrollHideShowDemoState();
}

class _ScrollHideShowDemoState extends State<ScrollHideShowDemo> {
  ScrollController _scrollController = ScrollController();
  bool _showTextField = true;
  bool _showSearchIcon = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        _showSearchIcon = true;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Your App Name'),
            actions: <Widget>[
              if (_showSearchIcon)
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _showTextField = true;
                      _showSearchIcon = false;
                    });
                  },
                ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
            pinned: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  title: _showTextField
                      ? Container(
                          height: 36,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search, size: 24,),
                                      ),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  centerTitle: true,
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}