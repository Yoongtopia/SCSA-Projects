package com.orakgarak.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.RiskService;
import com.orakgarak.service.TrendService;
import com.orakgarak.vo.Risk;
import com.orakgarak.vo.Trend;

@Controller
public class RiskController {

	private RiskService riskService;
	private TrendService trendService;

	@Autowired
	public void setRiskService(RiskService riskService) {
		this.riskService = riskService;
	}

	@Autowired
	public void setTrendService(TrendService trendService) {
		this.trendService = trendService;
	}

	@RequestMapping("/risk.do")
	public String risk(String code, Model model) {
		model.addAttribute("code", code);
		System.out.println(code);
		return "pentagon/risk";

	}// end risk()

	// risk와 트렌드 데이터도 같이 보내기 위해 아래와 같은 복잡한 해쉬맵을 쓰게됨
	// 표준편차등은 기본값으로 세팅됨
	@RequestMapping("/getRisk.do")
	@ResponseBody
	public HashMap<String, Object> getRisk(String code) {

		Trend trend = null;

		try {
			trend = trendService.getTrendValue(code);
			trend = trendService.analyzeAndPackTrend(trend);

			Risk risk = new Risk();
			// 99% 유의확률과, 100만원, 100일동안의 통계치가 그냥 기준임 (사실 생성자에도 세팅되어있음)
			risk = riskService.getRiskValue(trend, code, 5, 10000, 10);

			HashMap<String, Object> map = new HashMap<>();
			map.put("risk", risk);
			map.put("trend", trend);
			map.put("status", true);

			return map;

		} catch (Exception e) {
			e.printStackTrace();
			HashMap<String, Object> map = new HashMap<>();
			map.put("status", false);
			return map;
		}

	}// end getRisk()

	@RequestMapping("/recalculateRisk.do")
	@ResponseBody
	public Risk recalculateRisk(double stdev, String code, int confidence,
			long asset, int days) {

		Risk risk = riskService.getRiskValue(stdev, code, confidence, asset,
				days);
		return risk;

	}// end recalculateRisk()

}// end public class
