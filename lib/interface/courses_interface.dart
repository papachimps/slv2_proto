import 'package:flutter/material.dart';

import '../models/course.dart';
import '../models/module.dart';

import '../services/networkService.dart';

class CoursesInterface extends NetworkService {
  static const String coursesUrl =
      'https://captibase.firebaseio.com/slv2/courses.json';
}

var course1 = Course(
    id: "Empathy - CE",
    title: "Empathy - CE",
    description:
        "This module describes what empathy is and how it can aid your personal & professional growth.",
    categoryId: "Communication",
    lastUpdatedAt: DateTime.parse("2020-01-17 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=1",
    modules: [
      Module(
          id: "m1",
          title: "GetX SM video",
          moduleUrl: "https://www.youtube.com/watch?v=apPH1CCOtKQ",
          description: "Module1 Description",
          lastUpdatedAt: DateTime.parse("2020-01-17 00:00:00.000"),
          orientation: Orientation.landscape,
          courseId: "Empathy - CE",
          moduleType: ModuleType.Web,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 10),
      Module(
          id: "m2",
          title: "CMD desk",
          moduleUrl: "https://spicemilestones.web.app/cmd_desk.html",
          description: "Cmd ke desk se sidha prasaran",
          lastUpdatedAt: DateTime.parse("2020-11-17 00:00:00.000"),
          orientation: Orientation.portrait,
          courseId: "Empathy - CE",
          moduleType: ModuleType.Web,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 20),
      Module(
          id: "m3",
          title: "Captain Spice SMS",
          moduleUrl: "https://spicemilestones.web.app/sms_hero/",
          description: "Captain Spice ki rochak kathaye",
          lastUpdatedAt: DateTime.parse("2020-05-17 00:00:00.000"),
          orientation: Orientation.portrait,
          courseId: "Empathy - CE",
          moduleType: ModuleType.Web,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 15),
    ]);

var course2 = Course(
    id: "Beat the Heat",
    title: "Beat the Heat: Cool Summer Tips - CE",
    description:
        "Simple DIY tips to stay cool and healthy in this summer heat.",
    categoryId: "Wellness",
    lastUpdatedAt: DateTime.parse("2021-12-02 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=1",
    modules: [
      Module(
        id: "Make your makeup last longer",
        title: "Make your makeup last longer",
        moduleUrl:
            "https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fvideos%2FMake%20your%20makeup%20last%20longer.mp4?alt=media&token=1e391517-5c95-4653-9733-988712f5563e",
        description:
            "Random long Description which I have no idea of but am writing just to see how it looks",
        lastUpdatedAt: DateTime.parse("2020-11-20 00:00:00.000"),
        orientation: Orientation.landscape,
        courseId: "Beat the Heat",
        moduleType: ModuleType.Video,
        completionStatus: ModuleCompletionStatus.Pending,
        maxScorable: 10,
      ),
      Module(
          id: "The Perfect Winter Care",
          title: "The Perfect Winter Care",
          moduleUrl:
              "https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fvideos%2FThe%20Perfect%20Winter%20Care.mp4?alt=media&token=c7c6d41d-e0b4-4f90-8811-285dd3298377",
          description: "Module2 Description",
          lastUpdatedAt: DateTime.parse("2020-11-17 00:00:00.000"),
          orientation: Orientation.landscape,
          courseId: "Beat the Heat",
          moduleType: ModuleType.Video,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 10),
      Module(
        id: "Fun Facts about Aircrafts - Part I",
        title: "Fun Facts about Aircrafts - Part I",
        moduleUrl:
            "https://captibase.web.app/Fun%20Facts%20about%20Aircrafts%20-%20Part%20I/index_scorm.html",
        description: "Module3 Description",
        lastUpdatedAt: DateTime.parse("2020-05-17 00:00:00.000"),
        orientation: Orientation.portrait,
        courseId: "Beat the Heat",
        moduleType: ModuleType.Interactive,
        completionStatus: ModuleCompletionStatus.Pending,
        maxScorable: 25,
      ),
    ]);

var course3 = Course(
    id: "Multi Quizer",
    title: "Multi Quizer Assessment",
    description:
        "Multi Quiz Assessment based on Part of Speech in different quizzing format. Somw more gibberish to fill the description.",
    categoryId: "Wellness",
    lastUpdatedAt: DateTime.parse("2021-06-10 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=26",
    modules: [
      Module(
        id: "m1",
        title: "Multi Quiz Assessment",
        moduleUrl: "https://captibase.web.app/Multi_Quiz/?id=test21",
        description:
            "Random long Description which I have no idea of but am writing just to see how it looks",
        lastUpdatedAt: DateTime.parse("2020-11-20 00:00:00.000"),
        orientation: Orientation.portrait,
        courseId: "Multi Quizer",
        moduleType: ModuleType.Interactive,
        completionStatus: ModuleCompletionStatus.Pending,
        maxScorable: 30,
      ),
    ]);

var course4 = Course(
    id: "Dell Module",
    title: "Dell Module",
    description:
        "Dell Module Assessment based on Part of Speech in different quizzing format. Somw more gibberish to fill the description.",
    categoryId: "Wellness",
    lastUpdatedAt: DateTime.parse("2021-03-21 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=153",
    modules: [
      Module(
        id: "Multi Quiz Assessment",
        title: "Multi Quiz Assessment",
        moduleUrl: "https://captibase.web.app/dell_mod2",
        description:
            "Random long Description which I have no idea of but am writing just to see how it looks",
        lastUpdatedAt: DateTime.parse(
          "2020-11-20 00:00:00.000",
        ),
        orientation: Orientation.landscape,
        courseId: "Dell Module",
        moduleType: ModuleType.Interactive,
        completionStatus: ModuleCompletionStatus.Pending,
        maxScorable: 20,
      ),
    ]);

var course5 = Course(
    id: "Acts of Kindness",
    title: "Acts of Kindness",
    description:
        "Acts of Kindness done by random people to random poeople and posted on social media for self righteous portrayable.",
    categoryId: "Communication",
    lastUpdatedAt: DateTime.parse("2020-05-05 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=15",
    completionStatus: CourseCompletionStatus.Pending,
    isCourseBookMarked: true,
    modules: [
      Module(
        id: "m1",
        title: "Acts of Kindness",
        moduleUrl: "https://captibase.web.app/AOK/aok.mp4",
        description:
            "Random long Description which I have no idea of but am writing just to see how it looks",
        lastUpdatedAt: DateTime.parse("2021-06-12 00:00:00.000"),
        orientation: Orientation.landscape,
        courseId: "Acts of Kindness",
        moduleType: ModuleType.Video,
        completionStatus: ModuleCompletionStatus.Pending,
        maxScorable: 10,
      ),
    ]);

var course6 = Course(
    id: "Safety Enroute - SpiceJet Safety Journal",
    title: "Safety Enroute - SpiceJet Safety Journal",
    description:
        "Multi Quiz Assessment based on Part of Speech in different quizzing format. Somw more gibberish to fill the description.",
    categoryId: "Wellness",
    lastUpdatedAt: DateTime.parse("2020-09-01 00:00:00.000"),
    imgUrl: "https://picsum.photos/600/400?random=1",
    modules: [
      Module(
          id: "Edition 1",
          title: "Edition 1: Feb 2021",
          moduleUrl:
              "https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fdocs%2FSafety%20Enroute%20-%20SpiceJet%20Safety%20Journal%2FSafety%20Enroute%20-%20SpiceJet%20Safety%20Journal%20ED%201%20FEB-21.pdf?alt=media&token=a8d264f9-41af-45b2-9fa4-3d96b2c9583f",
          description:
              "Random long Description which I have no idea of but am writing just to see how it looks",
          lastUpdatedAt: DateTime.parse("2020-11-20 00:00:00.000"),
          orientation: Orientation.portrait,
          courseId: "Safety Enroute - SpiceJet Safety Journal",
          moduleType: ModuleType.Doc,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 15),
      Module(
          id: "Edition 2",
          title: "Edition 2: March 2021",
          moduleUrl:
              "https://firebasestorage.googleapis.com/v0/b/spicemilestones.appspot.com/o/ModuleContents%2Fdocs%2FSafety%20Enroute%20-%20SpiceJet%20Safety%20Journal%2FSafety%20Enroute%20-%20SpiceJet%20Safety%20Journal%20ED%202%20MAR-21.pdf?alt=media&token=56bab086-39a2-4575-b8ba-5f97d52335f1",
          description:
              "Random long Description which I have no idea of but am writing just to see how it looks",
          lastUpdatedAt: DateTime.parse("2020-11-20 00:00:00.000"),
          orientation: Orientation.portrait,
          courseId: "Safety Enroute - SpiceJet Safety Journal",
          moduleType: ModuleType.Doc,
          completionStatus: ModuleCompletionStatus.Pending,
          maxScorable: 10),
    ]);
