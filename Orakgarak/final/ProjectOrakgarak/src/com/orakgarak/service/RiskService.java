package com.orakgarak.service;

import com.orakgarak.vo.Risk;
import com.orakgarak.vo.Trend;

public interface RiskService {
	
	public Risk getRiskValue(Trend trend, String code, int confidence, long asset, int days);
	
	//�ι� ���ͳ������� ���� �ʱ����ؼ� ���ʹ� �ٸ��� �ٷ� ǥ�������� �༭ ���ϴ�
	//������� getRiskValue()�� �����ε��Ǿ�����
	public Risk getRiskValue(double stdev, String code, int confidence, long asset, int days);
	
	
}
