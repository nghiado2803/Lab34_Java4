package Entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Video")
public class Video {

    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Title")
    private String title;

    @Column(name = "Poster")
    private String poster;

    @Column(name = "Views")
    private Integer views;

    @Column(name = "Description")
    private String description;

    @Column(name = "Active")
    private Boolean active;

    // Quan hệ One-to-Many
    @OneToMany(mappedBy = "video")
    List<Favorite> favorites;

    @OneToMany(mappedBy = "video")
    List<Share> shares;

    // Constructor không tham số
    public Video() {
    }

    // Getters
    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getPoster() { return poster; }
    public Integer getViews() { return views; }
    public String getDescription() { return description; }
    public Boolean getActive() { return active; }
    public List<Favorite> getFavorites() { return favorites; }
    public List<Share> getShares() { return shares; }

    // Setters
    public void setId(String id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setPoster(String poster) { this.poster = poster; }
    public void setViews(Integer views) { this.views = views; }
    public void setDescription(String description) { this.description = description; }
    public void setActive(Boolean active) { this.active = active; }
    public void setFavorites(List<Favorite> favorites) { this.favorites = favorites; }
    public void setShares(List<Share> shares) { this.shares = shares; }
}