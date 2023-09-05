package co.micol.example.ajax.mapper;

import java.util.List;

import co.micol.example.ajax.service.TodoVO;

public interface TodoMapper {
	List<TodoVO> list();
	int insert(TodoVO vo);
	int update(TodoVO vo);
	int delete(int no);
}
