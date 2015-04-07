//+------------------------------------------------------------------+
//|                                                     Examples.mq5 |
//|                                     Copyright 2015, Louis Fradin |
//|                                      http://en.louis-fradin.net/ |
//+------------------------------------------------------------------+

#property copyright "Copyright 2015, Louis Fradin"
#property link      "http://en.louis-fradin.net/"
#property version   "1.00"

#include "UnitTestCollection.mqh"

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void OnStart(){
   CUnitTestCollection utCollection();

   utCollection.AddUnitTest(TestFail());
   utCollection.AddUnitTest(TestSuccess());
}

//+------------------------------------------------------------------+
//| Test Fail
//+------------------------------------------------------------------+

CUnitTest* TestFail(){
   CUnitTest* ut = new CUnitTest("TestFail");

   // Verification of a true
   ut.IsFalse(__FILE__, __LINE__, true);
   ut.IsTrue(__FILE__, __LINE__, false);
   ut.IsEquals(__FILE__, __LINE__, "Bonjour", "bonjour");
   
   return ut;
}

//+------------------------------------------------------------------+
//| Test of the false
//+------------------------------------------------------------------+

CUnitTest* TestSuccess(){
   CUnitTest* ut = new CUnitTest("TestSuccess");

   // Verification of a true
   ut.IsFalse(__FILE__, __LINE__, false);
   ut.IsTrue(__FILE__, __LINE__, true);
   ut.IsEquals(__FILE__, __LINE__, "Bonjour", "Bonjour");
   
   return ut;
}

//+------------------------------------------------------------------+
