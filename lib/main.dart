import 'package:flutter/material.dart';
import 'package:overlapping_panels/overlapping_panels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return OverlappingPanels(
      left: Builder(builder: (context) {
        return const LeftPage();
      }),
      right: Builder(
        builder: (context) => const RightPage(),
      ),
      main: Builder(
        builder: (context) {
          return const MainPage();
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  Text(
                    '@',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text('notgr')
                ]),
                const Text(
                  'Playing Fornite Battle Royale',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            OverlappingPanelsState.of(context)?.reveal(RevealSide.left);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              OverlappingPanelsState.of(context)?.reveal(RevealSide.right);
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              OverlappingPanelsState.of(context)?.reveal(RevealSide.right);
            },
          ),
          IconButton(
            icon: const Icon(Icons.group),
            onPressed: () {
              OverlappingPanelsState.of(context)?.reveal(RevealSide.right);
            },
          )
        ],
      ),
      body: ListView(
        children: List.generate(
            30,
            (index) => ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: const CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/5024388?v=4"),
                  ),
                  title: Row(
                    children: const [
                      Text(
                        'notgr',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Today at 10:30 PM',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  subtitle: const Text(
                    'Can we get some coffee beans tomorrow before breakfast time? Please huryy else I will die here',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                  },
                  onLongPress: () {
                  },
                )),
      ),
    );
  }
}

class LeftPage extends StatelessWidget {
  const LeftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: ListView(
                  children: List.generate(
                      4,
                      (index) => const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: CircleAvatar(
                              radius: 30,
                              foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/5024388?v=4",
                              ),
                            ),
                          ))),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey[100]!))),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text(
                                    "notgr",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                              const Text(
                                "success is approximately equal to past good",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Text(
                                  'TEXT CHANNELS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                              ),
                              ...["general", "resources", "standup"]
                                  .map((channel) => ListTile(
                                        leading: const Icon(Icons.tag),
                                        horizontalTitleGap: 0,
                                        title: Text(channel),
                                        onTap: () {
                                        },
                                      )),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Text(
                                  'VOICE CHANNELS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                              ),
                              ...["General", "support"]
                                  .map((channel) => ListTile(
                                        leading: const Icon(Icons.headphones),
                                        horizontalTitleGap: 0,
                                        title: Text(channel),
                                        onTap: () {
                                        },
                                      ))
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}

class RightPage extends StatelessWidget {
  const RightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Container(
              width: 50,
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey[100]!))),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "@",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Expanded(
                                      child: Text(
                                    "notgr",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_horiz))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 32,
                                      color: Colors.grey,
                                    )),
                                const Text(
                                  "Search",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ]),
                              const Expanded(child: SizedBox()),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.push_pin,
                                        size: 32,
                                        color: Colors.grey,
                                      )),
                                  const Text(
                                    "Pinned",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.notifications,
                                        size: 32,
                                        color: Colors.grey,
                                      )),
                                  const Text(
                                    "Notifications",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                            leading: Container(
                              child: const Icon(Icons.person_add_alt_1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.grey[200]),
                              padding: const EdgeInsets.all(7),
                            ),
                            title: const Text("New Group DM")),
                        Expanded(
                          child: Container(
                            color: Colors.grey[100],
                            child: ListView(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Text(
                                    'MEMBERS - 2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ),
                                ...["notgr", "Mufasa"]
                                    .map((channel) => ListTile(
                                          leading: const CircleAvatar(
                                              radius: 15,
                                              foregroundImage: NetworkImage(
                                                "https://avatars.githubusercontent.com/u/5024388?v=4",
                                              )),
                                          horizontalTitleGap: 0,
                                          title: Text(channel),
                                          onTap: () {
                                          },
                                        )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
