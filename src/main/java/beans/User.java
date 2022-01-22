package beans;

public class User {
	private int id;
	private String username;
	private String mail;
	private String password;
	private int status;
	
	public User(String username, String mail, String password,int status) {
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.status=status;
	}

	public User(int id, String username, String mail, String password,int status) {
		this.id = id;
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.status=status;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", mail=" + mail + ", password=" + password + "]";
	}
	
	
}
