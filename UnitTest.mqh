//+------------------------------------------------------------------+
//|                                                 MQL5UnitTest.mqh |
//|                                     Copyright 2014, Louis Fradin |
//|                                      http://en.louis-fradin.net/ |
//+------------------------------------------------------------------+

#property copyright "Copyright 2014, Louis Fradin"
#property link      "http://en.louis-fradin.net/"
#property version   "1.00"

#include <Object.mqh>
#include <Arrays\List.mqh>
#include "FailedUnitTest.mqh"

//+------------------------------------------------------------------+
//| Prototype
//+------------------------------------------------------------------+

class CUnitTest: public CObject{
   private:
      string m_name;
      CList m_failedTestsList;
      
      void AddFailedTest(string file, int line, string message);

   public:
      CUnitTest(string testName);
      ~CUnitTest();
      
      // Tests
      bool IsTrue(string file, int line, bool result);
      bool IsFalse(string file, int line, bool result);
      bool IsEquals(string file, int line, string stringA, string stringB);
      bool IsEquals(string file, int line, int nbrA, int nbrB);
      bool IsEquals(string file, int line, double nbrA, double nbrB);
      bool IsNotEquals(string file, int line, double nbrA, double nbrB);
      void SetFalse(string file, int line, string message);
      
      // Failed tests
      CFailedUnitTest* GetFailedTest(int position);
      int TotalFailedTests();
      
      // Accessors
      string GetName();
};

//+------------------------------------------------------------------+
//| Constructor
//+------------------------------------------------------------------+

CUnitTest::CUnitTest(string testName){
   m_name = testName;
   Print(" => "+m_name);
}

//+------------------------------------------------------------------+
//| Destructor
//+------------------------------------------------------------------+

CUnitTest::~CUnitTest(){
   m_failedTestsList.Clear();
}

//+------------------------------------------------------------------+
//| Add a Failed Test to the intern list of failed tests
//+------------------------------------------------------------------+

void CUnitTest::AddFailedTest(string file, int line, string message){
   CFailedUnitTest *newFailedTest = new CFailedUnitTest(file,line);  
   
   // Add informations
   newFailedTest.SetResult(message);
   
   // Insert the failed Test
   m_failedTestsList.Add(newFailedTest);
}

//+------------------------------------------------------------------+
//| Unit test verifying if the argument is true
//| @param result Boolean to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsTrue(string file, int line, bool result){
   if(result!=true){
      this.AddFailedTest(file, line, "isTrue(False)");
      return false;
   }
   else
      return true;
}

//+------------------------------------------------------------------+
//| Unit test verifying if the argument is true
//| @param result Boolean to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsFalse(string file, int line, bool result){
   if(result!=false){
      this.AddFailedTest(file, line, "isFalse(True)");
      return false;
   }
   else
      return true;
}

//+------------------------------------------------------------------+
//| Unit test verifying if the two string arguments are equals
//| @param stringA First string to compare
//| @param stringB Second string to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsEquals(string file, int line, string stringA,string stringB){
   if(stringA!=stringB){ // If strings are differents
      string message = "IsEquals('"+stringA+"','"+stringB+"')";
      this.AddFailedTest(file, line, message); // Add a fail test
      return false;
   }
   else
      return true;
}

//+------------------------------------------------------------------+
//| Unit test verifying if the two int arguments are equals
//| @param nbrA First int to compare
//| @param nbrB Second int to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsEquals(string file, int line, int nbrA, int nbrB){
   if(nbrA!=nbrB){ // If strings are differents
      string message = "IsEquals("+IntegerToString(nbrA)+","+IntegerToString(nbrB)+")";
      this.AddFailedTest(file, line, message); // Add a fail test
      return false;
   }
   else
      return true;
} 

//+------------------------------------------------------------------+
//| Unit test verifying if the two double arguments are equals
//| @param nbrA First double to compare
//| @param nbrB Second double to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsEquals(string file, int line, double nbrA, double nbrB){
   if(nbrA!=nbrB){ // If strings are differents
      string message = "IsEquals("+DoubleToString(nbrA)+","+DoubleToString(nbrB)+")";
      this.AddFailedTest(file, line, message); // Add a fail test
      return false;
   }
   else
      return true;
}

//+------------------------------------------------------------------+
//| Unit test verifying if the two double arguments are not equals
//| @param nbrA First double to compare
//| @param nbrB Second double to compare
//+------------------------------------------------------------------+

bool CUnitTest::IsNotEquals(string file, int line, double nbrA, double nbrB){
   if(nbrA==nbrB){ // If strings are differents
      string message = "IsNotEquals("+DoubleToString(nbrA)+","+DoubleToString(nbrB)+")";
      this.AddFailedTest(file, line, message); // Add a fail test
      return false;
   }
   else
      return true;
} 

//+------------------------------------------------------------------+
//| Set the Unit Test as false directly for a certain reason
//| @param expected What was expected
//| @param reality What really happen
//+------------------------------------------------------------------+

void CUnitTest::SetFalse(string file, int line, string message){
   this.AddFailedTest(file, line, message); // Add a fail test
}

//+------------------------------------------------------------------+
//| Get the failed test by its position in the list
//| @return The failed if a test exists at this position, NULL otherwise
//+------------------------------------------------------------------+

CFailedUnitTest* CUnitTest::GetFailedTest(int position){
   return m_failedTestsList.GetNodeAtIndex(position);
}

//+------------------------------------------------------------------+
//| Get the total of failed tests
//| @return The total of failed tests
//+------------------------------------------------------------------+

int CUnitTest::TotalFailedTests(void){
   return m_failedTestsList.Total();
}

//+------------------------------------------------------------------+
//| Get the name of the unit test
//| @return The unit test name
//+------------------------------------------------------------------+

string CUnitTest::GetName(){
   return m_name;
}

//+------------------------------------------------------------------+
