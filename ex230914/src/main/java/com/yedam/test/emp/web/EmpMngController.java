package com.yedam.test.emp.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.test.emp.service.EmpService;
import com.yedam.test.emp.service.EmpVO;

@Controller
public class EmpMngController {
	
	@Autowired
	EmpService empService;
	
	//조회(데이터, 일반페이지) -> GET
	//등록, 수정, 삭제 -> POST (예외, 단건삭제 - GET)
	
	// 전체조회
	@GetMapping("empList")
	public String getEmpAllList(Model model) {
		model.addAttribute("empList",empService.getEmpAll());
		return "emp/empList";
	}
	
	// 단건조회
	@GetMapping("empInfo")
	public String getEmpInfo(EmpVO empVO, Model model) {
		model.addAttribute("empInfo",empService.getEmp(empVO));
		return "emp/empInfo";
	}
	
	// 등록 - Form
	@GetMapping("empInsert")
	public String empInsertForm() {
		return "emp/empInsert";
	}
	
	// 등록 - Process
	@PostMapping("empInsert")
	public String empInsertProcess(EmpVO empVO, RedirectAttributes attr) {
		int empId = empService.insertEmp(empVO);
		
		String result = null;
		if(empId == -1) {
			result = "정상적으로 등록되지 않았습니다.";
		}else {
			result = "정상적으로 등록되었습니다. \n등록된 사원의 사원번호는 " + empId + " 입니다";
		}
		attr.addAttribute("type","insert");
		attr.addFlashAttribute("result",result);
		
		return "redirect:empList";
	}
	
	// 수정 : 1) 단건조회 -> 2) 수정
	
	// 수정 - Form
	@GetMapping("empUpdate")
	public String empUpdateForm(EmpVO empVO, Model model) {
		EmpVO findVO = empService.getEmp(empVO);
		model.addAttribute("empInfo",findVO);
		return "emp/empUpdate";
	}
	
	// 수정 - Process : ajax => 필수어노테이션, @ResponseBody
	@PostMapping("empUpdate")
	@ResponseBody
	public Map<String, String> empUpdateProcess(@RequestBody EmpVO empvo){
		return empService.updateEmp(empvo); 
	}
	
	// 삭제 - 단건삭제
	
	// 삭제 - 선택삭제
}
