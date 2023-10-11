package com.yedam.java.book.mapper;

import java.util.List;

import com.yedam.java.book.service.BookVO;
import com.yedam.java.book.service.RentVO;

public interface BookMapper {
	public List<BookVO> getBookList();
	public int insertBook(BookVO vo);
	public int getBookNo();
	public List<RentVO> getRent();
}
