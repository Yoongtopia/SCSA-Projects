package com.orakgarak.util;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.math3.stat.descriptive.DescriptiveStatistics;

import com.orakgarak.vo.Trend;
import com.orakgarak.vo.TrendData;

public class MathValues {

	public static HashMap<Integer, Double> zValueMap = new HashMap<>();
	
	static{
		
		zValueMap.put(99,2.326347874);
		zValueMap.put(98,2.053748911);
		zValueMap.put(97,1.880793608);
		zValueMap.put(96,1.750686071);
		zValueMap.put(95,1.644853627);
		zValueMap.put(94,1.554773595);
		zValueMap.put(93,1.475791028);
		zValueMap.put(92,1.40507156);
		zValueMap.put(91,1.340755034);
		zValueMap.put(90,1.281551566);
		zValueMap.put(89,1.22652812);
		zValueMap.put(88,1.174986792);
		zValueMap.put(87,1.126391129);
		zValueMap.put(86,1.080319341);
		zValueMap.put(85,1.036433389);
		zValueMap.put(84,0.994457883);
		zValueMap.put(83,0.954165253);
		zValueMap.put(82,0.915365088);
		zValueMap.put(81,0.877896295);
		zValueMap.put(80,0.841621234);
		zValueMap.put(79,0.806421247);
		zValueMap.put(78,0.772193214);
		zValueMap.put(77,0.738846849);
		zValueMap.put(76,0.706302563);
		zValueMap.put(75,0.67448975);
		zValueMap.put(74,0.643345405);
		zValueMap.put(73,0.612812991);
		zValueMap.put(72,0.582841507);
		zValueMap.put(71,0.55338472);
		zValueMap.put(70,0.524400513);
		zValueMap.put(69,0.495850347);
		zValueMap.put(68,0.467698799);
		zValueMap.put(67,0.439913166);
		zValueMap.put(66,0.412463129);
		zValueMap.put(65,0.385320466);
		zValueMap.put(64,0.358458793);
		zValueMap.put(63,0.331853346);
		zValueMap.put(62,0.305480788);
		zValueMap.put(61,0.279319034);
		zValueMap.put(60,0.253347103);
		zValueMap.put(59,0.227544977);
		zValueMap.put(58,0.201893479);
		zValueMap.put(57,0.176374165);
		zValueMap.put(56,0.150969215);
		zValueMap.put(55,0.125661347);
		zValueMap.put(54,0.100433721);
		zValueMap.put(53,0.075269862);
		zValueMap.put(52,0.050153583);
		zValueMap.put(51,0.025068908);

		
	}//end static
	
	//표준편차 구하는 공식임
	public static double getStd(Trend trend){
		ArrayList<TrendData> list = (ArrayList<TrendData>) trend.getTrendDatalist();
		double sum = 0;
		double average = 0;
		double var = 0;
		for(TrendData i : list){
			sum += i.getGrowthRate();
		}//end for
		
		average = sum / trend.getTrendDatalist().size();
		
		System.out.println("average : " + average);
		
		for(TrendData i : list){
			var += ((average-i.getGrowthRate())*(average-i.getGrowthRate()));
		}
		
		var = var/list.size();
		System.out.println(Math.sqrt(var));
		return Math.sqrt(var);
		
	}//end getStd
	
	
}
