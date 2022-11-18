package com.putupiron.pufe;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.putupiron.pufe.dao.PTDao;
import com.putupiron.pufe.dao.UserDao;
import com.putupiron.pufe.dto.PTReserv;
import com.putupiron.pufe.dto.User;

@Controller
@RequestMapping("/PT")
public class Ctrl_PTReservation {
	@Autowired UserDao	userDao;
	@Autowired PTDao	ptDao;
	
//	네비게이션 바에 세션의 유저 정보 전송
	public User navBar(HttpSession session, Model m) throws Exception {
		String user_email = (String)session.getAttribute("email");
		User user = userDao.selectUser(user_email);
		m.addAttribute("user",user);
		return user;
	}
	
	@PostMapping("/reservation")
	public String reservation_PT(String pt_datetime, HttpSession session, Model m,RedirectAttributes ras) throws Exception{
		User user = navBar(session,m);
		String[] datetime = pt_datetime.split("_");
		Date pt_date = Date.valueOf(datetime[0]);
		Integer pt_time = Integer.parseInt(datetime[1]);
		if(ptDao.reserve(new PTReserv(pt_date,pt_time,user.getTrainer(),user.getUser_email()))!=1)
			ras.addFlashAttribute("msg","신청에 실패했습니다. 다시 신청해주세요.");
		else ras.addFlashAttribute("msg","신청 완료, 트레이너가 예약을 확정해야 예약이 완료됩니다.");
		return "redirect:/menu2";
	}
}
