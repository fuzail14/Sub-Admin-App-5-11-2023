
class Api {

  static const String imageBaseUrl='http://192.168.2.45:8080/storage/';
  static const String baseUrl = 'http://192.168.2.45:8080/api/';

  static const String login = baseUrl + "login";
  static const String fcmtokenrefresh = baseUrl + "fcmtokenrefresh";
  static const String register_resident = baseUrl + "registerresident";
  static const String view_residents = baseUrl + "viewresidents";
  static const String delete_resident = baseUrl + "deleteresident";
  static const String search_residents = baseUrl + "searchresident";
  static const String update_residents = baseUrl + "updateresident";
  static const String register_gatekeeper = baseUrl + "registergatekeeper";
  static const String view_gatekeepers = baseUrl + "viewgatekeepers";
  static const String delete_gatekeeper = baseUrl + "deletegatekeeper";
  static const String update_gatekeeper = baseUrl + "updategatekeeper";
  static const String add_event_images = baseUrl + "event/addeventimages";
  static const String add_event = baseUrl + "event/addevent";
  static const String update_event = baseUrl + "event/updateevent";
  static const String events = baseUrl + "event/events";
  static const String searchevent = baseUrl + "event/searchevent";
  static const String delete_event = baseUrl + "event/deleteevent";
  static const String addnoticeboarddetail = baseUrl + "addnoticeboarddetail";
  static const String viewallnoticesapi = baseUrl + "viewallnotices";
  static const String deletenotice = baseUrl + "deletenotice";
  static const String updatenotice = baseUrl + "updatenotice";
  static const String reportedresidents = baseUrl + "reportedresidents";
  static const String reports = baseUrl + "reports";
  static const String pendingreports = baseUrl + "pendingreports";
  static const String updatereportstatus = baseUrl + "updatereportstatus";
  static const String historyreportedresidents =
      baseUrl + "historyreportedresidents";
  static const String historyreports = baseUrl + "historyreports";
  static const String addphases = baseUrl + "addphases";
  static const String addfloors = baseUrl + "addfloors";

  static const String phases = baseUrl + "phases";
  static const String floors = baseUrl + "floors";

  static const String blocks = baseUrl + "blocks";
  static const String apartments = baseUrl + "apartments";

  static const String streets = baseUrl + "streets";
  static const String addblocks = baseUrl + "addblocks";
  static const String addapartments = baseUrl + "addapartments";

  static const String addstreets = baseUrl + "addstreets";
  static const String addproperties = baseUrl + "addproperties";
  static const String properties = baseUrl + "properties";

  static const String viewsociety = baseUrl + "society/viewsociety";

  static const String unverifiedresident = baseUrl + "unverifiedresident";
  static const String unverifiedresidentcount =
      baseUrl + "unverifiedresidentcount";
  static const String verifyresident = baseUrl + "verifyresident";

  static const String societybuildings = baseUrl + "societybuildings";
  static const String addsocietybuilding = baseUrl + "addsocietybuilding";
  static const String viewsocietybuildingfloors =
      baseUrl + "viewsocietybuildingfloors";
  static const String addsocietybuildingfloors =
      baseUrl + "addsocietybuildingfloors";

  static const String viewsocietybuildingapartments =
      baseUrl + "viewsocietybuildingapartments";

  static const String addsocietybuildingapartments =
      baseUrl + "addsocietybuildingapartments";

  static const String addmeasurement = baseUrl + "addmeasurement";
  static const String housesapartmentmeasurements =
      baseUrl + "housesapartmentmeasurements";

  /*    */
  static const String view_all_societies =
      baseUrl + "society/viewsocietiesforresidents";
  static const String view_all_phases = baseUrl + "viewphasesforresidents";
  static const String view_all_blocks = baseUrl + "viewblocksforresidents";
  static const String view_all_streets = baseUrl + "viewstreetsforresidents";
  static const String view_properties_for_residents =
      baseUrl + "viewpropertiesforresidents";

  static const String view_society_api = baseUrl + "society/viewsociety";
  static const String generatebill = baseUrl + "generatebill";
  static const String generatedbill = baseUrl + "generatedbill";
  static const String verifyhouseresident = baseUrl + "verifyhouseresident";
  static const String verifyapartmentresident = baseUrl + "verifyapartmentresident";
  static const String unverifiedapartmentresident = baseUrl + "unverifiedapartmentresident";
  static const String unverifiedhouseresident = baseUrl + "unverifiedhouseresident";
  static const String resetpassword = baseUrl + "resetpassword";

  static const String view_local_building_floors =
      baseUrl + "viewlocalbuildingfloors";
  static const String add_local_building_floors =
      baseUrl + "addlocalbuildingfloors";
      static const String view_local_building_apartments =
      baseUrl + "viewlocalbuildingapartments";
 static const String add_local_building_apartments =
      baseUrl + "addlocalbuildingapartments";

  static const String allsocietybuildings = baseUrl + "allsocietybuildings";
  static const String verifylocalbuildingapartmentresident = baseUrl + "verifylocalbuildingapartmentresident";
  static const String unverifiedlocalbuildingapartmentresident = baseUrl + "unverifiedlocalbuildingapartmentresident";



}
