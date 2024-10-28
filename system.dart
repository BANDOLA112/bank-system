import 'dart:io';
import 'bankAccount.dart';
class SystemBank {
  late List<Clint> allClintes=[];
  late List<BankAccount> allAccounts=[];


  void showAll() {
    for (int i = 0; i < allAccounts.length; i++) {
      allAccounts[i].veiw();
      print('----------------');
    }
  }
  void createBankAccount(){
    print('what is the type of the bank account you want');
    print('1-bank account');
    print('2-saving bank account');
    int type=int.parse(stdin.readLineSync()!);

    if(type==1){
      stdout.write('enter the clint is name');
      String name =stdin.readLineSync()!;
      stdout.write('enter the clint is address');
      String address =stdin.readLineSync()!;
      stdout.write('enter the clint is phone number');
      int phone =int.parse(stdin.readLineSync()!) ;
      stdout.write("enter the account is balance");
      num balance=num.parse(stdin.readLineSync()!);

    Clint clint=Clint(name, address, phone);
    BankAccount account=BankAccount(balance: balance);
    clint.account=account;
    account.owner=clint;
    allClintes.add(clint);
    allAccounts.add(account);
    }else if(type==2){

      stdout.write('enter the clint is name');
      String name =stdin.readLineSync()!;
      stdout.write('enter the clint is address');
      String address =stdin.readLineSync()!;
      stdout.write('enter the clint is phone number');
      int phone =int.parse(stdin.readLineSync()!) ;
      stdout.write("enter the account is balance");
      num balance=num.parse(stdin.readLineSync()!);
      if(balance>=1000){

      Clint clint=Clint(name, address, phone);
      BankAccount account=SavingsBankAccount(balance: balance);
      clint.account=account;
      account.owner=clint;
      allClintes.add(clint);
      allAccounts.add(account);
      }
      else{
        print('balanse should be >=1000');
        balance=num.parse(stdin.readLineSync()!);
        Clint clint=Clint(name, address, phone);
        BankAccount account=SavingsBankAccount(balance: 1000);
        clint.account=account;
        account.owner=clint;
        allClintes.add(clint);
        allAccounts.add(account);
      }

    }else{
      print('wrong type');
    }

  }
  void searchAccountByID(){
    stdout.write("enter the id you want to search");
    num id =num.parse(stdin.readLineSync()!);
    for(int i=0;i<allClintes.length;i++){
      if(allClintes[i].account.accountID==id){
        allClintes[i].account.veiw();
      }else{
        print('not found');
      }
    }
  }
  void deleteAccountByID(){
    stdout.write("enter the id you want to delete");
    num id =num.parse(stdin.readLineSync()!);
    for(int i=0;i<allAccounts.length;i++){
      if(allAccounts[i].accountID==id){
        allAccounts.remove(allAccounts[i]);
        allClintes.remove(allClintes[i]);
      }else{
        print('not found');
      }
  }
  }
  void withdrawBankAccount(){
    stdout.write("enter the id you want to withdraw");
    num id =num.parse(stdin.readLineSync()!);
    for(int i=0;i<allAccounts.length;i++){
      if(allAccounts[i].accountID==id){
        stdout.write('enter the amount ');
      num value=num.parse(stdin.readLineSync()!);
        allAccounts[i].withdraw(value);
      }
      else{
        print("not found this account");
      }
    }
  }
  void depositBankAccount() {
      stdout.write("enter the id you want to deposit");
      num id = num.parse(stdin.readLineSync()!);
      for (int i = 0; i < allAccounts.length; i++) {
        if (allAccounts[i].accountID == id) {
          stdout.write('enter the amount ');
          num value = num.parse(stdin.readLineSync()!);
          allAccounts[i].deposit(value);
        }
        else {
          print("not found this account");
        }
      }
  }
  void showMinu (){
     while(true){
       print('1-create a bank account');
       print('2-search account by id');
       print('3-delete bank account by id');
       print('4-withdraw bank account');
       print('5-deposit bank account');
       print('6-show all bank accounts');
       print('7-Exit');
       int option=int.parse(stdin.readLineSync()!);
       if(option==1) {
          createBankAccount();
       }else if(option==2) {
          searchAccountByID();
       }else if(option==3) {
          deleteAccountByID();
       }else if(option==4) {
          withdrawBankAccount();
       }else if(option==5) {
          depositBankAccount();
       }else if(option==6) {
          showAll();
       }else if(option==7) {
         break;
       }else{
         print('wrong value');
       }
     }
  }
}