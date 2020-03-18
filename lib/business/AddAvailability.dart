import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstartup/business/addAvailabilityAction.dart';
import 'package:intl/intl.dart';
import 'DashboardBusiness.dart';

class AddAvailability extends StatefulWidget {
  static const String id = "addAvailability";
  @override
  _AddAvailabilityState createState() => _AddAvailabilityState();
}

class _AddAvailabilityState extends State<AddAvailability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Availability"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: CupertinoColors.tertiarySystemBackground,
      body: new SingleChildScrollView(
        child: TimePicker(),
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  bool switchValue = false;
  bool lights = false;

  // Value that is shown in the date picker in time mode.
//  DateTime time = DateTime.now();
  bool work1 = false;
  DateTime start_time1 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time1 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work2 = false;
  DateTime start_time2 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time2 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work3 = false;
  DateTime start_time3 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time3 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work4 = false;
  DateTime start_time4 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time4 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work5 = false;
  DateTime start_time5 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time5 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work6 = false;
  DateTime start_time6 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time6 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  bool work7 = false;
  DateTime start_time7 = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime end_time7 = DateTime.utc(2020, 1, 1, 18, 0, 0);

  @override
  Widget build(BuildContext context) {
//    print(time);
    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
              bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
            ),
          ),
          child: ListTile(
            title: Text('Monday'),
            trailing: CupertinoSwitch(
              value: work1,
              onChanged: (bool value) {
                setState(() {
                  work1 = value;
                  print(work1);
                });
              },
            ),
            onTap: () {
//              setState(() {
//                work1 = !work1;
//              });
            },
          ),
        ),
        Visibility(
          visible: work1,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time1,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time1 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time1),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time1,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time1 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time1),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Tuesday'),
            trailing: CupertinoSwitch(
              value: work2,
              onChanged: (bool value) {
                setState(() {
                  work2 = value;
                  print(work2);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work2 = !work2;
//            });
            },
          ),
        ),
        Visibility(
          visible: work2,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time2,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time2 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time2),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time2,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time2 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time2),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Wednesday'),
            trailing: CupertinoSwitch(
              value: work3,
              onChanged: (bool value) {
                setState(() {
                  work3 = value;
                  print(work3);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work3 = !work3;
//            });
            },
          ),
        ),
        Visibility(
          visible: work3,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time3,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time3 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time3),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time3,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time3 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time3),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Thursday'),
            trailing: CupertinoSwitch(
              value: work4,
              onChanged: (bool value) {
                setState(() {
                  work4 = value;
                  print(work4);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work4 = !work4;
//            });
            },
          ),
        ),
        Visibility(
          visible: work4,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time4,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time4 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time4),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time4,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time4 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time4),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Friday'),
            trailing: CupertinoSwitch(
              value: work5,
              onChanged: (bool value) {
                setState(() {
                  work5 = value;
                  print(work5);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work5 = !work5;
//            });
            },
          ),
        ),
        Visibility(
          visible: work5,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time5,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time5 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time5),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time5,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time5 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time5),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Saturday'),
            trailing: CupertinoSwitch(
              value: work6,
              onChanged: (bool value) {
                setState(() {
                  work6 = value;
                  print(work6);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work6 = !work6;
//            });
            },
          ),
        ),
        Visibility(
          visible: work6,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time6,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time6 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time6),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time6,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time6 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time6),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: CupertinoColors.inactiveGray, width: 10),
              bottom:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 10),
            ),
          ),
          child: ListTile(
            title: Text('Sunday'),
            trailing: CupertinoSwitch(
              value: work7,
              onChanged: (bool value) {
                setState(() {
                  work7 = value;
                  print(work7);
                });
              },
            ),
            onTap: () {
//            setState(() {
//              work7 = !work7;
//            });
            },
          ),
        ),
        Visibility(
          visible: work7,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: start_time7,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => start_time7 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(start_time7),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (context) {
                            return _BottomPicker(
                              child: CupertinoDatePicker(
                                backgroundColor: CupertinoColors
                                    .systemBackground
                                    .resolveFrom(context),
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: end_time7,
                                onDateTimeChanged: (newDateTime) {
                                  setState(() => end_time7 = newDateTime);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: _Menu(
                        children: [
                          Text(
                            "to",
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          Text(
                            DateFormat.jm().format(end_time7),
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        CupertinoButton.filled(
            child: Text("Save"),
            onPressed: () {
              secondFunction() async {
                await addAvailability(
                  work1,
                  work2,
                  work3,
                  work4,
                  work5,
                  work6,
                  work7,
                  DateFormat.jm().format(start_time1),
                  DateFormat.jm().format(end_time1),
                  DateFormat.jm().format(start_time2),
                  DateFormat.jm().format(end_time2),
                  DateFormat.jm().format(start_time3),
                  DateFormat.jm().format(end_time3),
                  DateFormat.jm().format(start_time4),
                  DateFormat.jm().format(end_time4),
                  DateFormat.jm().format(start_time5),
                  DateFormat.jm().format(end_time5),
                  DateFormat.jm().format(start_time6),
                  DateFormat.jm().format(end_time6),
                  DateFormat.jm().format(start_time7),
                  DateFormat.jm().format(end_time7),
                );
                Navigator.pushNamed(context, DashboardBusiness.id);
              }

              secondFunction();
            }),
      ],
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key key,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          right: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          left: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}
