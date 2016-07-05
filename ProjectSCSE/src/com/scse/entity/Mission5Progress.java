package com.scse.entity;

public class Mission5Progress extends Mission5 {

	private String userId;
	private int left; 
	private int right;
	private int up;
	private int down;
	private int speed;
	private String backgroundSelection;
	private String enemySelection;
	private int hardLife;
	private int hardSpeed;
	private int hardEnemy;
	private int normalLife;
	private int normalSpeed;
	private int normalEnemy;
	private int easyLife;
	private int easySpeed;
	private int easyEnemy;
	private int comboConstraint;
	private int comboBonus;
	private int endingPoint;
	private String codeNum = null;
	private String quizDesc = null;
	
	public Mission5Progress() {
		super();
	}

	public Mission5Progress(int missionIndex, int chapNum, int quizNum,
			String quizHeader, String selectorCode, String userId, int left,
			int right, int up, int down, int speed, String backgroundSelection,
			String enemySelection, int hardLife, int hardSpeed, int hardEnemy,
			int normalLife, int normalSpeed, int normalEnemy, int easyLife,
			int easySpeed, int easyEnemy, int comboConstraint, int comboBonus,
			int endingPoint) {
		super(missionIndex, chapNum, quizNum, quizHeader, selectorCode);
		this.userId = userId;
		this.left = left;
		this.right = right;
		this.up = up;
		this.down = down;
		this.speed = speed;
		this.backgroundSelection = backgroundSelection;
		this.enemySelection = enemySelection;
		this.hardLife = hardLife;
		this.hardSpeed = hardSpeed;
		this.hardEnemy = hardEnemy;
		this.normalLife = normalLife;
		this.normalSpeed = normalSpeed;
		this.normalEnemy = normalEnemy;
		this.easyLife = easyLife;
		this.easySpeed = easySpeed;
		this.easyEnemy = easyEnemy;
		this.comboConstraint = comboConstraint;
		this.comboBonus = comboBonus;
		this.endingPoint = endingPoint;
	}

	public String getCodeNum() {
		return codeNum;
	}

	public void setCodeNum(String codeNum) {
		this.codeNum = codeNum;
	}

	public String getQuizDesc() {
		return quizDesc;
	}

	public void setQuizDesc(String quizDesc) {
		this.quizDesc = quizDesc;
	}

	public int getEndingPoint() {
		return endingPoint;
	}

	public void setEndingPoint(int endingPoint) {
		this.endingPoint = endingPoint;
	}

	public int getComboConstraint() {
		return comboConstraint;
	}

	public void setComboConstraint(int comboConstraint) {
		this.comboConstraint = comboConstraint;
	}

	public int getComboBonus() {
		return comboBonus;
	}

	public void setComboBonus(int comboBonus) {
		this.comboBonus = comboBonus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public int getDown() {
		return down;
	}

	public void setDown(int down) {
		this.down = down;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public String getBackgroundSelection() {
		return backgroundSelection;
	}

	public void setBackgroundSelection(String backgroundSelection) {
		this.backgroundSelection = backgroundSelection;
	}

	public String getEnemySelection() {
		return enemySelection;
	}

	public void setEnemySelection(String enemySelection) {
		this.enemySelection = enemySelection;
	}

	public int getHardLife() {
		return hardLife;
	}

	public void setHardLife(int hardLife) {
		this.hardLife = hardLife;
	}

	public int getHardSpeed() {
		return hardSpeed;
	}

	public void setHardSpeed(int hardSpeed) {
		this.hardSpeed = hardSpeed;
	}

	public int getHardEnemy() {
		return hardEnemy;
	}

	public void setHardEnemy(int hardEnemy) {
		this.hardEnemy = hardEnemy;
	}

	public int getNormalLife() {
		return normalLife;
	}

	public void setNormalLife(int normalLife) {
		this.normalLife = normalLife;
	}

	public int getNormalSpeed() {
		return normalSpeed;
	}

	public void setNormalSpeed(int normalSpeed) {
		this.normalSpeed = normalSpeed;
	}

	public int getNormalEnemy() {
		return normalEnemy;
	}

	public void setNormalEnemy(int normalEnemy) {
		this.normalEnemy = normalEnemy;
	}

	public int getEasyLife() {
		return easyLife;
	}

	public void setEasyLife(int easyLife) {
		this.easyLife = easyLife;
	}

	public int getEasySpeed() {
		return easySpeed;
	}

	public void setEasySpeed(int easySpeed) {
		this.easySpeed = easySpeed;
	}

	public int getEasyEnemy() {
		return easyEnemy;
	}

	public void setEasyEnemy(int easyEnemy) {
		this.easyEnemy = easyEnemy;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mission5Progress [getEndingPoint()=");
		builder.append(getEndingPoint());
		builder.append(", getComboConstraint()=");
		builder.append(getComboConstraint());
		builder.append(", getComboBonus()=");
		builder.append(getComboBonus());
		builder.append(", getUserId()=");
		builder.append(getUserId());
		builder.append(", getLeft()=");
		builder.append(getLeft());
		builder.append(", getRight()=");
		builder.append(getRight());
		builder.append(", getUp()=");
		builder.append(getUp());
		builder.append(", getDown()=");
		builder.append(getDown());
		builder.append(", getSpeed()=");
		builder.append(getSpeed());
		builder.append(", getBackgroundSelection()=");
		builder.append(getBackgroundSelection());
		builder.append(", getEnemySelection()=");
		builder.append(getEnemySelection());
		builder.append(", getHardLife()=");
		builder.append(getHardLife());
		builder.append(", getHardSpeed()=");
		builder.append(getHardSpeed());
		builder.append(", getHardEnemy()=");
		builder.append(getHardEnemy());
		builder.append(", getNormalLife()=");
		builder.append(getNormalLife());
		builder.append(", getNormalSpeed()=");
		builder.append(getNormalSpeed());
		builder.append(", getNormalEnemy()=");
		builder.append(getNormalEnemy());
		builder.append(", getEasyLife()=");
		builder.append(getEasyLife());
		builder.append(", getEasySpeed()=");
		builder.append(getEasySpeed());
		builder.append(", getEasyEnemy()=");
		builder.append(getEasyEnemy());
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}
	
}

