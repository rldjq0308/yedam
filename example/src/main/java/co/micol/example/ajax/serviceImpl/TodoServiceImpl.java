package co.micol.example.ajax.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.example.ajax.mapper.TodoMapper;
import co.micol.example.ajax.service.TodoService;
import co.micol.example.ajax.service.TodoVO;
import co.micol.example.common.DataSources;

public class TodoServiceImpl implements TodoService {

	private SqlSession sqlSession = DataSources.getInstance().openSession(true);
	private TodoMapper map = sqlSession.getMapper(TodoMapper.class);
	
	@Override
	public List<TodoVO> todoList() {
		// TODO Auto-generated method stub
		return map.list();
	}

	@Override
	public boolean todoAdd(TodoVO vo) {
		// TODO Auto-generated method stub
		return map.insert(vo) == 1;
	}

	@Override
	public boolean todoEdit(TodoVO vo) {
		// TODO Auto-generated method stub
		return map.update(vo) == 1;
	}

	@Override
	public boolean todoDel(int no) {
		// TODO Auto-generated method stub
		return map.delete(no) == 1;
	}

}
