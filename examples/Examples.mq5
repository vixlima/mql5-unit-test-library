//+------------------------------------------------------------------+
//|                                                     Examples.mq5 |
//|                                     Copyright 2015, Louis Fradin |
//|                                      http://en.louis-fradin.net/ |
//+------------------------------------------------------------------+

#property copyright "Copyright 2015, Louis Fradin"
#property link      "http://en.louis-fradin.net/"
#property version   "1.00"

#include "../UnitTest-Library.mqh"

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void OnStart(){
   CUnitTestsCollection utCollection();

   utCollection.AddUnitTests(TestFail());
   utCollection.AddUnitTests(TestSuccess());
}

//+------------------------------------------------------------------+
//| Failed Unit Tests
//+------------------------------------------------------------------+

CUnitTests* TestFail(){
   CUnitTests* ut = new CUnitTests("TestFail");

   // Verification of a true
   ut.IsFalse(__FILE__, __LINE__, true);
   ut.IsTrue(__FILE__, __LINE__, false);
   ut.IsEquals(__FILE__, __LINE__, "Bonjour", "bonjour");
   
   return ut;
}

//+------------------------------------------------------------------+
//| Test of the false
//+------------------------------------------------------------------+

CUnitTests* TestSuccess(){
   CUnitTests* ut = new CUnitTests("TestSuccess");

   // Verification of a true
   ut.IsFalse(__FILE__, __LINE__, false);
   ut.IsTrue(__FILE__, __LINE__, true);
   ut.IsEquals(__FILE__, __LINE__, "Bonjour", "Bonjour");
   
   return ut;
}

//+------------------------------------------------------------------+
