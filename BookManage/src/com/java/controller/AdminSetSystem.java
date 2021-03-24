package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.service.DataService;

@SessionAttributes("style")
@Controller
@RequestMapping("admin")
public class AdminSetSystem {

	@Autowired
	@Qualifier("dataService")
	DataService dataService;
	

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}

	@RequestMapping("setPagesize")
	public String setPagesize(@RequestParam("size") Integer size,Model model) {
		System.out.println("setsize:"+size);
		dataService.updatePagesize(size);
		model.addAttribute("state", "success");
		return "manage_system";
	}
	
	@RequestMapping("setReturnDate")
	public String setReturnDate(@RequestParam("date") Integer date,Model model) {
		dataService.updateReturnDate(date);
		model.addAttribute("state", "success");
		return "manage_system";
	}
	
	@RequestMapping("setFine")
	public String setFine(@RequestParam("fine") Integer fine,Model model) {
		dataService.updateFine(fine);
		model.addAttribute("state", "success");
		return "manage_system";
	}
	
	@RequestMapping("style")
	public String setStyle(@RequestParam("style") String style,Model model) {
		if(style.equals("white")) {
			dataService.updateStyle("white");
		}else if(style.equals("yellow")) {
			dataService.updateStyle("yellow");
		}else if(style.equals("gray")) {
			dataService.updateStyle("gray");
		}else if(style.equals("cyan")) {
			dataService.updateStyle("cyan");
		}else if(style.equals("skyblue")) {
			dataService.updateStyle("skyblue");
		}else if(style.equals("bc1")) {
			dataService.updateStyle("bc1");
		}else if(style.equals("bc2")) {
			dataService.updateStyle("bc2");
		}else if(style.equals("bc3")) {
			dataService.updateStyle("bc3");
		}
		model.addAttribute("state", "success");
		model.addAttribute("style", style);
		return "manage_system";
	}
}
