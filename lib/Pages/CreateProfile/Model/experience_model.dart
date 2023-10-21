class ExperienceModel {
  String currentJob;
  String company;
  String companyCountry;
  String companyState;
  String employeeType;
  String employementStartDate;
  String employementEndDate;

  ExperienceModel(
      {required this.company,
      required this.companyCountry,
      required this.companyState,
      required this.currentJob,
      required this.employeeType,
      required this.employementEndDate,
      required this.employementStartDate});
}
