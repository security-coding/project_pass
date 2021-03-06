package com.pknu.pass.login.dto;

public class LoginDto {
    public static final int SUCCESS = 1;
    public static final int FAIL = 0;

    private String id;
    private String password;
    private String email;
    private String certKey;
    private int certify;
    private String profile;
    private int grade;
    private String address;
    private String detailAddress;
    private String la;
    private String lo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCertKey() {
        return certKey;
    }

    public void setCertKey(String certKey) {
        this.certKey = certKey;
    }

    public int getCertify() {
        return certify;
    }

    public void setCertify(int certify) {
        this.certify = certify;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getLa() {
        return la;
    }

    public void setLa(String la) {
        this.la = la;
    }

    public String getLo() {
        return lo;
    }

    public void setLo(String lo) {
        this.lo = lo;
    }

    @Override
    public String toString() {
        return "LoginDto [id=" + id + ", password=" + password + ", email=" + email + ", certKey=" + certKey
                + ", certify=" + certify + ", profile=" + profile + ", grade=" + grade + ", address=" + address
                + ", detailAddress=" + detailAddress + ", la=" + la + ", lo=" + lo + "]";
    }


}
	