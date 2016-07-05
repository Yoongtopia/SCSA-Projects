package com.scse.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scse.entity.Group;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;
import com.scse.service.GroupService;
import com.scse.service.NoticeService;
import com.scse.service.UserService;

@Controller("GroupController")
public class GroupController {

	private GroupService groupService;
	private UserService userService;
	private NoticeService noticeService;

	@Autowired
	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	// �׷����ȭ������
	@RequestMapping("my_group_management.scse")
	public String myGroupStudent(Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		model.addAttribute("groupList",
				groupService.allMyGroup(user.getUserId()));
		model.addAttribute("list",
				noticeService.viewTabNotice(user.getUserId()));
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		model.addAttribute("MainFrame", "pages/GroupManagement.jsp");
		return "MainScreenForUpdate";
	}

	// �׷�󼼸�����ȭ�� ����
	@RequestMapping("my_group_management_detail.scse")
	public String myGroupManagement(Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		model.addAttribute("list", groupService.allMyStudent(user.getUserId()));
		model.addAttribute("list2", noticeService.viewTabNotice(user.getUserId()));
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		return "GroupManagementFrame";
	}

	// �׷�� �ߺ�üũ �ϴ� ��.
	@RequestMapping("group_name_check_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> groupNameCheck(String groupName) {
		HashMap<String, Object> map = new HashMap<>();
		if(groupService.findGroupByGroupName(groupName)==null){
			map.put("status", true);
		}else{
			map.put("status", false);
		}
		
		return map;
	}

	// �׷����
	@RequestMapping("del_group.scse")
	public String deleteGroup(String groupNum, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int gN = Integer.parseInt(groupNum);
		groupService.removeMyGroup(gN, user.getUserId());
		return "redirect:/my_group_home.scse";
	}

	// �׷쿡�� ȸ������
	@RequestMapping("del_student_from_group_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> deleteStudentFromGroup(String userId) {
		HashMap<String, Object> map = new HashMap<>();
		if (groupService.removeStudentFromGroup(userId)) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;

	}

	// �׷�ȸ�������� �ϱ� ���� �л��� �˻�
	@RequestMapping("search_student_from_school_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> searchStudentFromSchool(String sName,
			String schoolName) {
		HashMap<String, Object> map = new HashMap<>();
		List<Student> list = userService.findStudentList(sName, schoolName);
		if (list.size() > 0) {
			map.put("status", true);
			map.put("list", list);
		} else {
			map.put("status", false);
		}

		return map;
	}

	// �׷쿡 ȸ�� ����
	@RequestMapping("registration_student_in_group.scse")
	@ResponseBody
	public HashMap<String, Object> registerStudentinGroup(String groupNum,
			String userId) {
		HashMap<String, Object> map = new HashMap<>();
		UserGroup userGroup = new UserGroup();
		int gN = Integer.parseInt(groupNum);
	
		userGroup.setGroupNum(gN);
		userGroup.setUserId(userId);
		userGroup.setGroupRole('s');
		groupService.addStudentToGroup(userGroup);
		return map;
	}
	
	//�׷� �ʱ� ����
	@RequestMapping("new_Group.scse")
	public String newGroup(String groupName, String groupType, HttpSession session, Model model){
		User user = (User) session.getAttribute("user");
		int gT = Integer.parseInt(groupType);
		char gtype;
		if(gT == 1){
			gtype = 's';
		} else {
			gtype = 'h';
		}
		groupService.addNewGroup(groupName, gtype, user.getUserId());
		Group group = groupService.findGroupByGroupName(groupName);
		model.addAttribute("groupNum", group.getGroupNum());
		model.addAttribute("groupName", groupName);

		return "redirect:/my_group_info.scse";
	}
	
	//�׷� �л� ���ӿ��� Ȯ��
	@RequestMapping("all_my_student_login.scse")
	@ResponseBody
	public HashMap<String, Object> allMyStudentLogin(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<User> list = groupService.allMyStudentLogin(userId);
		if (list.size() > 0) {
			map.put("status", true);
			map.put("list", list);
		} else {
			map.put("status", false);
		}

		return map;
	}
	
	@RequestMapping("modify_group.scse")
	public String modifyGroup(HttpSession session, String utgroupName, String utgroupType, int utGroupNum, Model model){
		User user = (User) session.getAttribute("user");
		char uT = utgroupType.charAt(0);
		groupService.modifyMyGroup(utGroupNum, utgroupName, uT, user.getUserId());
		return "redirect:/my_group_home.scse";
	}
	
	@RequestMapping("watch_my_student_9mode.scse")
	public String watchMyStudnets9mode (String groupName, int groupNum, Model model, HttpSession session){
		User user = (User) session.getAttribute("user");
		model.addAttribute("list", groupService.allListInMyGroup(groupNum));
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		model.addAttribute("MainFrame", "pages/Div9.jsp");
		model.addAttribute("GroupName", groupName);
		return "MainScreenForUpdate";
	}
	
	//�� �׷츮��Ʈ
	@RequestMapping("my_group_list_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> myGrouList(HttpSession session){
		HashMap<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<Group> glist = groupService.allMyGroup(userId);
		if(glist.size() != 0){
			map.put("status", true);
			map.put("list", glist);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	//���׷� ����ȭ��
	@RequestMapping("my_group_info.scse")
	public String myGroupInfo(HttpSession session, Model model, int groupNum, String groupName) throws Exception{
		model.addAttribute("name", groupName);
		model.addAttribute("noticeList", noticeService.viewNotice(groupNum));
		model.addAttribute("memberList", groupService.allListInMyGroup(groupNum));
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		model.addAttribute("MainFrame", "pages/GroupManagement.jsp");
		
		return "MainScreenForUpdate";
	}
	
	@RequestMapping("my_group_home.scse")
	public String myGroupHome(HttpSession session, Model model){
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		model.addAttribute("mygroup", groupService.allMyGroup(userId));
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		model.addAttribute("MainFrame", "pages/MyGroupList.jsp");
		return "MainScreenForUpdate";
	}
	

}
