package wilp.dbms.attendancemanagement.model;

/**
 * This is not a DB Entity. This POJO is just to represent the health of the
 * Server.
 * 
 * @author anushibin007
 *
 */
public class HealthState {
	private short dbHealth;
	private short backendServerHealth;
	private short frontendServerHealth;
	private short overallHealth;

	public HealthState(short dbHealth, short backendServerHealth, short frontendServerHealth) {
		super();
		this.dbHealth = dbHealth;
		this.backendServerHealth = backendServerHealth;
		this.frontendServerHealth = frontendServerHealth;
	}

	public short getDbHealth() {
		return dbHealth;
	}

	public void setDbHealth(short dbHealth) {
		this.dbHealth = dbHealth;
	}

	public short getBackendServerHealth() {
		return backendServerHealth;
	}

	public void setBackendServerHealth(short backendServerHealth) {
		this.backendServerHealth = backendServerHealth;
	}

	public short getFrontendServerHealth() {
		return frontendServerHealth;
	}

	public void setFrontendServerHealth(short frontendServerHealth) {
		this.frontendServerHealth = frontendServerHealth;
	}

	public short getOverallHealth() {
		overallHealth = (short) ((dbHealth + backendServerHealth + frontendServerHealth) / 3);
		return overallHealth;
	}

	public void setOverallHealth(short overallHealth) {
		this.overallHealth = overallHealth;
	}

}
