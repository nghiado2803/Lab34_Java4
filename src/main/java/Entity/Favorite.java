package Entity;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Favorite", uniqueConstraints = {
        // Đảm bảo cặp UserId và VideoId là duy nhất
        @UniqueConstraint(columnNames = {"UserId", "VideoId"})
})
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    @Temporal(TemporalType.DATE)
    @Column(name = "LikeDate")
    private Date likeDate;

    // Quan hệ Many-to-One: Khóa ngoại UserId
    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    // Quan hệ Many-to-One: Khóa ngoại VideoId
    @ManyToOne
    @JoinColumn(name = "VideoId")
    private Video video;

    // Constructor không tham số
    public Favorite() {
    }

    // Getters
    public Long getId() { return id; }
    public Date getLikeDate() { return likeDate; }
    public User getUser() { return user; }
    public Video getVideo() { return video; }

    // Setters
    public void setId(Long id) { this.id = id; }
    public void setLikeDate(Date likeDate) { this.likeDate = likeDate; }
    public void setUser(User user) { this.user = user; }
    public void setVideo(Video video) { this.video = video; }
}