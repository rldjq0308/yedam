package com.yedam.java.book.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.java.book.mapper.BookMapper;
import com.yedam.java.book.service.BookService;
import com.yedam.java.book.service.BookVO;
import com.yedam.java.book.service.RentVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper; 
	
	@Override
	public List<BookVO> getBookList() {
		return bookMapper.getBookList();
	}

	@Override
	public int insertBook(BookVO vo) {
		return bookMapper.insertBook(vo);
	}

	@Override
	public int getBookNo() {
		return bookMapper.getBookNo();
	}

	@Override
	public List<RentVO> getRent() {
		return bookMapper.getRent();
	}

}
