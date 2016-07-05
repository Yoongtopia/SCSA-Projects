package com.scse.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scse.entity.Leader;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserCharacter;
import com.scse.service.CharacterService;
import com.scse.service.GroupService;
import com.scse.service.UserService;

@Controller("UserController")
public class UserController {

	private UserService userService;
	private GroupService groupService;
	private CharacterService characterService;

	@Autowired
	public void setCharacterService(CharacterService characterService) {
		this.characterService = characterService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	// ���ο����ּ�
	@RequestMapping("ProjectSCSE.scse")
	public String goHome() {
		return "introFrame";
	}

	// ȸ������������ �̵�
	@RequestMapping("registerForm.scse")
	public String registerForm(char uType, Model model) throws Exception {
		model.addAttribute("uType", uType);
		model.addAttribute("header", "pages/HF/header.jsp");
		model.addAttribute("page", "pages/Registration_Form.jsp");
		model.addAttribute("characterlist", characterService.allCharacter());

		return "introFrame";
	}

	// ȸ������
	@RequestMapping("register.scse")
	public String register(HttpServletRequest request, char uType,
			String userId, String phone, String password, String email,
			String temail, String schoolNum, String grade, String sName,
			String cha_checked, Model model) throws Exception {
		Leader leader = new Leader();
		if (uType == 't') {
			leader.setUserId(userId);
			leader.setPassword(password);
			leader.setsName(sName);
			leader.setPhone(phone);
			leader.setSchoolNum(schoolNum);
			leader.setEmail(temail);
			leader.setIp("not used, Only for Student");
			// ������ �Ⱥ������� ���Ƴ���.
			// String randomCode = randomNumberGenerator();
			leader.setConf("y");

			userService.addTeacher(leader);
			// SendingEmail(request, userId, temail, randomCode);

		} else if (uType == 'p') {
			leader.setUserId(userId);
			leader.setPassword(password);
			leader.setsName(sName);
			leader.setPhone(phone);
			leader.setSchoolNum(schoolNum);
			leader.setEmail(email);
			leader.setIp("not used, Only for Student");

			// String randomCode = randomNumberGenerator();
			leader.setConf("y");

			userService.addParent(leader);

			// SendingEmail(request, userId, email, randomCode);

		} else if (uType == 's') {
			Student student = new Student();
			student.setUserId(userId);
			student.setPassword(password);
			student.setsName(sName);
			student.setSchoolNum(schoolNum);
			int ng = Integer.parseInt(grade);
			student.setGrade(ng);
			student.setIp("will be updated when loign");
			int ck = Integer.parseInt(cha_checked);

			userService.addStudent(student, ck);

		}
		return "redirect:/ProjectSCSE.scse";
	}

	// �б��˻�
	@RequestMapping("search_School_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> searchSchool(String schoolName) {
		HashMap<String, Object> map = new HashMap<>();
		List<School> list = userService.viewSchoolListBySchoolName(schoolName);
		if (list.size() > 0) {
			map.put("list", list);
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}

	// �α���
	@RequestMapping("login_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> login(String userId, String password,
			HttpSession session, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			User user = (User) userService.logonUser(userId, password).get("user");
			int attendanceCheck = (int) userService.logonUser(userId, password)
					.get("attendanceCheck");
			ArrayList<UserCharacter> chaList = (ArrayList<UserCharacter>) userService
					.logonUser(userId, password).get("myCharacters");
			if (user.getuType() == 's') {
				HashMap<String, String> chaMap = new HashMap<String, String>();
				for (UserCharacter cha : chaList) {
					chaMap.put(cha.getCharacter().getChaName(), cha
							.getCharacter().getChaName());
					//ip������Ʈ
					userService.updateIp(userId, ipShow());
				}
				session.setAttribute("chaMap", chaMap);
				map.put("chaMap", chaMap);
				map.put("uType", "s");
			} else {
				map.put("uType", "l");
			}
			if (user != null) {
				map.put("status", true);
				map.put("user", user);
				map.put("attendanceCheck", attendanceCheck);
				session.setAttribute("user", user);
			} else {
				map.put("status", false);
			}
			// ĳ�������� ��������.

			session.setAttribute("characterInfo",
					characterService.viewOneUserCharacter(userId));
			session.setAttribute("groupInfo",
					groupService.allMyListGroup(userId));
		} catch (Exception e) {
			e.printStackTrace();
		}

		

		return map;
	}

	// �α׾ƿ�
	@RequestMapping("logout.scse")
	public String logout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		session.invalidate();
		userService.logOutUser(user.getUserId());
		return "redirect:/ProjectSCSE.scse";
	}

	// ���������� ����
	@RequestMapping("myPage.scse")
	public String MyPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		char uType = user.getuType();
		model.addAttribute("user", user);
		model.addAttribute("uType", uType);
		// �л��̶��
		if (uType == 's') {
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
			model.addAttribute("MainFrame", "pages/UserUpdate.jsp");
			// ������, �кθ���
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
			model.addAttribute("MainFrame", "pages/UserUpdate.jsp");
			model.addAttribute("groupStudentList",
					groupService.allMyStudentLogin(user.getUserId()));
			model.addAttribute("groupList",
					groupService.allMyGroup(user.getUserId()));
			//model.addAttribute("domain", userService.emailDomain(user.getUserLeader().getEmail(), user.getUserId()));
		}
		return "MainScreenForUpdate";
	}

	// ȸ����������
	@RequestMapping("updateUser.scse")
	public String updateUser(HttpSession session, String password,
			String sname, int grade, String email, String temail, String phone,
			String schoolNum, Model model) {
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		if (user.getuType() == 't') {
			userService.modifyUser(password, sname, grade, temail, phone,
					schoolNum, userId);
		} else {
			userService.modifyUser(password, sname, grade, email, phone,
					schoolNum, userId);
		}

		return "redirect:/logout.scse";
	}

	// ȸ�� Ż��
	@RequestMapping("removeUser.scse")
	public String remove(String userId, HttpSession session) throws Exception {
		userService.removeUser(userId);
		session.invalidate();
		return "redirect:/ProjectSCSE.scse";
	}

	// ����Ȯ��������
	@RequestMapping("VerifiyngEmail.scse")
	public String veryfingEmail(Model model, String randomCode, String userId,
			String email) {
		if (userService.modifyUserVerifying(randomCode, userId, email)) {
			model.addAttribute("status", "������ �����Ͽ����ϴ�.");
		} else {
			model.addAttribute("status", "�������� �Ф�");
		}
		return "emailConfirmationPage";
	}

	// ȸ�� ���Խ� ���̵� �ߺ�üũ
	@RequestMapping("userId_check_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> userIdCheck(String userId) {
		HashMap<String, Object> map = new HashMap<>();
		if (userService.findIdByUserId(userId) == null) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}

		return map;
	}

	// ���Ϻ�����
	private void SendingEmail(HttpServletRequest request, String userId,
			String email, String randomCode) {

		final String username = "sulgibravo@gmail.com"; // ���� ����Ʈ ���� ����
		final String password = "sulgisulgi"; // ���� ����Ʈ ���� ���� ��й�ȣ

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// �̸�������
			String subject = "����ο� �ڵ��� ���� �����Դϴ�.�ش縵ũ�� �����ø� ������ �Ϸ�˴ϴ�.";
			// ���� �ÿ��� �̸��� �ּҸ� �޸��ؾ���.
			// �����ξ��� ��ǻ�� �ּҷ� �ϱ� �ٶ�. �ϴ��� LocalHost�� �ϰ���
			String content = "http://localhost:9090/ProjectSCSE/VerifiyngEmail.scse?randomCode="
					+ randomCode + "&userId=" + userId + "&email=" + email;
			String from = email;

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(from));
			message.setSubject(subject);
			message.setText(content);
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// �������� ���׷�����
	private String randomNumberGenerator() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}

	// �α��� ������ ���̴� ��
	public String ipShow() {
		String ip = "";
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return ip;
	}

}
