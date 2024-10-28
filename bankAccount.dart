class BankAccount{
  late int accountID;
  late num balance;
  static  int id=1000;
  late Clint owner;
  BankAccount({this.balance=0}){
    id++;
    accountID=id;
  }
  withdraw(num value){
    if(value<=balance&& value>=100){
      balance-=value;
    }else{
      print('cant withdraw this amount');
    }
  }
  deposit(num value){
    if(value>=100){
      balance+=value;
    }else{
      print("cant deposit amount < 100" );
    }
  }
  veiw(){
    print('account id : $accountID');
    print('the balance : $balance');
    owner.veiw();
  }
}
class SavingsBankAccount extends BankAccount{
  late num minimumBalance=1000;
  SavingsBankAccount({super.balance}){
      if (balance >= minimumBalance) {
        super.balance=balance;
      }
      else{
        print('balanse should be >=1000');
      }
  }
  @override
  withdraw(num value) {
    if(balance-value>=minimumBalance){
    return super.withdraw(value);
    }else{
      print("cant withdaaw the balance must be >= 2000");
    }
  }
  deposit(num value) {
    return super.deposit(value);
  }
  veiw() {
    return super.veiw();
  }
}
class Clint {
  late String name;
  late String address;
  late int phone;
  late BankAccount account;
  Clint(this.name,this.address,this.phone);
  veiw(){
    print('name :$name');
    print('address :$address');
    print('phone :$phone');
  }

}
