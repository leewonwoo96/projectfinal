package com.putupiron.pufe;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Ctrl_Login {
	@Autowired
	UserDao userDao;
	
	@GetMapping("/login")
	public String login_get() {
		return "login";
	}
	@PostMapping("/login")
	public String login(String email, String pwd, boolean remEmail, HttpServletRequest req, HttpServletResponse resp, RedirectAttributes ras) throws Exception{
		if(!loginCheck(email,pwd)) {
			ras.addFlashAttribute("loginCheck","false");
			return "redirect:/login"; // 이메일-비밀번호 확인
		}
		HttpSession session = req.getSession();
		session.setAttribute("email", email); //세션객체에 이메일 저장
		if(remEmail) resp.addCookie(new Cookie("email",email)); //이메일 저장버튼 활성화 시 쿠키에 이메일 저장
		else {
			Cookie cookie = new Cookie("email",email);
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}
		return "redirect:/";
	}
	
	public boolean loginCheck(String email, String pwd) throws Exception{
		User user = userDao.selectUser(email);
		if(user==null) return false;
		return user.getUser_pw().equals(pwd);
	}
}
