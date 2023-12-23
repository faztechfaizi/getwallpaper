import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/drawerscreen.dart';


class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/fazwall.png',
          width: size.width * 0.45,
        ),

      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            children: [
              TextSpan(
                  text: '''[FazWall] ("we," "us," or "our") operates the Wallpaper App ("App"). This Privacy Policy outlines the information we collect, how we use and protect it, and your choices regarding your information. By using the App, you consent to the practices described in this Privacy Policy.,\n ''',
                  style:TextStyle(fontFamily: 'SubFont') ),
            TextSpan(text: '\nInformation We Collect \n',style: TextStyle(
              fontSize: 20,fontFamily: 'MainFont'
            )),
              TextSpan(
                text: '''\n1.1 Personal Information: We do not collect any personally identifiable information ("Personal Information") about you through the App unless you voluntarily provide it to us. Personal Information may include your name, email address, or any other information you provide to us.\n''',
                style: TextStyle(fontFamily: 'SubFont')

              ),
              TextSpan(
                text: '\n1.2 Non-Personal Information: We may collect non-personal information ("Non-Personal Information") automatically when you use the App. This may include device information (such as device type, operating system version, and unique device identifier), usage information (such as the pages you view or click on), and technical information (such as your IP address, browser type, and language).\n',
                style: TextStyle(fontFamily: 'SubFont'),
              ),
              TextSpan(
                text: '\nUse of Information\n',style: TextStyle(
                fontFamily: 'MainFont',fontSize: 20
              )
              ),
              TextSpan(
                text: '\n2.1 Personal Information: We may use your Personal Information to respond to your inquiries, provide you with information or services you request, and personalize your experience with the App.\n',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              ),
              TextSpan(
                text: '\n2.2 Non-Personal Information: We may use Non-Personal Information for analytical purposes, to improve the App, and to enhance our services. This information helps us understand how users interact with the App and allows us to make improvements to provide a better user experience.\n',
                style: TextStyle(fontFamily: 'SubFont')
              ),
              TextSpan(
                text: '\nData Sharing and Disclosure\n',
                style: TextStyle(
                  fontFamily: 'MainFont',fontSize: 20
                )
              ),
              TextSpan(
                text: '\n3.1 Third-Party Service Providers: We may engage third-party service providers to perform certain functions on our behalf, such as hosting the App, analyzing data, and providing customer support. These service providers may have access to your information but are only authorized to use it to perform their designated functions.\n',
                style: TextStyle(fontFamily: 'SubFont')
              ),
              TextSpan(
                text: '\n3.2 Legal Requirements: We may disclose your information if required to do so by law or in the good faith belief that such action is necessary to comply with legal obligations, protect and defend our rights or property, or investigate, prevent, or take action regarding suspected illegal activities, fraud, or violations of our Terms of Service.\n',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              ),
              TextSpan(
                text: '\nData Security\n',style: TextStyle(
                fontFamily: 'MainFont',
                fontSize: 20
              )
              ),
              TextSpan(
                text: '\n We take reasonable measures to protect the information we collect from loss, misuse, unauthorized access, disclosure, alteration, or destruction. However, please be aware that no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.\n',
                style: TextStyle(
                  fontFamily: 'SubFont',
                )
              ),
              TextSpan(
                text: '\n Third-Party Links\n',
                style: TextStyle(
                  fontFamily: 'MainFont',fontSize: 20
                )
              ),
              TextSpan(
                text: '\n The App may contain links to third-party websites or services. We are not responsible for the privacy practices or the content of such third-party websites or services. We encourage you to read the privacy policies of those third parties when you visit their websites or use their services.\n',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              ),
              TextSpan(
                text: '\n Childrens Privacy\n',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 20
                )
              ),
              TextSpan(
                text: '\nThe App is not intended for use by individuals under the age of 13. We do not knowingly collect Personal Information from children under 13. If you are a parent or guardian and believe that your child has provided us with Personal Information, please contact us, and we will delete such information from our systems.\n',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              ),
              TextSpan(
                text: '\nChanges to the Privacy Policy\n',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 20
                )
              ),
              TextSpan(
                text: '\nWe reserve the right to update or modify this Privacy Policy at any time. We will notify you of any material changes by posting the updated Privacy Policy within the App or through other communication channels. Your continued use of the App after any such changes indicates your acceptance of the updated Privacy Policy.\n',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              ),
              TextSpan(
                text: '\n Contact Us\n',
                style: TextStyle(
                  fontFamily: 'MainFont',
                  fontSize: 20
                )
              ),
              TextSpan(
                text: '\n If you have any questions or concerns regarding this Privacy Policy or our privacy practices, please contact us at [gearallnews@gmail.com]. Please note that this Privacy Policy applies only to the Flutter Wallpaper App and does not govern the practices of any third-party apps or services that you may use in connection with our App. By using the Wallpaper App, you acknowledge that you have read and understood this Privacy Policy.\n \n  ',
                style: TextStyle(
                  fontFamily: 'SubFont'
                )
              )


            ]


          )
        ),
      ),
    );
  }
}
