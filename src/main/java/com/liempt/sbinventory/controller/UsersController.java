
package com.liempt.sbinventory.controller;

import com.liempt.sbinventory.dao.UsersDao;
import com.liempt.sbinventory.entity.Users;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsersController {

	@Autowired
	private UsersDao usersDao;

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(ModelMap modelMap, HttpServletRequest request) {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		Users u = usersDao.getUser(userName, password);
		HttpSession session = request.getSession();
		if (u != null) {
			session.setAttribute("user_id", u.getUserId());
			return "redirect:/home";
		} else {
			modelMap.addAttribute("em", "User Not Found, try again");
			return "index";
		}
	}

	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("em", "The Username or Password is incorrect.");
		return "index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user_id") != null) {
			session.setAttribute("user_id", null);
		}
		return "index";
	}

}
