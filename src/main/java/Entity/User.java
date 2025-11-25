package Entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Users")
public class User {

    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Password")
    private String password;

    @Column(name = "Fullname")
    private String fullname;

    @Column(name = "Email", unique = true) // email là duy nhất
    private String email;

    @Column(name = "Admin")
    private Boolean admin;

    // Quan hệ One-to-Many
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    List<Favorite> favorites;

    @OneToMany(mappedBy = "user")
    List<Share> shares;

    // Constructor không tham số (Bắt buộc cho JPA)
    public User() {
    }

    // Getters
    public String getId() { return id; }
    public String getPassword() { return password; }
    public String getFullname() { return fullname; }
    public String getEmail() { return email; }
    public Boolean getAdmin() { return admin; }
    public List<Favorite> getFavorites() { return favorites; }
    public List<Share> getShares() { return shares; }

    // Setters
    public void setId(String id) { this.id = id; }
    public void setPassword(String password) { this.password = password; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public void setEmail(String email) { this.email = email; }
    public void setAdmin(Boolean admin) { this.admin = admin; }
    public void setFavorites(List<Favorite> favorites) { this.favorites = favorites; }
    public void setShares(List<Share> shares) { this.shares = shares; }
}