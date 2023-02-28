package com.codingdojo.safe.travels.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.safe.travels.models.Expense;
import com.codingdojo.safe.travels.services.ExpenseService;

@RestController
@RequestMapping("/api")
public class APIController {

	private final ExpenseService expenseService;
	
	public APIController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}	
	
	
	//get all
	@GetMapping("/expenses")
	public List<Expense> getAllExpenses(){
		return expenseService.allExpenses();
	}
	
	
	//create 
	@PostMapping("/expenses")
	public Expense createExpense( 
		@RequestParam("expenseName") String expenseName,
		@RequestParam("vendor") String vendor,
		@RequestParam("amount") Double amount,
		@RequestParam("description") String description

		) {
		Expense newExpense = new Expense(expenseName, vendor, amount, description);
		return expenseService.addExpense(newExpense);
	} 
	
	
	//get one 
	@GetMapping("/expenses/{id}")
	public Expense getOneExpense(@PathVariable("id")Long id) {
		return expenseService.oneExpense(id);
	}
	
	
	//update -- findOne & create
	@PutMapping("/expenses/{id}") 
	public Expense editExpenseProcess(
		@PathVariable("id")Long id,
		@RequestParam("expenseName") String expenseName,
		@RequestParam("vendor") String vendor,
		@RequestParam("amount") Double amount,
		@RequestParam("description") String description
		) {
		Expense foundExpense = expenseService.oneExpense(id);
		foundExpense.setExpenseName(expenseName);
		foundExpense.setVendor(vendor);
		foundExpense.setAmount(amount);
		foundExpense.setDescription(description);
		return expenseService.updateExpense(foundExpense);
	}
	
	
	
	//delete 
	@DeleteMapping("/expenses/{id}")
	public void deleteBurger(@PathVariable("id")Long id) {
		expenseService.deleteExpense(id);
	}
	
	
	
	
}
