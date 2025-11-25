package Entity;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Share")
public class Share {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long id;

    @Column(name = "Emails")
    private String emails;

    @Temporal(TemporalType.DATE)
    @Column(name = "ShareDate")
    private Date shareDate;

    // Quan hệ Many-to-One: Khóa ngoại UserId
    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    // Quan hệ Many-to-One: Khóa ngoại VideoId
    @ManyToOne
    @JoinColumn(name = "VideoId")
    private Video video;

    // Constructor không tham số
    public Share() {
    }

    // Getters
    public Long getId() { return id; }
    public String getEmails() { return emails; }
    public Date getShareDate() { return shareDate; }
    public User getUser() { return user; }
    public Video getVideo() { return video; }

    // Setters
    public void setId(Long id) { this.id = id; }
    public void setEmails(String emails) { this.emails = emails; }
    public void setShareDate(Date shareDate) { this.shareDate = shareDate; }
    public void setUser(User user) { this.user = user; }
    public void setVideo(Video video) { this.video = video; }
}