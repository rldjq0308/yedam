package com.yedam.test.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.test.emp.mapper.EmpMapper;
import com.yedam.test.emp.service.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpMapper empMapper;
	
	// get : 조회, 빈페이지 요청
	// 그외(post, delete, put) : 등록, 수정, 삭제
	
	//@RequestMapping(value="empForm", method=RequestMethod.GET)
	@GetMapping("empForm")
	public void getEmpInfoForm() {}
	
	@GetMapping("getEmp")
	public String getEmpData(EmpVO empVO, Model model) {
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "empForm";
	}
	
	//@RequestParam
	//객체가 아닌 기본타입, String과 같이 단일값
	//-> defaultValue : 데이터가 없을때 => 기본값
	//-> name : 파라미터이름
	//-> required=true : 필수여부체크 , 
	//   required=false인 경우 null을 넘겨줌 => 기본타입이 아니라 NULL을 처리할 수 있는 WrapperClass를 사용해야함 
	@GetMapping("getEmpData")
	public String getEmpData(@RequestParam(defaultValue = "100"
											, name = "eId"
											, required = true) 
									Integer employeeId, Model model) {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(employeeId);
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "empForm";
	}
	
	@GetMapping("emp/{id}")
	public String getEmpData2(@PathVariable(name="id") 
										Integer employeeId, 
										Model model) {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(employeeId);
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "empForm";
	}
}
