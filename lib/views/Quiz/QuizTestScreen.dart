import 'package:flutter/material.dart';
import 'package:quiz_app/models/Quiz.dart';

class QuizTestScreen extends StatefulWidget {
  final Quiz quiz;
  QuizTestScreen({this.quiz});
  @override
  _QuizTestScreenState createState() => _QuizTestScreenState();
}

class _QuizTestScreenState extends State<QuizTestScreen> {
  bool readyTap = false;
  bool endTap = false;
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;
  Quiz quiz;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    quiz = widget.quiz;
    print(quiz.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: endTap ? endCard() : (readyTap ? questionCard() : infoCard()),
    );
  }

  Widget questionCard() {
    return PageView.builder(
      controller: _pageController,
      itemCount: quiz.questions.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.lightBlue.shade100.withOpacity(0.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlue.shade400,
                      Colors.lightBlue.shade300,
                      Colors.lightBlue.shade200
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(
                                    color: Color(0xFFFFFFFF).withOpacity(0.6),
                                    width: 4)),
                            child: Center(
                              child: Text(
                                "${index + 1}/10",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text(
                            "${quiz.name}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 28,
                              ),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Text(
                        "${quiz.questions[index].description}",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  offset: Offset(1, 1),
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 0.1),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          height: 60,
                          minWidth: 150,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: option1 ? Colors.greenAccent : Colors.white,
                          child: Text(
                            "${quiz.questions[index].options[0]}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color:
                                        option1 ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              option1 = true;
                              option2 = false;
                              option3 = false;
                              option4 = false;
                            });
                          },
                        ),
                        SizedBox(width: 20),
                        MaterialButton(
                          height: 60,
                          minWidth: 150,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: option2 ? Colors.greenAccent : Colors.white,
                          child: Text(
                            "${quiz.questions[index].options[1]}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color:
                                        option2 ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              option1 = false;
                              option2 = true;
                              option3 = false;
                              option4 = false;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            height: 60,
                            minWidth: 150,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: option3 ? Colors.greenAccent : Colors.white,
                            child: Text(
                              "${quiz.questions[index].options[2]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color:
                                          option3 ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                option1 = false;
                                option2 = false;
                                option3 = true;
                                option4 = false;
                              });
                            }),
                        SizedBox(width: 20),
                        MaterialButton(
                            height: 60,
                            minWidth: 150,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: option4 ? Colors.greenAccent : Colors.white,
                            child: Text(
                              "${quiz.questions[index].options[3]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color:
                                          option4 ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                option1 = false;
                                option2 = false;
                                option3 = false;
                                option4 = true;
                              });
                            }),
                      ],
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                        height: 45,
                        minWidth: 180,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.lightBlue.shade300,
                        child: Text(
                          "Next",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            //save data and close
                            option1 = false;
                            option2 = false;
                            option3 = false;
                            option4 = false;
                          });
                          _pageController.animateToPage(index + 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget infoCard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade400,
                Colors.lightBlue.shade300,
                Colors.lightBlue.shade200
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/label.png",
                height: 120,
              ),
              SizedBox(height: 12),
              Text(
                "Reward: Rs ${quiz.reward}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22),
              Text(
                "${quiz.name}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_clock,
                    color: Colors.white,
                  ),
                  Text(
                    "${quiz.slot}",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text(
                  "No of Questions",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "${quiz.questions.length}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Time Limit",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "${quiz.minutes} min ${quiz.seconds} Sec",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 28),
              MaterialButton(
                  height: 45,
                  minWidth: 180,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.greenAccent,
                  child: Text(
                    "Start",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      readyTap = true;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget endCard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade400,
                Colors.lightBlue.shade300,
                Colors.lightBlue.shade200
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/label.png",
                height: 120,
              ),
              SizedBox(height: 12),
              Text(
                "10 Points",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22),
              Text(
                "Regular Quiz - 1",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_clock,
                    color: Colors.white,
                  ),
                  Text(
                    "11AM - 12PM",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text(
                  "No of Questions",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "10",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Time per Question",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "10 Sec",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 28),
              MaterialButton(
                  height: 45,
                  minWidth: 180,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.greenAccent,
                  child: Text(
                    "Start",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      readyTap = true;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
