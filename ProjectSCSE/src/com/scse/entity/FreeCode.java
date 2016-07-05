package com.scse.entity;


public class FreeCode {

	
	private int codeNum;
	private String codeName;
	private String codeDate;
	private int codeHit;
	private int codeLike;
	private String resultImg;
	private String userId;
		
	private User freeUser;
	private School freeUserSchool;
	private UserGroup freeUserGroup;
	
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
	
	public UserGroup getFreeUserGroup() {
		return freeUserGroup;
	}

	public void setFreeUserGroup(UserGroup freeUserGroup) {
		this.freeUserGroup = freeUserGroup;
	}

	public User getFreeUser() {
		return freeUser;
	}

	public School getFreeUserSchool() {
		return freeUserSchool;
	}

	public void setFreeUserSchool(School freeUserSchool) {
		this.freeUserSchool = freeUserSchool;
	}

	public void setFreeUser(User freeUser) {
		this.freeUser = freeUser;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getResultImg() {
		return resultImg;
	}

	public void setResultImg(String resultImg) {
		this.resultImg = resultImg;
	}

	public String getCodeDate() {
		return codeDate;
	}

	public void setCodeDate(String codeDate) {
		this.codeDate = codeDate;
	}

	public int getCodeNum() {
		return codeNum;
	}

	public void setCodeNum(int codeNum) {
		this.codeNum = codeNum;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public int getCodeHit() {
		return codeHit;
	}

	public void setCodeHit(int codeHit) {
		this.codeHit = codeHit;
	}

	public int getCodeLike() {
		return codeLike;
	}

	public void setCodeLike(int codeLike) {
		this.codeLike = codeLike;
	}

	public FreeCode() {
		super();
	}

	public FreeCode(int codeNum, String codeName, String codeDate, int codeHit,
			int codeLike, String resultImg, String userId, User freeUser,
			School freeUserSchool, UserGroup freeUserGroup, int left,
			int right, int up, int down, int speed, String backgroundSelection,
			String enemySelection, int hardLife, int hardSpeed, int hardEnemy,
			int normalLife, int normalSpeed, int normalEnemy, int easyLife,
			int easySpeed, int easyEnemy, int comboConstraint, int comboBonus,
			int endingPoint) {
		super();
		this.codeNum = codeNum;
		this.codeName = codeName;
		this.codeDate = codeDate;
		this.codeHit = codeHit;
		this.codeLike = codeLike;
		this.resultImg = resultImg;
		this.userId = userId;
		this.freeUser = freeUser;
		this.freeUserSchool = freeUserSchool;
		this.freeUserGroup = freeUserGroup;
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

	public int getEndingPoint() {
		return endingPoint;
	}

	public void setEndingPoint(int endingPoint) {
		this.endingPoint = endingPoint;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FreeCode [getFreeUserGroup()=");
		builder.append(getFreeUserGroup());
		builder.append(", getFreeUser()=");
		builder.append(getFreeUser());
		builder.append(", getFreeUserSchool()=");
		builder.append(getFreeUserSchool());
		builder.append(", getUserId()=");
		builder.append(getUserId());
		builder.append(", getResultImg()=");
		builder.append(getResultImg());
		builder.append(", getCodeDate()=");
		builder.append(getCodeDate());
		builder.append(", getCodeNum()=");
		builder.append(getCodeNum());
		builder.append(", getCodeName()=");
		builder.append(getCodeName());
		builder.append(", getCodeHit()=");
		builder.append(getCodeHit());
		builder.append(", getCodeLike()=");
		builder.append(getCodeLike());
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
		builder.append(", getComboConstraint()=");
		builder.append(getComboConstraint());
		builder.append(", getComboBonus()=");
		builder.append(getComboBonus());
		builder.append(", getEndingPoint()=");
		builder.append(getEndingPoint());
		builder.append("]");
		return builder.toString();
	}
	
}