package com.yedam.java.book.service;

import java.util.List;

public interface BookService {
	public List<BookVO> getBookList();
	public int insertBook(BookVO vo);
	public int getBookNo();
	public List<RentVO> getRent();
}
