package com.java.library.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.TestDaoInterface;

@Service
public class TestService implements TestServiceInterface {
   
   @Autowired
   TestDaoInterface tdi;
   
   @Override
   public HashMap<String, Object> test() {
      return tdi.test();
   }

	
}