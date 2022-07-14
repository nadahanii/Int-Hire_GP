import 'package:history_feature/models/job.dart';
import 'package:history_feature/models/applicant_user.dart';

class UserPreferences {
  static final myUser = ApplicantUser
    (
     name: 'Magda Osama',
    email: 'magdausama@yahoo.com',
    password: 'Helloworld9@',
    twitterUsername: 'magdausama74',
    phoneNumber: '01159502557',
    isMale: false,
    birthDay: '8/13/2000',
    educationLevel: Education.Bachelors,
    militaryStatus: MilitaryStatus.Postponed,
    street: "ahmed orabi",
    city: 'giza',
    country: 'egypt',
    tags: ['hi' , 'hello']

  );
}