import 'package:flutter/material.dart';
import 'details_page.dart';
import 'video.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/colleges/computer.png',
    title: 'Computers and artificial intelligence ',
    details:
    'College departments :\nComputer Sciencen\nInformation Systemsn\nBasic Sciencen\nArtificial Intelligence',
    rowImages: 'images/colleges/cs.jpeg',
    pic1: 'images/colleges/cs1.jpg',
    pic2: 'images/colleges/cs2.jpg',
    pic3: 'images/colleges/cs3.jpg',
    pic4: 'images/colleges/cs4.jpg',
    pic5: 'images/colleges/cs5.jpg',
    pic6: 'images/colleges/cs6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/dentistry.png',
    title: 'Dentistry',
    details:
    'Colleges Departments : \nHisto Pathology-Dental Anatomy\nRestorative Dentistry\nOral Medicine-Periodontology\nPedodontics\nOral Surgery, Anaesthesia\nRemoval Prosthodon Tic Nobis, cumque.',
      rowImages: 'images/colleges/den.jpeg',
      pic1: 'images/colleges/den1.jpg',
      pic2: 'images/colleges/den2.jpg',
      pic3: 'images/colleges/den3.jpg',
      pic4: 'images/colleges/den4.jpg',
      pic5: 'images/colleges/den5.jpg',
      pic6: 'images/colleges/den6.jpg',

  ),
  ImageDetails(
    imagePath: 'images/colleges/engineering.png',
    title: 'Engineering',
    details:
    'Colleges Departments:\nPhysics and Mathematics Engineering \nArchitecture Engineering\nCivil Engineering\nMechanical Engineering\nElectrical Engineering',
      rowImages: 'images/colleges/eng.jpeg',
      pic1: 'images/colleges/eng1.jpg',
      pic2: 'images/colleges/eng2.jpg',
      pic3: 'images/colleges/eng3.jpg',
      pic4: 'images/colleges/eng4.jpg',
    pic5: 'images/colleges/eng5.jpg',
    pic6: 'images/colleges/eng6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/managment.png',
    title: 'Management',
    details:
    'Colleges Departments:Accounting\nEconomics\nFinancial\nManagement Information Systems\nManagement\nMarketing',
      rowImages: 'images/colleges/man.jpeg',
    pic1: 'images/colleges/man1.jpg',
    pic2: 'images/colleges/man2.jpg',
    pic3: 'images/colleges/man3.jpg',
    pic4: 'images/colleges/man4.jpg',
    pic5: 'images/colleges/man5.jpg',
    pic6: 'images/colleges/man6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/masscom.png',
    title: 'Mass Communication',
    details:
    'Colleges Departments:\nJournalism and E-Publishing Department\nRadio and Television Department\nIntegrated Marketing\n Communications Department\nNew Media Department',
      rowImages: 'images/colleges/mass.jpeg',
    pic1: 'images/colleges/mas1.jpg',
    pic2: 'images/colleges/mas2.jpg',
    pic3: 'images/colleges/mas3.jpg',
    pic4: 'images/colleges/mas4.jpg',
    pic5: 'images/colleges/mas5.jpg',
    pic6: 'images/colleges/mas6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/nursing.png',
    title: 'Nursing',
    details:
    'Colleges Departments:\nPsychiatric/Mental Health Nursing\n Medical Surgical Nursing\nMaternity & Neonatal Health Nursing\nCommunity Health Nursing\nNursing Administration\nPediatric Nursing',
      rowImages: 'images/colleges/nur.png',
    pic1: 'images/colleges/nur1.jpg',
    pic2: 'images/colleges/nur2.jpg',
    pic3: 'images/colleges/nur3.jpg',
    pic4: 'images/colleges/nur4.jpg',
    pic5: 'images/colleges/nur5.jpg',
    pic6: 'images/colleges/nur6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/pharmacy.png',
    title: 'Pharmacy',
    details:
    'Colleges Departments:\nOrganic Chemistry \nAnalytical Chemistry\n Pharmaceutical Chemistry \nPharmaceutics \nBiochemistry \nClinical Pharmacy \nPharmacognosy \nPharmacology And Toxicology\n Microbiology And Immunoloy',
      rowImages: 'images/colleges/ph.jpeg',
    pic1: 'images/colleges/ph1.jpg',
    pic2: 'images/colleges/ph2.jpg',
    pic3: 'images/colleges/ph3.jpg',
    pic4: 'images/colleges/ph4.jpg',
    pic5: 'images/colleges/ph5.jpg',
    pic6: 'images/colleges/ph6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/physical.png',
    title: 'Physical Therapy',
    details:
    'Colleges Departments:\nBasic Science \nBiomechanics \nCardiopulmonary And Geriatrics\n Neurology\n Obstetrics And Gynaecology \nOrthopedics \nPediatrics\n Surgery And Dermatology',
      rowImages: 'images/colleges/phys.jpeg',
    pic1: 'images/colleges/phys1.jpg',
    pic2: 'images/colleges/phys2.jpg',
    pic3: 'images/colleges/phys3.jpg',
    pic4: 'images/colleges/phys4.jpg',
    pic5: 'images/colleges/phys5.jpg',
    pic6: 'images/colleges/phys6.jpg',
  ),
  ImageDetails(
    imagePath: 'images/colleges/event.png',
    title: 'Alberta University Presentation',
    details:
    'Gentlemen of the faculty and the assisting body in Egyptian universities and research center Within the framework of the scholarship announcement, which was published on March 21, 2021, the Central Administration of Scholarships, in cooperation with the Egyptian Cultural Office in Canada, has the honor to host some Canadian universities (Alberta - Western - Waterloo) in seminars introducing the programs available to them and the methods of applying for them to help obtain academic approvals, noting that the seminars It will start on Tuesday, April 21 at 9 pm Cairo time',
    rowImages: 'images/colleges/mti.jpg',
    pic1: 'images/colleges/al1.jpg',
    pic2: 'images/colleges/al2.jpg',
    pic3: 'images/colleges/al3.jpg',
    pic4: 'images/colleges/al4.jpg',
    pic5: 'images/colleges/al5.jpg',
    pic6: 'images/colleges/al6.jpg',
  ),
];

class GalleryPage extends StatefulWidget {

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(

        child: Column(


          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[


            SizedBox(
              height: 20,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),

            Expanded(
              child: Container(

                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),

                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                              rowImages: _images[index].rowImages,
                              pic1: _images[index].pic1,
                              pic2: _images[index].pic2,
                              pic3: _images[index].pic3,
                              pic4: _images[index].pic4,
                              pic5: _images[index].pic5,
                              pic6: _images[index].pic6,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),

                      ),

                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: Icon(Icons.videocam),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  final String rowImages;
  final String pic1;
  final String pic2;
  final String pic3;
  final String pic4;
  final String pic5;
  final String pic6;


  ImageDetails({
    @required this.imagePath,
    @required this.title,
    @required this.details,
    @required this.rowImages,
    @required this.pic1,
    @required this.pic2,
    @required this.pic3,
    @required this.pic4,
    @required this.pic5,
    @required this.pic6,
  });
}
