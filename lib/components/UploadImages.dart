
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/utils/Colors.dart';
import '../models/AppUser.dart';
import '../utils/Constants.dart';
import '../utils/Language.dart';

class UploadImages extends StatefulWidget {
  dynamic? api;
  Function? getImages,removePicture,getExistingImages;
  void clearImages() {
    UploadImagesState().clearImages();
  }
  UploadImages({this.api=null,this.getImages=null,this.removePicture=null,this.getExistingImages=null});
  @override
  State<UploadImages> createState() => UploadImagesState();
}

class UploadImagesState extends State<UploadImages>
{
  late dynamic appUser;
  String? buildPopupDialogTitle = LANGUAGE[0]["uploading"]!;
  late Widget WidgetImagesList = widgetImagesList();
  List<String> images = [];
  final ImagePicker picker = ImagePicker();
  final ScrollController _scrollController = new ScrollController();
  XFile? image;
  dynamic uploadedImages = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserID();
    setData();
  }

  clearImages()
  {
      print(LANGUAGE[0]["clearing_selected_images"]!);
      images.clear();
      if(mounted)
        {
          setState(() {
            WidgetImagesList = widgetImagesList();
          });
        }
  }

  getUserID()
  async {
    print(LANGUAGE[0]["getting_user_id_from_session"]!);
    appUser = await getUserSession();
  }

  Future getImage(ImageSource media) async {

    image = await picker.pickImage(source: media);
    image?.readAsBytes().then((value) => {
        showToast(LANGUAGE[0]["uploading"]!),
        setState((){
          uploadedImages=value;
        }),
        // uploadPicture(base64Encode(value))
    });
  }
  Widget build(BuildContext context)
  {
    return Container(
      width: (MediaQuery.of(context).size.width),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        GestureDetector(
          onTap: (){
            getImage(ImageSource.gallery);
          },
          child: Container(
              margin: EdgeInsets.only(left: 0,top: 5 , bottom: 5),
              padding: EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    offset: Offset(0, 0), // Shadow position
                  ),

                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload),Text(LANGUAGE[0]["upload_image"]!,style: TextStyle(fontSize: 16),),
                ],

              )
          ),
        ),
          WidgetImagesList
        ],
      ),
    );
  }

  Widget widgetImagesList()
  {
    return images.length > 0 ? Container(
      width : (MediaQuery.of(context).size.width),
      height : 170,
      margin: EdgeInsets.all(2),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 0), // Shadow position
          ),

        ],
      ),
      child:GestureDetector(
        onTap: (){
          showToast(LANGUAGE[0]["removing_item"]!);
          setState(() {
            WidgetImagesList = widgetImagesList();
            buildPopupDialogTitle = LANGUAGE[0]["removing_item"];
          });
          widget.removePicture!(images[0], 0).then((value) => {
            if(value.statusCode == CODE_SERVER_SUCCESS)
              {
                updateImagesList(0),
                showToast(LANGUAGE[0]["item_remove"]!),
              },
          });
        },
        child:images[0] == ""? buildPopupDialog(buildPopupDialogTitle!) : Image.network(
          DOMAIN_URL+images[0],
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    ) :
    Container(
      padding: EdgeInsets.all(3),

      decoration: BoxDecoration(
          color: PrimaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child:
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(DOMAIN_URL+URL_PLACEHOLDER_SERVICE_IMAGES,
          width : (MediaQuery.of(context).size.width),
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ),
      ),
    );
  }
  setImageList(value){
    if(mounted)
      {
        setState(() {
          images.add(value);
          buildPopupDialogTitle = LANGUAGE[0]["uploading"];
          WidgetImagesList = widgetImagesList();
        });
        widget.getImages!(images);
      }
    if((_scrollController.hasClients))
      {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      }
  }

  void setData() {

    if(widget.getExistingImages == null)
      {
        return;
      }
    if(widget.getExistingImages!()[0].toString().contains("item_service_placeholder.png"))
      {
        return;
      }
    for(int i=0;i<widget.getExistingImages!().length;i++)
    {
      print(widget.getExistingImages!()[i]);
      setImageList(widget.getExistingImages!()[i]);
    }

  }


  uploadPicture(base64) {

      setImageList("");
      String url = BASE_URL+appUser.id.toString()+URL_UPLOAD_IMAGE;
      Map<String , String> body =
      {
        'type': "service",
        'base64_string': base64,
      };
      print("Url upload service images");
      print(url);

      widget.api.POST(url, body).then((value) => {
         print("status code:upload image"),
         print(value.statusCode),
         if(value.statusCode == SUCCESS)
           {
              images.removeLast(),
              setImageList(json.decode(value.body)["path"])
           }
         else 
           {
              showToast(LANGUAGE[0][value.statusCode.toString()]! + ":" + LANGUAGE[0]["desc_"+value.statusCode.toString()]!)
           }
      });
  }

  updateImagesList(index) {
    setState(() {
      images.removeAt(index);
      WidgetImagesList = widgetImagesList();
    });
  }
}
