package com.codingdojo.safe.travels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.safe.travels.models.Expense;
import com.codingdojo.safe.travels.services.ExpenseService;

@Controller
public class HomeController {

	@Autowired
	private ExpenseService expenseService;
	
	
	//Get all 
	@GetMapping("/expenses")
	public String dashboardPage(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> allExpenses = expenseService.allExpenses();
		model.addAttribute("expenseList", allExpenses);
		return "dashboard.jsp";
	}
	
	
	//Create One - process the form
    @PostMapping("/expenses")
    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors()) {
            return "dashboard.jsp";
        } 
        else {
            expenseService.addExpense(expense);
            return "redirect:/expenses";
        }
    }
    
	//Get One - view one
	@GetMapping("/expenses/{id}")
	public String oneExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.oneExpense(id);
		model.addAttribute("expense", expense);
		return "oneExpense.jsp";
	}
    
    
    
    
    
	//Edit Form - display form
	@GetMapping("/expenses/edit/{id}")
	public String displayUpdateForm(@PathVariable("id")Long id, Model model) 
	{
		Expense expense = expenseService.oneExpense(id);
		model.addAttribute("expense", expense);
		return "editExpenseForm.jsp";
	}
	
	
	//Edit Form = process form
	@PutMapping("/expenses/edit/{id}")
	public String processUpdate(@Valid @ModelAttribute("expense") Expense expense, 
	BindingResult result) 
	{
		if(result.hasErrors()) {
			return"editExpenseForm.jsp";
		}
		else {
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
    
    
    
    
    
    //Delete One
	@DeleteMapping(value="/expenses/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}
	
	
}
