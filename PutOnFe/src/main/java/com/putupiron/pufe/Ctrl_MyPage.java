package com.putupiron.pufe;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.putupiron.pufe.dao.UserDao;
import com.putupiron.pufe.dto.User;

@Controller
@RequestMapping("/myPage")
public class Ctrl_MyPage {
	@Autowired UserDao userDao;
	
//	네비게이션 바에 세션의 유저 정보 전송
	public User navBar(HttpSession session, Model m) throws Exception {
		String user_email = (String)session.getAttribute("email");
		User user = userDao.selectUser(user_email);
		m.addAttribute("user",user);
		return user;
	}
	
//	회원정보수정 메뉴
	@GetMapping("/modify")
	public String modify_get(HttpSession session, Model m) throws Exception {
		navBar(session,m);
		m.addAttribute("menu","info");
		m.addAttribute("page","modify");
		return "myPage";
	}
	
//	회원정보수정 버튼
	@PostMapping("/modify")
	public String modify(String name, String tel, HttpSession session, Model m, RedirectAttributes ras){
		try {
			User user = navBar(session,m);
			int modify= userDao.modify(user.getUser_email(), name, tel);
			if(modify!=1) {
				ras.addFlashAttribute("msg","알 수 없는 이유로 변경에 실패했습니다.");
				return "redirect:/myPage/modify";
			}
			ras.addFlashAttribute("msg","회원정보가 변경되었습니다.");
			return "redirect:/myPage";
		} catch(Exception e) {
			ras.addFlashAttribute("msg","해당 전화번호로 가입한 계정이 이미 존재합니다.");
			return "redirect:/myPage/modify";
		}
	}
	
//	비밀번호 수정 메뉴
	@GetMapping("/changePw")
	public String changePw_get(HttpSession session, Model m) throws Exception {
		navBar(session,m);
		m.addAttribute("menu","changePw");
		return "myPage";
	}
//	비밀번호 변경버튼
	@PostMapping("/changePw")
	public String changePw(String currentPw, String newPw, String newPwConfirm, HttpSession session, Model m, RedirectAttributes ras) {
		try {
			User user = navBar(session,m);
			if(!currentPw.equals(user.getUser_pw())) {
				ras.addFlashAttribute("msg","기존 비밀번호가 틀렸습니다.");
				return "redirect:/myPage/changePw";
			}
			if(!newPw.equals(newPwConfirm)) {
				ras.addFlashAttribute("msg","새 비밀번호를 정확히 입력해주세요.");
				return "redirect:/myPage/changePw";
			}
			int resetPw = userDao.resetPw(user.getUser_email(), newPw);
			if(resetPw!=1) throw new Exception();
			ras.addFlashAttribute("msg","비밀번호 변경 완료, 새로운 비밀번호로 로그인하세요.");
			return "redirect:/login";
		} catch(Exception e) {
			ras.addFlashAttribute("msg","알 수 없는 이유로 변경에 실패했습니다.");
			return "redirect:/myPage/changePw";
		}
	}
//	회원탈퇴 메뉴
	@GetMapping("/unregister")
	public String unregister_get(HttpSession session, Model m) throws Exception{
		navBar(session,m);
		m.addAttribute("menu","unregister");
		return "myPage";
	}
//	회원탈퇴버튼
	@PostMapping("/unregister")
	public String unregister(String pw, HttpSession session, Model m, RedirectAttributes ras){
		try {
			User user = navBar(session,m);
			if(!pw.equals(user.getUser_pw())) {
				ras.addFlashAttribute("msg","비밀번호가 틀렸습니다.");
				return "redirect:/myPage/unregister";
			}
			int unregisterEmail = userDao.unregister(user.getUser_email());
			if(unregisterEmail!=1) throw new Exception();
			session.invalidate();
			ras.addFlashAttribute("msg","회원탈퇴가 정상적으로 처리됐습니다.");
			return "redirect:/";
		} catch(Exception e) {
			ras.addFlashAttribute("msg","알 수 없는 이유로 탈퇴에 실패했습니다.");
			return "redirect:/myPage/unregister";
		}
	}
}
