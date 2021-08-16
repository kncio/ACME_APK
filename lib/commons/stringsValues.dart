//Google Maps api key
const String g_key = "AIzaSyDD0L5j6Z_ToXMSgLmMpu2dQdpcexLH1wA";

//Database Name string
const String dbName = "acmeDB.db";
//Create string for database
const String createTicketTable =
    'CREATE TABLE tickets(id INTEGER PRIMARY KEY, customerInfo TEXT, jobSiteAddress TEXT, distance TEXT, dispatchNote TEXT, scheduledFor TEXT, deptClass TEXT, serviceType TEXT, reasonForCall TEXT, ticketNumber TEXT)';

const String appTagName = "ACME";
const String splashHeader = "ACME INC Android App Test 2019";
const String userName = "User Name";
const String password = "Your Password";
const String loginErrorString = "Your username or password ara incorrect.";
const String customerInfoLabelString = "Customer Info:";
const String scheduledForLabelString = "Scheduled For:";
const String jobSiteAddressLabelString = "Job Site Address:";
const String distanceLabelString = "Distance";
const String dispatchNoteLabelString = "Dispach Note";
const String text1String =
    "\$89 Diagnostic Fee \n\nAir Handler Horizontal in the Atic, Condenser in back yard Unit turns on and blows warm air.\n\nProblem started at 2 days ago and have never had an issue with unit.";
