//+------------------------------------------------------------------+
//|                                              FailedTestClass.mqh |
//|                                     Copyright 2015, Louis Fradin |
//|                                      http://en.louis-fradin.net/ |
//+------------------------------------------------------------------+

#property copyright "Copyright 2015, Louis Fradin"
#property link      "http://en.louis-fradin.net/"

#include <Object.mqh>

//+------------------------------------------------------------------+
//| Prototype
//+------------------------------------------------------------------+

class CFailedUnitTest: public CObject{
   private:
      string m_file;
      int m_line;
      string m_result;
   public:
      CFailedUnitTest(string file, int line);
      ~CFailedUnitTest();
      
      void Display();
      
      // Mutators
      void SetResult(string text);
      
      // Accessors
      string GetResult();
};

//+------------------------------------------------------------------+
//| Constructor
//| @param testNumber Number of the test
//+------------------------------------------------------------------+

CFailedUnitTest::CFailedUnitTest(string file, int line){
   m_file = file;
   m_line = line;
   m_result = "";
}

//+------------------------------------------------------------------+
//| Destructor
//+------------------------------------------------------------------+

CFailedUnitTest::~CFailedUnitTest(){
}

//+------------------------------------------------------------------+
//| Display the failed test
//+------------------------------------------------------------------+

void CFailedUnitTest::Display(){
   Print("+"+m_file+":"+IntegerToString(m_line)
      +" : "+m_result);
}

//+------------------------------------------------------------------+
//| Set the  result text
//| @param text Text resuming what happened
//+------------------------------------------------------------------+

void CFailedUnitTest::SetResult(string text){
   m_result = text;
}


//+------------------------------------------------------------------+
//| Return the result
//| @return Text of the result
//+------------------------------------------------------------------+

string CFailedUnitTest::GetResult(){
   return m_result;
}

//+------------------------------------------------------------------+