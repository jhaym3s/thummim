import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../courses/widgets/custom_progress_bar.dart';

class AchievementScreen extends StatefulWidget {
  static const routeName = "achievementScreen";
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  List<Map<String,dynamic>> engagement = [
    {"name": "Lifelong Learner",
    "description": "Log-in and learn 100 days in a row ",
    "image": AssetsImages.inactiveLifeLongLearner
    },
    {"name": "Habit Builder ",
    "description": "Log-in and learn 30 days in a row ",
    "image": AssetsImages.inactiveHabitBuilder
    },
    {"name": "Streak Starter",
    "description": "Log-in and learn 7 days in a row ",
    "image": AssetsImages.streakStarter
    },
  ];

  List<Map<String,dynamic>> learningJourney = [
    {"name": "Foundation Starter",
    "description": "Complete your first module in any course ",
    "image": AssetsImages.foundationStarter
    },
    {"name": "Foundation Builder",
    "description": "Complete your first course on Thummim.",
    "image": AssetsImages.foundationBuilder
    },
    {"name": "Knowledge Climber",
    "description": "Complete 5 courses on Thummim.",
    "image": AssetsImages.knowledgeClimber
    },
    {"name": "Mastery Seeker ",
    "description": "Complete 20 courses on Thummim.",
    "image": AssetsImages.masterySeeker
    },
  ];

  List<Map<String,dynamic>> quiz = [
    {"name": "Quiz Whiz ",
    "description": "Achieve a perfect score on 3 quizzes",
    "image": AssetsImages.quizWhiz
    },
   
  ];

  List<Map<String,dynamic>> socials = [
    {"name": "Social Spreader ",
    "description": "Share a course or webinar link ",
    "image": AssetsImages.socialSpreader
    },
    {"name": "Rate Thummium ",
    "description": "Submit an app review on your app store",
    "image": AssetsImages.rate
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F5),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        title: CustomText(
            text: "Achievement", fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpaceY(24.dy),
           AchievementTypeContainer(title: "Engagement", containerHeight: 359, achievementsTitles: engagement,),
           SpaceY(16.dy),
           AchievementTypeContainer(title: "Learning Journey", containerHeight: 466, achievementsTitles: learningJourney,),
          SpaceY(16.dy),
           AchievementTypeContainer(title: "Quizzes", containerHeight: 161, achievementsTitles: quiz,),
           SpaceY(16.dy),
           AchievementTypeContainer(title: "Feedback and Social Sharing ", containerHeight: 252, achievementsTitles: socials,),
            SpaceY(24.dy),
          ],
        ),
      ),
    );
  }
}

class AchievementTypeContainer extends StatelessWidget {
  const AchievementTypeContainer({
    super.key, required this.title, required this.containerHeight, required this.achievementsTitles
  });
  final String title;
  final double containerHeight;
  final List<Map<String,dynamic>> achievementsTitles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.dx),
      height: containerHeight.dy,
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SpaceY(16.dy),
         CustomText(text: title, fontSize: 14.sp, fontWeight: FontWeight.w400),
         Expanded(child: 
         ListView.builder(
          itemCount: achievementsTitles.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index){
          return AchievementsTile(achievementsDes: achievementsTitles[index]["description"], achievementsName: achievementsTitles[index]["name"],image: achievementsTitles[index]["image"],);
         }))
        ],
      ),
    );
  }
}

class AchievementsTile extends StatelessWidget {
  const AchievementsTile({
    super.key, required this.achievementsName, required this.achievementsDes, required this.image
  });
  final String achievementsName,achievementsDes,image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.dy, top: 16.dy),
      child: Row(
        children: [
          Image.asset(image, height: 75.dy, width: 75.dx,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: achievementsName, fontSize: 16.sp, fontWeight: FontWeight.w700),
                CustomText(text: achievementsDes, fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xff787D85),overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(text: "3/100", fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff787D85),),
              CustomProgressBar(width: 54.dx, value: 3, totalValue: 100),
            ],
          ), 
        ],
      ),
    );
  }
}