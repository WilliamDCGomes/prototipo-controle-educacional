class PaymentFinishedViewController {
  late String userName;
  late String raNumber;
  late String paymentTitle;
  late String bankingInstitutionDestined;
  late String bankingCnpj;
  late String paymentValue;
  late String? paymentDate;
  late String? dueDate;
  late String? statusText;
  late bool? hasCardRegistered;

  PaymentFinishedViewController(
    this.userName,
    this.raNumber,
    this.paymentTitle,
    this.bankingInstitutionDestined,
    this.bankingCnpj,
    this.paymentValue,
    this.paymentDate,
    {
      this.dueDate,
      this.statusText,
      this.hasCardRegistered,
    }
  );
}