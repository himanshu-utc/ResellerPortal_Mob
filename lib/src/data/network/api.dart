class Api {
  //static const BASE_URL = "http://pwavetech.com/vanyahealth/api";
  // static const BASE_URL = "https://vanyahealth.com/api";
  /* static const BASE_URL = "https://api.medyseva.com/api";
  static const IMAGE_URL = "https://api.medyseva.com/";*/

  static const BASE_URL = "http://3.7.66.101/api";
  static const IMAGE_URL = "https://3.7.66.101/";

  /* static const BASE_URL = "http://3.7.66.101/api";
  static const IMAGE_URL = "http://3.7.66.101/";*/
  static const demoApi = 'https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7';

  //Common Api's
  static const countryList = "/auth/countryList";
  static const dataArray = "/doctor/profile/dataArray";

  //auth mdoule
  static const login = "/doctor/login";
  static const registration = "/doctor/register";
  static const addKYC = "/doctor/kyc/add";
  static const addDegree = "/doctor/degree/add";
  static const tempFile = "/temp_img/add";
  static const forgetPassword = "/doctor/forgot-password";
  static const otpVerification = "/auth/otpVerification";
  static const resetPassword = "/auth/resetPassword";
  static const termsCondition = "/contact/termsCondition";
  static const commentApi = "/doctor/dashboard/add_comment";

  //profile mdoule
  static const profileDetail = "/doctor/profile";
  static const updatePassword = "/profile/updatePassword";
  static const updateProfile = "/doctor/profile/update";

  //dashboard mdoule
  static const home = "/doctor/dashboard/home";
  static const dashboard = "/doctor/dashboard";
  static const patientGraph = "/doctor/dashboard/graph/patient";
  static const consultationGraph = "/doctor/dashboard/graph";
  static const patientHourlyGraph = "/doctor/dashboard/graph/patient_hourly";
  static const patientList = "/doctor/patientses";
  static const patient = "/doctor/patients-list";
  static const drugs = "/doctor/drugs";
  static const patientSearch = "/doctor/patients-search";

  // static const prescription = "/doctor/prescriptions";
  static const prescription = "/doctor/patient_prescriptions";
  static const patientFeedback = "/doctor/appointment/feedback";
  static const appointment = "/doctor/appointments";
  static const patientViewReport = "/doctor/prescription/diagnosis_reports";
  static const doctorSchedule = "/doctor/appointment/schedule";
  static const liveConsult = "/doctor/live_consults";
  static const sendVideoUrl = "/doctor/appointment/join";
  static const prescriptionDetails = "/doctor/prescription/view";
  static const search = "/doctor/appointments/search";
  static const addPrescriptionL = "/doctor/prescription/create";
  static const updatePrescription = "/doctor/prescription/update";
  static const copyPrescription = "/doctor/prescription/copy";
  static const addDoctorSchedule = "/doctor/appointment/schedule/add";
  static const diagnosis = "/doctor/diagonosis";
  static const additionalAdvice = "/doctor/additional_advises";
  static const advice = "/doctor/advises";
  static const diagnosisTest = "/doctor/advise_investigations";

  static const updateAppointmentStatus = "/doctor/dashboard/ajax_booked_status";
  static const bookAppointmentDetails = "/doctor/appointment/list/by_date";
  static const walletList = "/doctor/wallet/withdraw_request";
  static const addwalletAmount = "/doctor/wallet/withdraw_request/add";
  static const checkScheduleTime = "/dashboard/checkScheduleTime";
  static const notification = "/doctor/notification/notification";
  static const addPrescription = "/doctor/dashboard/upload_medical_files";
  static const profiledelete = "/Profile/delete_file";
  static const addNewDrugs = "/doctor/drug/create";
  static const addNewDiagnosis = "/doctor/diagonosis/add";
  static const addNewAdditionalAdvice = "/doctor/additional_advise/add";
  static const addNewAdvice = "/doctor/advise/add";
  static const addNewDiagnosisTest = "/doctor/advise_investigation/add";

  //Search
  static const hospitalAutoSearch = "/dashboard/hospitalAutoSearch";
  static const specialityAutoSearch = "/dashboard/specialityAutoSearch";
  static const doctorNameAutoSearch = "/dashboard/doctorNameAutoSearch";

  //More
  static const contactUs = "/contact/contactUs";
  static const support = "/contact/support";
  static const contactInfo = "/contact/contactInfo";
  static const medicalFiles = "/medicalfiles/medicalFiles";
  static const deleteMedicalFiles = "/medicalfiles/deleteMedicalFiles";
  static const uploadMedicalFiles = "/medicalfiles/uploadMedicalFiles";
}
