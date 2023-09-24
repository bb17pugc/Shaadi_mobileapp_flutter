import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mobile/models/AppUser.dart';
import 'package:mobile/models/DropDown.dart';
import 'package:mobile/models/Message.dart';
import 'package:mobile/models/Message.dart'as UserMessage;

final EdgeInsetsGeometry? SCREEN_PADDING = EdgeInsets.only(left: 10 , right: 10);
final dynamic? GAP = SizedBox(height: 10,);
const DIRECTION_VERTICAL = "VERTICAL";
const DIRECTION_HORIZONTAL = "HORIZONTAL";
const PLACEHOLDER_IMAGE= 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
const ADD_TO_CART  = "ADD_TO_CART";
const SHOPKEEPER_NAME = "shopkeeper name";
const CLICK_TYPE_DELETE = "delete";
const CLICK_TYPE_DELETE_YES = "Yes";
const CLICK_TYPE_DELETE_NO = "No";

const kPrimaryColor = Color(0xFFFF0606);
const Grey = Color(0xFF7A7A7A);
const LightGrey = Color(0xFFEAEAEA);
const lightYellow = Color(0xFFFFA850);

// HTTP CODES
const int CODE_SERVER_ERROR= 500;
const int CODE_PAGE_NOT_FOUND= 404;
const int CODE_SERVER_SUCCESS= 200;
const int CODE_ACCOUNT_EXPIRED= 498;
const int CODE_NULL_VALUE= 204;
const int CODE_NO_INTERNET= 12002;
const int SUCCESS=200;
const int TIME_OUT=408;
const int NOT_CONTENT_FOUND=201;

// loading constants
const String LOADING_TITLE_PLEASE_WAIT= "Please Wait...";
const String LOADING_TITLE_SERVICES= "Services are loading...!";
const String LOADING_TITLE_BOOKINGS= "Bookings are loading...!";
const String LOADING_TITLE_ORDERS= "Orders are loading...!";
const String LOADING_TITLE_CHATS= "Chats are loading...!";
const String LOADING_TITLE_PROFILE= "Profile is loading...!";
const String USER_STATUS_TYPING= "Profile is loading...!";

//request types
const GET = 'get';
const POST = 'post';

// app statuses
const ALL = -1;
const ACTIVE = 1;
const BLOCKED = 2;
const PAUSED = 3;
const DELETED = 0;

const MORNING = 5;
const AFTERNOON = 6;
const EVENING = 7;
const PER_DAY = 8;

const PENDING = 9;
const CONFIRMED = 10;
const CANCELLED = 11;
const FINISHED = 12;

const SENT = 13;
const DELIEVERED = 14;
const SEEN = 15;
const READ = 16;
const UNSUBSCRIBED = 17;

const int_MESSAGE = 18;
const int_BOOKING = 19;
const ADMIN_UPDATES = 20;

const APP_TITLE = "Mubarak";
const APP_NAME = "mubarak_foods/";
const APP_KEY= "mubarak_foods6102023903/";
const BASE_URL = DOMAIN_URL+"api/"+APP_NAME+APP_KEY;
const DOMAIN_URL = "https://evencious.com/";
const URL_PLACEHOLDER_SERVICE_IMAGES = "images/services/item_service_placeholder.png";
const URL_UPLOAD_IMAGE = "/services/upload-picture";


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width),
          child: Image.asset('assets/gif/loading.gif',
            width: 50,
            height: 50,
          ),
        )
      ],
    );

  }
}

Widget buildPopupDialog(String? title) {
  return Center(
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(""),
          Text(title!),
        ],
      )
  );
}

Widget ddlText(dynamic? object) {
  return Text(object.name.toString());
}


setUserSession(user)
async {
  AppUser appUser = AppUser(
    id: int.parse(user["id"].toString()),
    first_name: user["first_name"],
    last_name: user["last_name"],
    email: user["email"],
    phone_number_1:user["phone_number_1"],
    image: user["image"],
    username: user["username"],
    password: user["password"],
    phone_number_2: user["phone_number_2"],
    address_line: user["address_line"],
    country: user["country"],
    user_city: user["user_city"],
    category: user["category"],
    status: int.parse(user["status"].toString()),
    role: user["role"],
    created_at: user["created_at"],
    updated_at: user["updated_at"],
    unsubscribe_at: user["unsubscribe_at"],
  );
  print("saving user to session...");
  return await SessionManager().set("user",appUser);
}
isLoggedIn()
async {

  try {
    AppUser user = AppUser.fromJson(await SessionManager().get("user"));
    return true;
  } on Exception catch (exception) {
    print("null value found");
  } catch (error) {
    return false;
  }
}

getUser()
async {
  print("getting user id from session");
  dynamic appUser = await getUserSession();
  return appUser;
}

Future<AppUser> getUserSession()
async {
  try
  {
    AppUser user = AppUser.fromJson(await SessionManager().get("user"));
    return user;
  }
  catch (e)
  {

  }
  return getUserInstance();
}

clearUserSession()
async {
  return await SessionManager().remove("user");
}

enum PermissionGroup {
  locationAlways,
  locationWhenInUse
}

getUserAddress(double Lat , double Lng) async {//call this async method from whereever you need
  print("lat for address,${Lat.toString()}");
  List<Placemark> placemarks = await placemarkFromCoordinates(Lat, Lng);
  return placemarks;
}

showToast(String message)
{
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
UserMessage.Message getMessageInstance(){
  return UserMessage.Message(
    id: 0,
    conversation_id: "",
    description : "",
    sent_by : getUserInstance(),
    sent_to : getUserInstance(),
    status: "-1",
    created_at: "",
    message_id: "",
    booking_id: 0,
  );
}
AppUser getUserInstance({name=""}){
  return AppUser(
      id: 0,
      first_name: name,
      last_name: name,
      email: "n/a",
      phone_number_1: "n/a",
      image: "n/a",
      username:  "n/a",
      password: "n/a",
      phone_number_2: "n/a",
      address_line: "n/a",
      user_city: "n/a",
      country: "n/a",
      status: UNSUBSCRIBED,
      role: "n/a",
      category: "n/a",
      created_at: "2023-01-01",
      updated_at: "2023-01-01",
      unsubscribe_at: "2023-01-01"
  );
}

getProposalFilters()  {//call this async method from whereever you need
  return [
    "All",
    "Recieved",
    "Sent",
    "Connected"
  ];
}

getGenders()  {//call this async method from whereever you need
  return [
    DropDown.fromJson({"id":0 , "name" : "Male"}),
    DropDown.fromJson({"id":1 , "name" : "Femal"}),
  ];
}

getRelegion()
{
  return [
    DropDown.fromJson({"id":0 , "name" : "Islam"}),
    DropDown.fromJson({"id":1 , "name" : "Cristian"}),
    DropDown.fromJson({"id": 2, "name" : "Jews"}),
  ];
}
getHouseStatuses()
{
  return [
    DropDown.fromJson({"id":0 , "name" : "Own house"}),
    DropDown.fromJson({"id":1 , "name" : "Rent"}),
    DropDown.fromJson({"id": 2, "name" : "Shared with joint family"}),
    DropDown.fromJson({"id": 3, "name" : "Government"}),
    DropDown.fromJson({"id": 4, "name" : "Private Company"}),
  ];
}

getIncomeType()
{
  return [
    DropDown.fromJson({"id":0 , "name" : "daily wages"}),
    DropDown.fromJson({"id":1 , "name" : "monthly"}),
    DropDown.fromJson({"id": 2, "name" : "yearly (if you are business man)"}),
  ];
}
getMotherLanguage()
{
  return [
    DropDown.fromJson({"id":0 , "name" : "Urdu"}),
    DropDown.fromJson({"id":1 , "name" : "English"}),
    DropDown.fromJson({"id": 2, "name" : "Sindhi"}),
    DropDown.fromJson({"id": 3, "name" : "Punjabi"}),
    DropDown.fromJson({"id": 4, "name" : "Balochi"}),
  ];
}
getMaritalstatus()
{
  return [
    DropDown.fromJson({"id":0 , "name" : "Married"}),
    DropDown.fromJson({"id":1 , "name" : "Single"}),
    DropDown.fromJson({"id":2 , "name" : "Devorced"}),
  ];
}

getParentsStatus()  {//call this async method from whereever you need
  return [
    DropDown.fromJson({"id":0 , "name" : "Alive"}),
    DropDown.fromJson({"id":1 , "name" : "Passed away"}),
    DropDown.fromJson({"id":2 , "name" : "Divorced"}),
  ];
}


// start animation when next page opens

