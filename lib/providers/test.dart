import 'package:flutter/material.dart';
import 'package:history_feature/models/question.dart';

import 'auth.dart';

class Test with ChangeNotifier {
  List<Question> _items = [];
  late String? token;
  late String? userType;

  Test(Auth auth) {
      token = auth.token;
      userType = auth.userType;
      _items = <Question>[
        Question(
          question: "When you meet new people, do you",
          answerA: "talk as much as you listen?",
          answerB: "listen more than you talk?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "take a work - or a school - related project with you?",
          answerB: "renew relationships that are important to you?",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "think about things you need to prepare for when the vacation is over?",
          answerB: "forget about your everyday routines and concentrate on having fun?",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "see famous landmarks?",
          answerB: "spend time in museums and quieter places?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "have a good meal at a restaurant you really enjoy?",
          answerB: "explore new cuisines?",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "levelheaded",
          answerB: "idealistic",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "systematic",
          answerB: "spontaneous",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "open",
          answerB: "reflective",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "factual",
          answerB: "conceptual",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "knowledgeable",
          answerB: "understanding",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "organized",
          answerB: "adaptable",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "expansive",
          answerB: "intense",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "return to a vacation spot you love?",
          answerB: "go someplace you've never been before?",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "down - to - earth",
          answerB: "imaginative",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "deliberate",
          answerB: "enthusiastic",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "well - rounded",
          answerB: "deep",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "seasoned",
          answerB: "spirited",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "just",
          answerB: "merciful",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "goal oriented",
          answerB: "open - ended",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "straightforward",
          answerB: "reserved",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "realistic",
          answerB: "visionary",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "impartial",
          answerB: "sensitive",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Would you rather",
          answerA: "get unpleasant chores out of the way so they're off your mind?",
          answerB: "put off unpleasant chores until you're in the right mood?",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Would you rather",
          answerA: "be admired for your work, even though you're not satisfied with it yourself?",
          answerB: "create something of lasting worth, but remain unknown?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Would you rather",
          answerA: "have extensive experience in an area that pleases you?",
          answerB: "have many options to choose from?",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which word best describes the way you see yourself?",
          answerA: "questioning",
          answerB: "questing",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "spend time doing things with others?",
          answerB: "take time to read or walk or daydream alone?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "When you're on vacation, are you more likely to",
          answerA: "work out a tentative schedule of things you want to do?",
          answerB: "take things as they come, doing whatever you feel like at the moment?",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "People can count on me to be fair and to treat them with respect.",
          answerB: "People can count on me to be there when they need me.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which statement characterizes your general approach to life?",
          answerA: "Just do it.",
          answerB: "Check out the alternatives.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which do you like more about yourself?",
          answerA: "your cool - headed, logical approach?",
          answerB: "your warm, understanding approach?",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which are you better at?",
          answerA: "focusing on one task until it's done?",
          answerB: "shifting gears when necessary?",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Do you prefer a social life that includes",
          answerA: "many friends and acquaintances?",
          answerB: "a few people that you feel close to?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "When you're trying to understand something, do you",
          answerA: "press for specifics?",
          answerB: "get an overall picture and fill in the details later?",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which is more interesting to you?",
          answerA: "knowing how people think?",
          answerB: "knowing how people feel?",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "What kind of job do you like better?",
          answerA: "one that allows you to determine goals and take steps to meet them?",
          answerB: "one that allows you to react quickly and improvise?",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "If a heavy snowfall keeps you from going to school or work, do you",
          answerA: "wonder what you're missing?",
          answerB: "enjoy the unexpected time alone?",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I'm interested in people's experience - what they do, who they know.",
          answerB: "I'm interested in people's plans and dreams - where they're going, what they envision.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I'm good at making a plan that will work.",
          answerB: "I'm good at getting others to agree with a plan and cooperate in the effort.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I want to know what's likely to happen before I try something.",
          answerB: "I may try something impulsively, just to see what happens.",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I usually think on my feet, as I'm talking.",
          answerB: "I usually reflect on what I'm going to say before I say it.",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I'm almost always aware of how things look.",
          answerB: "I may not notice much about how things look - at least not right away.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I tend to be an analytical sort, maybe a little skeptical.",
          answerB: "I'm interested in people and care about what happens to them.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "Once plans have been made, I want to be able to count on them.",
          answerB: "I like to leave room for new options, even after plans have been made.",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "People who know me are generally aware of what's important to me.",
          answerB: "I don't talk about what's really important to me unless I feel close to someone.",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "If I enjoy a particular activity, I’ll engage in it frequently enough to do it well.",
          answerB: "Once an activity is familiar to me, I want to change it or try something new.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "When making a decision, I weigh the pros and cons of my choices.",
          answerB: "When I'm making a decision, I'm interested in what others have done in similar situations.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I generally learn by following instructions and adapting them to my needs.",
          answerB: "I tend to learn by experience, so I often have my own way of doing things.",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I get restless when I'm alone too long.",
          answerB: "I get restless when I don't have enough time to myself.",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I'm not much interested in ideas without some practical application.",
          answerB: "I like ideas for their own sake and enjoy playing with them in my imagination.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "When I negotiate, I depend on my knowledge and tactical skills.",
          answerB: "When I negotiate, I establish common ground with the other person.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "I would rather not be interrupted when I'm working on something.",
          answerB: "I need a break now and then when I'm working on something.",
          labelA: "J",
          labelB: "P"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "When I'm having a good time with others, I get energized and keep on going.",
          answerB: "When I'm having a good time with others, my energy runs out and I need space.",
          labelA: "E",
          labelB: "I"
        ),
        Question(
          question: "Which statement are you more likely to make?",
          answerA: "My physical surroundings are important to me and affect how I feel.",
          answerB: "Atmosphere isn't all that important to me if I like what I'm doing.",
          labelA: "S",
          labelB: "N"
        ),
        Question(
          question: "Which slogan better captures your point of view?",
          answerA: "People are apt to mistake the strength of their feeling for the strength of their argument.",
          answerB: "Logic is the art of going wrong with confidence.",
          labelA: "T",
          labelB: "F"
        ),
        Question(
          question: "Which slogan better captures your point of view?",
          answerA: "Look before you leap.",
          answerB: "He who hesitates is lost.",
          labelA: "J",
          labelB: "P"
        )
    ];
  }

  List<Question> get items {
    return [..._items];
  }
}
