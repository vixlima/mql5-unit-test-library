//+------------------------------------------------------------------+
//|                                      UnitTestCollectionClass.mqh |
//|                                     Copyright 2015, Louis Fradin |
//|                                      http://en.louis-fradin.net/ |
//+------------------------------------------------------------------+

#property copyright "Copyright 2015, Louis Fradin"
#property link      "http://en.louis-fradin.net/"

#include <Object.mqh>
#include <Arrays\List.mqh>
#include "UnitTests.mqh"

//+------------------------------------------------------------------+
//| Prototype
//+------------------------------------------------------------------+

class CUnitTestsCollection: public CObject{
   private:
      CList m_unitTestsList;
      
      void DisplayFailedTests();
   public:
      void AddUnitTests(CUnitTests *ut);

      CUnitTestsCollection();
      ~CUnitTestsCollection();
};

//+------------------------------------------------------------------+
//| Constructor
//+------------------------------------------------------------------+

CUnitTestsCollection::CUnitTestsCollection(){
   Print(" --- Unit Tests beginning -------------------------------");
}

//+------------------------------------------------------------------+
//| Destructor
//+------------------------------------------------------------------+

CUnitTestsCollection::~CUnitTestsCollection(){
   Print(" --- Unit Tests end -------------------------------------");
   DisplayFailedTests();
   
   // Clear the list
   m_unitTestsList.Clear();
}

//+------------------------------------------------------------------+
//| Display failed test of the unit tests added
//+------------------------------------------------------------------+

CUnitTestsCollection::DisplayFailedTests(){
   CFailedUnitTest *failedTest;
   CUnitTests *unitTest  = m_unitTestsList.GetFirstNode();
   int nbrOfUnitTests = m_unitTestsList.Total();
   int total;
   string summary;
   
   for(int i = 0; i < nbrOfUnitTests; i++){ // For all unit tests
      total = unitTest.TotalFailedTests();
   
      if(total!=0){ // If there is a failed test
         summary += "F ";
         Print(unitTest.GetName()+" failed");
         
         for(int j = 0; j < total; j++){
            failedTest = unitTest.GetFailedTest(j);
            failedTest.Display();
         }
      }
      else{
         summary += ". ";
         Print(unitTest.GetName()+" success");
      }
      
      unitTest = m_unitTestsList.GetNextNode();
   }
   
   Print(" --------------------------------------------------------");
   Print(summary);
}

//+------------------------------------------------------------------+
//| Add a unit test to the collection
//| @param ut The unit test to add
//+------------------------------------------------------------------+

void CUnitTestsCollection::AddUnitTests(CUnitTests *ut){
   m_unitTestsList.Add(ut);
}

//+------------------------------------------------------------------+
