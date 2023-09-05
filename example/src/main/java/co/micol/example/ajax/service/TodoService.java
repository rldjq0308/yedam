package co.micol.example.ajax.service;

import java.util.List;

public interface TodoService {
	List<TodoVO> todoList();
	boolean todoAdd(TodoVO vo);
	boolean todoEdit(TodoVO vo);
	boolean todoDel(int no);
}
