package com.yedam.java.book.service.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.java.book.service.BookService;
import com.yedam.java.book.service.BookVO;
import com.yedam.java.book.service.RentVO;

@Controller
public class BookController {
	@Autowired
	BookService bookService;
	
	@GetMapping("bookList")
	public String bookList(Model model) {
		List<BookVO> list = bookService.getBookList();
		model.addAttribute("bookList",list);
		return "book/bookList";
	}
	
	@GetMapping("bookInsert")
	public String bookInsertForm(Model model) {
		int nextNo = bookService.getBookNo();
		model.addAttribute("bookNo",nextNo);
		return "book/bookInsert";
	}
	
	@PostMapping("bookInsert")
	public String bookInsert(BookVO bookVO) {
		bookService.insertBook(bookVO);
		return "redirect:bookList";
	}
	
	@GetMapping("rentList")
	public String RentList(Model model) {
		List<RentVO> list = bookService.getRent();
		model.addAttribute("rentList",list);
		return "book/rentList";
	}
}
