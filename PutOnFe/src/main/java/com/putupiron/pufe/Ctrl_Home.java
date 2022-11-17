package com.putupiron.pufe;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.putupiron.pufe.dao.MachineDao;
import com.putupiron.pufe.dao.PTDao;
import com.putupiron.pufe.dao.RecommendDao;
import com.putupiron.pufe.dao.UserDao;
import com.putupiron.pufe.dto.BigThree;
import com.putupiron.pufe.dto.Machine;
import com.putupiron.pufe.dto.PTReserv;
import com.putupiron.pufe.dto.Recommend;
import com.putupiron.pufe.dto.User;
import com.putupiron.pufe.vo.PageHandler;
import com.putupiron.pufe.vo.SearchCondition;

@Controller
public class Ctrl_Home {
	@Autowired UserDao userDao;
	@Autowired MachineDao machineDao;
	@Autowired RecommendDao recDao;
	@Autowired PTDao ptDao;

//	홈 화면
	@GetMapping("/")
	public String home(HttpSession session, Model m) throws Exception{
		String user_email = (String)session.getAttribute("email");
		User user = userDao.selectUser(user_email);
		if(user==null) return "index";
		Integer user_rank = userDao.userBig3Rank(user_email);
		switch(user.getUser_type()) {
		case "A": m.addAttribute("stats",userDao.statistics()); break;
		case "T": m.addAttribute("today",new Date()); break;
		case "U": m.addAttribute("userview",userDao.homeUserView(user_email)); break;
		}
		m.addAttribute("user", user);
		m.addAttribute("rank",user_rank);
		return "index";
	}
	
//	네비게이션 바에 세션의 유저 정보 전송
	public User navBar(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception {
		String user_email = (String)session.getAttribute("email");
		User user = userDao.selectUser(user_email);
		m.addAttribute("user",user);
		m.addAttribute("lastPage","?toURL="+hsReq.getServletPath());
		return user;
	}
	
//	메뉴버튼1
	@GetMapping("/menu1")
	public String menu1(String viewType, HttpSession session, Model m, HttpServletRequest hsReq) throws Exception {
		User user = navBar(session,m,hsReq);
		if(user==null) return "login";
		switch(user.getUser_type()) {
		case "U":
			return "menu_user1";
		case "T":
			m.addAttribute("tulist",userDao.TrainerUserView(user.getUser_email()));
			return "menu_trainer1";
		case "A":
			if(viewType==null) viewType="user";
			m.addAttribute("stats",userDao.statistics());
			m.addAttribute("userlist",userDao.allUserView());
			m.addAttribute("trainerlist",userDao.allTrainerView());
			m.addAttribute("adminlist",userDao.allAdminView());
			m.addAttribute("viewType",viewType);
			return "menu_admin1";
		default:
			return "redirect:/login";
		}
	}
//	메뉴버튼2
	@GetMapping("/menu2")
	public String menu2(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception {
		User user = navBar(session,m,hsReq);
		if(user==null) return "login";
		String user_type= user.getUser_type();
		switch(user_type) {
		case "U":
			List<PTReserv> ptrList=ptDao.reservList(user.getTrainer(),user_type);
			List<List<Object>> bookedList = new ArrayList<>();
			List<Object> list=null;
			for(PTReserv ptr:ptrList) {
				list = new ArrayList<>();
				list.add(ptr.getPt_date().toString());
				list.add(ptr.getPt_time());
				bookedList.add(list);
			}
			List<PTReserv> userBookList = ptDao.userBookList(user.getUser_email());
			List<List<Object>> userList = new ArrayList<>();
			for(PTReserv userPTR:userBookList) {
				list = new ArrayList<>();
				list.add(userPTR.getPt_date().toString());
				list.add(userPTR.getPt_time());
				userList.add(list);
			}
			m.addAttribute("bookedList",bookedList);
			m.addAttribute("userList",userList);
			return "menu_user2";
		case "T":
			return "menu_trainer2";
		case "A":
			return "menu_admin2";
		default:
			return "redirect:/login";
		}
	}
//	추천운동정보
	@GetMapping("/recommend")
	public String recommend(SearchCondition sc, HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		navBar(session,m,hsReq);
		int totalCnt = recDao.searchCnt(sc);
		PageHandler ph = new PageHandler(totalCnt,sc);
		List<Recommend> list= recDao.search(sc);
		m.addAttribute("now",new Date());
		m.addAttribute("list",list);
		m.addAttribute("ph",ph);
		return "boarder_recommend";
	}
//	클럽 시설 정보
	@GetMapping("/machines")
	public String machines(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		navBar(session,m,hsReq);
		List<Machine> machineList=machineDao.selectAllMachines();
		m.addAttribute("machineList", machineList);
		return "boarder_machines";
	}
//	Big3 랭킹
	@GetMapping("/bigThree")
	public String big3Rank(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		User user = navBar(session,m,hsReq);
		if(user==null) return "redirect:/login";
		List<BigThree> list = userDao.bigThreeRank();
		m.addAttribute("list",list);
		return "bigThree";
	}
//	헬스메이트 매칭
	@GetMapping("/matching")
	public String matching(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		User user = navBar(session,m,hsReq);
		if(user==null) return "redirect:/login";
		return "boarder_matching";
	}
//	오시는 길
	@GetMapping("/road")
	public String road(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		navBar(session,m,hsReq);
		return "road";
	}
//	마이페이지
	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model m, HttpServletRequest hsReq) throws Exception{
		User user = navBar(session,m,hsReq);
		if(user==null) return "redirect:/login";
		m.addAttribute("menu","info");
		m.addAttribute("page","show");
		return "myPage";
	}
}
