package co.micol.example.ajax.service;

import lombok.Data;

@Data
public class TodoVO {
	int listNo;
	String todo;
	String dueDate;
	String complete;
}
