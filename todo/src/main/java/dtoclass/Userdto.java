package dtoclass;

import java.util.Arrays;

public class Userdto {
	
	@Override
	public String toString() {
		return "Userdto [uid=" + uid + ", uname=" + uname + ", umail=" + umail + ", contact=" + contact + ", password="
				+ password + ", image=" + Arrays.toString(image) + "]";
	}
	private int uid;
	private String uname;
	private String umail;
	private long contact;
	private String password;
	private byte[] image;
	
	
	public int getUid() {
		return uid;
	}
	
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	

}
