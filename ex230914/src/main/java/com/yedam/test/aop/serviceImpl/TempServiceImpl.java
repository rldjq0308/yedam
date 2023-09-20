package com.yedam.test.aop.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.test.aop.mapper.TempMapper;
import com.yedam.test.aop.service.TempService;

@Service
public class TempServiceImpl implements TempService {
	@Autowired
	TempMapper tempMapper;
	
	@Transactional
	@Override
	public void insert(String value) {
		tempMapper.insert("101");
		tempMapper.insert("a101");
	}
}
